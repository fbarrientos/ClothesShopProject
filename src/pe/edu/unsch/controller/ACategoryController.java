package pe.edu.unsch.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import pe.edu.unsch.entities.*;
import pe.edu.unsch.service.*;
import pe.edu.unsch.util.*;

@Controller
@RequestMapping("/admin/category")
public class ACategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	JsonResponse jsonResponse;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpSession session, ModelMap modelMap) {
		modelMap.put("title", "Admin category");
		modelMap.put("categories", categoryService.findAll());
		return "category.index";
	}
	
	@RequestMapping(value = "/categoriesJSON", method = RequestMethod.GET)
    @ResponseBody
    public ManagerDatatables getCategoriesJSON(HttpServletRequest request, HttpServletResponse response) {
		return getCategoryDatatables(request, response);
    }
	
	private ManagerDatatables getCategoryDatatables(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.print("Que pasa aquí?");
        ManagerDatatables managerDatatables = new ManagerDatatables();
        DataTablesParam dataTablesParam = DataTablesParamUtility.getParam(request);
        List<Category> categories = categoryService.findAll();
        
        managerDatatables.setiTotalRecords(0);

        for (int i = 0; i <= categories.size() - 1; ++i) {
        	Category p = categories.get(i);
            if (String.valueOf(p.getIdcategory()).toLowerCase().contains(dataTablesParam.sSearch.toLowerCase())
                    ||p.getName().toLowerCase().contains(dataTablesParam.sSearch.toLowerCase())
                    || p.getStatus().toString().toLowerCase().contains(dataTablesParam.sSearch.toLowerCase())
                    || p.getParentid().toString().toLowerCase().contains(dataTablesParam.sSearch.toLowerCase())) {
            } else {
            	categories.remove(i);
                i = i - 1;
            }
        }

        final int sortColumnIndex = dataTablesParam.iSortColumnIndex;
        System.out.println(sortColumnIndex);
        final int sortDirection = dataTablesParam.sSortDirection.equals("desc") ? -1 : 1;
        System.out.println(sortDirection);
        
        Collections.sort(categories, new Comparator<Category>() {
            @Override
            public int compare(Category o1, Category o2) {
                switch (sortColumnIndex) {
                    case 0:
                    	System.out.println("case 0: " +((Integer)o1.getIdcategory()).compareTo(o2.getIdcategory()) * sortDirection);
                        return ((Integer)o1.getIdcategory()).compareTo(o2.getIdcategory()) * sortDirection;
                    case 1:
                        return o1.getName().toLowerCase().compareTo(o2.getName().toLowerCase()) * sortDirection;
                    case 2:
                        return o1.getStatus().toString().toLowerCase().compareTo(o2.getStatus().toString().toLowerCase()) * sortDirection;
                    case 3:
                        return o1.getParentid().toString().toLowerCase().compareTo(o2.getParentid().toString().toLowerCase()) * sortDirection;
                }
                return 0;
            }
        });

        managerDatatables.setiTotalDisplayRecords(categories.size());

        if (categories.size() < dataTablesParam.iDisplayStart + dataTablesParam.iDisplayLength) {
        	categories = categories.subList(dataTablesParam.iDisplayStart, categories.size());
        } else {
        	categories = categories.subList(dataTablesParam.iDisplayStart, dataTablesParam.iDisplayStart + dataTablesParam.iDisplayLength);
        }

        managerDatatables.setsEcho(dataTablesParam.sEcho);
        managerDatatables.setAaData(categories);

        return managerDatatables;
    }
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse registrarCategory(@RequestBody Category category) {
		System.out.println("Holaaaaaa");
        try {
            categoryService.create(category);
            jsonResponse = new JsonResponse();
            jsonResponse.respuestaInsertar();
        } catch (Exception e) {
        	e.getMessage();
        }

        return jsonResponse;
    }

}
