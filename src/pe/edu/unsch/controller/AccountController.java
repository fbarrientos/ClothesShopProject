package pe.edu.unsch.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import pe.edu.unsch.entities.*;
import pe.edu.unsch.service.*;

@Controller
@RequestMapping("account")
public class AccountController {

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		modelMap.put("title", "New account");
		modelMap.put("action", "register");
		modelMap.put("account", new Account());
		return "account.register";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@ModelAttribute("account") Account account, ModelMap modelMap) {
		modelMap.put("title", "Register");
		modelMap.put("action", "register");
		try {
			accountService.create(account);
			modelMap.put("message", "La cuenta fue creada correctamente");
			return "account.register";
		} catch (Exception e) {
			modelMap.put("message", "No  puede  registrar  nueva  cuenta");
			return "account.register";
		}
	}

	@RequestMapping(value = "myaccount", method = RequestMethod.POST)
	public String myaccount(HttpServletRequest request, HttpSession session, ModelMap modelMap) {
		modelMap.put("title", "My account");
		modelMap.addAttribute("account", new Account());
		Account account = this.accountService.login(request.getParameter("username"), request.getParameter("password"));

		if (account == null) {
			modelMap.put("error", "Cuenta  inválida");
			return "account.register";
		} else {
			session.setAttribute("username", account.getUsername());
			return "account.customer-orders";
		}
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("username");
		return "redirect:/account/register.htm";
	}

}
