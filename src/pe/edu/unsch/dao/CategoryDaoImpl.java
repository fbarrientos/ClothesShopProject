package pe.edu.unsch.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import pe.edu.unsch.entities.Category;

@Repository("categoryDao")
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Category> findAll() {
		return sessionFactory.getCurrentSession().createQuery("from Category where parentid=0").list();
	}
	
	@Override
	public Category find(Integer id) {
		return (Category) sessionFactory.getCurrentSession()
				.get(Category.class, id);
	}

}
