package com.test.mall4.item.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDao {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	final String NS = "com.test.mall4.item.service.ItemMapper.";
	
	public int insertItem(Map map) {
		logger.info("ItemDao 호출");
		int row = sqlSession.insert(NS+"insertItem", map);
		return row;
	}
}
