package pe.edu.unsch.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import pe.edu.unsch.entities.Category;

@Repository("categoryDao")
public class CategoryDaoImpl implements CategoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Category> findAll() {
		return sessionFactory.getCurrentSession()
				.createQuery("from Category where parentid=0")
				.list();
	}
	
	@Override
	public Category find(Integer id) {
		return (Category) sessionFactory.getCurrentSession()
				.get(Category.class, id);
	}

	@Override
	public void create(Category category) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(category);
		transaction.commit();
		session.close();
	}

	@Override
	public List<Category> findAllCat() {
		return sessionFactory.getCurrentSession()
				.createQuery("from Category")
				.list();
	}

}
