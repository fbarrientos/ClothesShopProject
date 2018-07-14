package pe.edu.unsch.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pe.edu.unsch.entities.*;
import pe.edu.unsch.service.UserService;

@Controller
@RequestMapping("admin")
public class ALoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(ModelMap modelMap) {
		modelMap.put("title", "Login");
		modelMap.put("user", new User());
		return "login.index";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpSession session, ModelMap modelMap) {
		modelMap.put("title", "Admin main");
		modelMap.addAttribute("user", new User());
		User user = this.userService.login(request.getParameter("username"), request.getParameter("password"));

		if (user == null) {
			modelMap.put("error", "Cuenta  inválida");
			return "login.index";
		} else {
			session.setAttribute("usernameStart", user.getUsername());
			return "main.index";
		}
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("usernameStart");
		return "redirect:/admin/login";
	}

}
