package com.test.mall4.category.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDao {
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryDao.class);
	
	public String insertCategory(Category category) {
		logger.info("CategoryDao 호출");
		return "CategoryDao 리턴";
	}

}
