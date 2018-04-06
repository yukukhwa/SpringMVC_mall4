package com.test.mall4.category.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public Map<String, Object> selectCategoryList(Map<String, Integer> map) {
		List<Category> list = sqlSession.selectList(NS+"selectCategoryList", map);
		int total = sqlSession.selectOne(NS+"totalCountCategory");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("total", total);
		return returnMap;
	}
	
	public int insertCategory(Category category) {
		logger.info("CategoryDao 호출");
		int row = sqlSession.insert(NS+"insertCategory", category);
		return row;
	}

}
