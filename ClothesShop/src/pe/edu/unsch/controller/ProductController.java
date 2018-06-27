package pe.edu.unsch.controller;

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

}
