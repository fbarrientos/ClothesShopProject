package pe.edu.unsch.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import pe.edu.unsch.entities.*;
import pe.edu.unsch.service.*;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private BrandService brandService;
	
	@Autowired
	private ColourService colourService;
	
	@Autowired
	private ProductService productService;

	@RequestMapping(value = "category/{id}", method = RequestMethod.GET)
	public String category(@PathVariable("id") Integer id, ModelMap modelMap) {
		Category category = categoryService.find(id);
		modelMap.put("title", "Categories");
		modelMap.put("categories", categoryService.findAll());
		modelMap.put("brands", brandService.findAll());
		modelMap.put("colours", colourService.findAll());
		modelMap.put("products", category.getProducts());
		modelMap.put("action", "category");
		return "product.category";
	}

	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable("id") Integer id, ModelMap modelMap) {
		modelMap.put("title", "Product  detail");
		modelMap.put("categories", categoryService.findAll());
		modelMap.put("brands", brandService.findAll());
		modelMap.put("colours", colourService.findAll());
		modelMap.put("product", productService.find(id));
		modelMap.put("productsLatest", productService.latest(3));
		return "product.detail";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(ModelMap modelMap) {
		modelMap.put("title", "Search Product");
		//List<Product> products = productService.findByName(name);
		System.out.println("Holaaa vista search");
		return "product.search";
	}
	
	@RequestMapping(value="search/json/search", produces="application/json")
	@ResponseBody
	public Map<String, Object> findAll(@RequestParam("term") String nombreProduct) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("Estoy aquí");
		List<Product> products = productService.findByName(nombreProduct);
		
		for (int i = 0; i < products.size(); i++) {
			Product product = products.get(i);
			map.put("nombre" + i, product.getIdproduct() + " " + product.getName());
		}
		System.out.println(map.toString());
		
		return map;
	}
	
	/*@RequestMapping(value="/searchJSON", produces="application/json")
	@ResponseBody
	public Map<String, Object> findAll(@RequestParam("term") String name) {
		System.out.println("Estoy aquí");
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Product> products = productService.findByName(name);
		
		for (int i = 0; i < products.size(); i++) {
			Product product = products.get(i);
			map.put("name" + i, product.getIdproduct() + " " + product.getName());
		}
		System.out.println(map.toString());
		
		return map;
	}*/
	
	/*@RequestMapping(value="search", method=RequestMethod.GET)
	@ResponseBody
    public ModelAndView findAll(@RequestParam("term") String name) {
		System.out.println("Que va: " + name);
        ModelAndView mav = new ModelAndView();
        List<Product> products = productService.findByName(name);
        System.out.println(products.size());
        mav.addObject("search", products);
        return mav;
    }*/
}
