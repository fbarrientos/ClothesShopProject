package pe.edu.unsch.service;

import java.util.*;

import pe.edu.unsch.entities.*;

public interface CategoryService {
	
	public List<Category> findAll();
	public Category find(Integer id);
	public List<Category> findAllCat();
	public  void  create(Category category);

}
