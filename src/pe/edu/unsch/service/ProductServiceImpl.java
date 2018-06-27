package pe.edu.unsch.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.edu.unsch.dao.*;
import pe.edu.unsch.entities.*;

@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private  ProductDao productDAO;
	
	@Override
	public Product find(Integer id) {
		return  productDAO.find(id);
	}

	@Override
	public List<Product> featured(int n) {
		return productDAO.featured(n);
	}

	@Override
	public List<Product> latest(int n) {
		return productDAO.featured(n);
	}

	@Override
	public List<Product> findByName(String name) {
		return productDAO.findByName(name);
	}

}
