package pe.edu.unsch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import pe.edu.unsch.service.*;

@Controller
@RequestMapping("home")
public class HomeController {
	
	@Autowired
    CategoryService categoryService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("title", "Home");
		modelMap.put("action", "home");
		//modelMap.put("categories", categoryService.findAll());
		modelMap.put("featuredProducts", productService.featured(5));
		return "home.index";
	}

}
