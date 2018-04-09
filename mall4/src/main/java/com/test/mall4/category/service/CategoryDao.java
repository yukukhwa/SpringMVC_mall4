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
	
	// <mapper namespace="com.test.mall4.category.service.CategoryMapper"> : 상수
	final String NS = "com.test.mall4.category.service.CategoryMapper.";
	/**
	 * 선택한 카테고리 삭제처리
	 * @param category
	 * @return 삭제처리된 행의 개수
	 */
	public int deleteCategory(Category category) {
		return sqlSession.delete(NS+"deleteCategory", category);
	}
	/**
	 * 수정 준비가 완료된 카테고리 수정처리
	 * @param category
	 * @return 수정시킨 행의 개수
	 */
	public int updateCategory(Category category) {
		return sqlSession.update(NS+"updateCategory", category);
	}
	/**
	 * 수정을 원하는 카테고리 한개에 해당하는 데이터 출력
	 * @param category
	 * @return 출력된 카테고리 한개의 데이터
	 */
	public Category selectCategoryOne(Category category) {
		return sqlSession.selectOne(NS+"selectCategoryOne", category);
	}
	/**
	 * 화면에 보여줄 카테고리 리스트 출력
	 * @param map(시작하는 데이터 행 번호,화면에 보여줄 리스트 개수)
	 * @return map(출력된 리스트,카테고리 데이터 전체 개수)
	 */
	public Map<String, Object> selectCategoryList(Map<String, Integer> map) {
		List<Category> list = sqlSession.selectList(NS+"selectCategoryList", map);
		int total = sqlSession.selectOne(NS+"totalCountCategory");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("total", total);
		return returnMap;
	}
	/**
	 * 카테고리 등록
	 * @param category
	 * @return 등록시킨 행의 개수
	 */
	public int insertCategory(Category category) {
		logger.info("CategoryDao 호출");
		int row = sqlSession.insert(NS+"insertCategory", category);
		return row;
	}

}
