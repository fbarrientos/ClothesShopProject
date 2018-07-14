package pe.edu.unsch.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User login(String username, String password) {
		return (User) sessionFactory.getCurrentSession()
				.createQuery("from  User " 
						+ "where  username  =  :username  and " 
						+ "password  =  :password")
				.setString("username", username)
				.setString("password", password)
				.uniqueResult();
	}

}
