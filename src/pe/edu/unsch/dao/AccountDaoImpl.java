package pe.edu.unsch.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Account;

@Repository("accountDao")
public class AccountDaoImpl implements AccountDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void create(Account account) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(account);
		transaction.commit();
		session.close();
	}

	@Override
	public Account login(String username, String password) {
		return (Account) sessionFactory.getCurrentSession()
				.createQuery("from  Account " 
						+ "where  username  =  :username  and " 
						+ "password  =  :password")
				.setString("username", username)
				.setString("password", password)
				.uniqueResult();
	}

	@Override
	public Account find(String username) {
		return (Account) sessionFactory.getCurrentSession()
				.get(Account.class, username);
	}

}
