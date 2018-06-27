package pe.edu.unsch.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Brand;

@Repository("brandDao")
public class BrandDaoImpl implements BrandDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Brand> findAll() {
		return sessionFactory.getCurrentSession().createCriteria(Brand.class).list();
	}

}
