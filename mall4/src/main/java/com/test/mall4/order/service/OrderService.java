package com.test.mall4.order.service;

import java.util.List;

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
		int row = orderDao.orderCheck(order);
		logger.info(String.valueOf(row));
		if(0 == row) {
			order.setOrderCount(1);
			return orderDao.insertOrder(order);
		}
		int orderCount = orderDao.selectOrderCount(order);
		order.setOrderCount(++orderCount);
		return orderDao.updateOrderCount(order);
	}
	public List<Order> selectOrderList(Order order) {
		return orderDao.selectOrderList(order);
	}
	public int updateOrderCount(Order order) {
		return orderDao.updateOrderCount(order);
	}
}
