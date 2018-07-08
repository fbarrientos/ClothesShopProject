package pe.edu.unsch.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pe.edu.unsch.dao.OrdersDao;
import pe.edu.unsch.entities.Orders;

@Service("ordersService")
@Transactional
public class OrdersServiceImpl implements OrdersService {
	
	@Autowired
	private OrdersDao ordersDao;

	@Override
	public Orders create(Orders orders) {
		return ordersDao.create(orders);
	}

}
