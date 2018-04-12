package com.test.mall4.item.service;

import java.util.HashMap;
import java.util.List;
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
	
	public int deleteItem(Item item) {
		return sqlSession.delete(NS+"deleteItem", item);
	}
	
	public int updateItem(Item item) {
		return sqlSession.update(NS+"updateItem", item);
	}
	
	public Item selectItemOne(Item item) {
		return sqlSession.selectOne(NS+"selectItemOne", item);
		 
	}
	
	public Map<String,Object> selectItemList(Map<String, Integer> map) {
		List<Item> list = sqlSession.selectList(NS+"selectItemList", map);
		int total = sqlSession.selectOne(NS+"totalCountItem");
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("list", list);
		returnMap.put("total", total);
		return returnMap;
	}
	
	public int insertItem(Item item) {
		logger.info("ItemDao 호출");
		int row = sqlSession.insert(NS+"insertItem", item);
		return row;
	}
}
