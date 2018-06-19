package pe.edu.unsch.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.*;

@Repository("colourDao")
public class ColourDaoImpl implements ColourDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Colour> findAll() {
		return sessionFactory.getCurrentSession().createCriteria(Colour.class).list();
	}

}
