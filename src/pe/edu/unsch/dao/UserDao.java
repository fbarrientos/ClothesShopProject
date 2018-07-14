package pe.edu.unsch.dao;

import pe.edu.unsch.entities.User;

public interface UserDao {
	
	public  User  login(String  username,  String  password);
	
}
