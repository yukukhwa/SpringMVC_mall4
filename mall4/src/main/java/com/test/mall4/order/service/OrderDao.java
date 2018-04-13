package com.test.mall4.order.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	final private String NS = "com.test.mall4.order.service.OrderMapper.";
	
	private static final Logger logger = LoggerFactory.getLogger(OrderDao.class);
	
	public int insertOrder(Order order) {
		logger.info("insertOrder 호출");
		int row =sqlSession.insert(NS+"insertOrder", order);
		return row;
	}
	
	public Order orderCheck(Order order) {
		logger.info("orderCheck 호출");
		return sqlSession.selectOne(NS+"orderCheck", order);
	}
	
	public int updateOrderCount(Order order) {
		logger.info("updateOrderCount 호출");
		return sqlSession.update(NS+"updateOrderCount", order);
	}
}
