package pe.edu.unsch.dao;

import java.util.*;

import pe.edu.unsch.entities.*;

public interface CategoryDao {
	
	public List<Category> findAll();
	public Category find(Integer id);
	public List<Category> findAllCat();
	public  void  create(Category category);
	
}
