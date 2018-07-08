package pe.edu.unsch.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import pe.edu.unsch.entities.*;
import pe.edu.unsch.service.*;

@Controller
@RequestMapping("cart")
public class CartController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private OrdersDetailService ordersDetailService;
	
	@Autowired
	private AccountService accountService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("title", "Cart");
		modelMap.put("action", "cart");
		return "cart.index";
	}

	@RequestMapping(value = "buy/{id}", method = RequestMethod.GET)
	public String add(@PathVariable("id") int id, HttpSession session, ModelMap modelMap) {
		modelMap.put("title", "Cart");
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(productService.find(id), 1));
			session.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			int index = isExists(id, session);
			if (index == -1)
				cart.add(new Item(productService.find(id), 1));
			else {
				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
				session.setAttribute("cart", cart);
			}
			session.setAttribute("cart", cart);
		}
		return "cart.index";
	}

	@RequestMapping(value = "delete/{index}", method = RequestMethod.GET)
	public String delete(@PathVariable("index") int index, HttpSession session) {
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/cart.htm";
	}

	private int isExists(int id, HttpSession session) {
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		for (int i = 0; i < cart.size(); i++)
			if (cart.get(i).getProduct().getIdproduct() == id)
				return i;
		return -1;
	}
	
	@RequestMapping(value = "checkout", method = RequestMethod.GET)
	public String checkout(HttpSession session, ModelMap modelMap) {
		modelMap.put("title", "Checkout");
		modelMap.addAttribute("account", new Account());
		if (session.getAttribute("username") == null) {
			System.out.println("Estoy aquí!!");
			return "account.register";
		} else {
			// Guardar Orden
			Orders orders = new Orders();
			orders.setAccount(accountService.find(session.getAttribute("username").toString()));
			System.out.println(session.getAttribute("username").toString());
			orders.setDatecreation(new Date());
			orders.setName("New order");
			orders.setStatus(false);
			
			Orders newOrder = ordersService.create(orders);
			
			// Guardar Detalle del orden
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			for(Item item : cart) {
				System.out.println("Orders detail " + newOrder.getIdorders());
				Ordersdetail ordersdetail = new Ordersdetail();
				ordersdetail.setOrders(newOrder);
				ordersdetail.setProduct(item.getProduct());
				ordersdetail.setPrice(item.getProduct().getPrice());
				ordersdetail.setQuantity(item.getQuantity());
				
				ordersDetailService.create(ordersdetail);
			}
			
			// Limpiar carrito
			session.removeAttribute("cart");
			
			return "account.customer-orders";
		}
		
	}
}
