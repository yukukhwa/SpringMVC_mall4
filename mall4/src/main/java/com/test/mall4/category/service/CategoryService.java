package com.test.mall4.category.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	@Autowired
	private CategoryDao categoryDao;
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryService.class);
	
	public List<Category> selectCategoryList(){
		return categoryDao.selectCategoryList();
	}

	public int insertCategory(Category category) {
		logger.info("CategoryService 호출");
		int categoryDao = this.categoryDao.insertCategory(category);
		logger.debug("%m",categoryDao); //printf()
		return categoryDao;
	}
}
