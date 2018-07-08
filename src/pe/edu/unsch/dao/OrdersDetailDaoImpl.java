package pe.edu.unsch.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Ordersdetail;

@Repository("ordersDetailDao")
public class OrdersDetailDaoImpl implements OrdersDetailDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void create(Ordersdetail ordersdetail) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(ordersdetail);
		transaction.commit();
		session.close();
		
	}

}
