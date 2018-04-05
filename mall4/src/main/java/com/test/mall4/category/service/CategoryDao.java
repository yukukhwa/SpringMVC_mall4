package com.test.mall4.category.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDao {
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 상수
	final String NS = "com.test.mall4.category.service.CategoryMapper.";
	
	public List<Category> selectCategoryList(){
		return sqlSession.selectList(NS+"selectCategoryList");
	}
	
	public int insertCategory(Category category) {
		logger.info("CategoryDao 호출");
		int row = sqlSession.insert(NS+"insertCategory", category);
		return row;
	}

}
