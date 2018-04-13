package com.test.mall4.order.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
	@Autowired
	private OrderDao orderDao;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderService.class);
	
	public int insertOrder(Order order) {
		logger.info("insertOrder 호출");
		Order order2 = orderDao.orderCheck(order);
		logger.info(String.valueOf(order2.getOrderCount()));
		if(order2.getOrderCount() == 0) {
			order.setOrderCount(1);
			return orderDao.insertOrder(order);
		}
		order.setOrderCount(order2.getOrderCount()+1);
		return orderDao.updateOrderCount(order);
	}
}
