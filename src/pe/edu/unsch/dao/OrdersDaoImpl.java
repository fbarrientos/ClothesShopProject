package pe.edu.unsch.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Orders;

@Repository("ordersDao")
public class OrdersDaoImpl implements OrdersDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Orders create(Orders orders) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(orders);
		transaction.commit();
		session.close();
		return orders;
	}

}
