package com.test.mall4.category.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	@Autowired
	private CategoryDao categoryDao;
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryService.class);

	public String insertCategory(Category category) {
		logger.info("CategoryService 호출");
		String categoryDao = this.categoryDao.insertCategory(category);
		logger.info(categoryDao);
		return "CategoryService 리턴";		
	}
}
