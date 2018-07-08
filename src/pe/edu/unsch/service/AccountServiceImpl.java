package pe.edu.unsch.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.edu.unsch.dao.AccountDao;
import pe.edu.unsch.entities.Account;

@Service("accountService")
@Transactional
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountDao accountDao;

	@Override
	public void create(Account account) {
		accountDao.create(account);
		
	}

	@Override
	public Account login(String email, String password) {
		return  accountDao.login(email,  password);
	}

	@Override
	public Account find(String email) {
		return accountDao.find(email);
	}

}
