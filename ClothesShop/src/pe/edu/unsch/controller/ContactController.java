package pe.edu.unsch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("contact")
public class ContactController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("title", "Contact");
		return "contact.index";
	}
	/*@RequestMapping(method=RequestMethod.GET)
    public ModelAndView getSubView(Model model) {
        model.addAttribute("title", "Contact");
        return new ModelAndView("contact.index");
    }*/

}
