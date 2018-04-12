package com.test.mall4.item.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ItemService {
	@Autowired
	private ItemDao itemDao;
	private static final Logger logger = LoggerFactory.getLogger(ItemService.class);
	public int insertItem(Item item) {
		logger.info("ItemService 호출");
		int row = itemDao.insertItem(item);
		//logger.info(itemDao);
		return row;
	}
}
