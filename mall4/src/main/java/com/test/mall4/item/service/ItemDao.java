package com.test.mall4.item.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDao {
	private static final Logger logger = LoggerFactory.getLogger(ItemDao.class);
	public String insertItem(Item item) {
		logger.info("ItemDao 호출");
		return "ItemDao 리턴";
	}
}
