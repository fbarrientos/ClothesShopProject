package pe.edu.unsch.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.*;

@Repository("productDAO")
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	private  SessionFactory  sessionFactory;

	@Override
	public Product find(Integer id) {
		return  (Product) sessionFactory.getCurrentSession().get(Product.class, id);
	}

	@Override
	public List<Product> featured(int n) {
		return sessionFactory.getCurrentSession()
                .createQuery("from Product "
                        + "where feature = :feature "
                        + "order by id desc")
                .setBoolean("feature", true)
                .setMaxResults(n)
                .list();
	}

	@Override
	public List<Product> latest(int n) {
		return sessionFactory.getCurrentSession()
                .createQuery("from Product order by id desc")
                .setMaxResults(n)
                .list();
	}

	@Override
	public List<Product> findByName(String name) {
		return sessionFactory.getCurrentSession().createCriteria(Product.class)
				.add(Restrictions.like("name", "%" + name + "%"))
				.list(); 
	}

}
