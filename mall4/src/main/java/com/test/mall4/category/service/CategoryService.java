package com.test.mall4.category.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	@Autowired
	private CategoryDao categoryDao;
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryService.class);
	
	public List<Category> selectCategoryAllList() {
		return categoryDao.selectCategoryAllList();
	}
	/**
	 * 선택한 카테고리 삭제처리
	 * @param category
	 * @return 삭제처리된 행의 개수
	 */
	public int deleteCategory(Category category) {
		return categoryDao.deleteCategory(category);
	}
	/**
	 * 수정 준비가 완료된 카테고리 수정처리
	 * @param category
	 * @return 수정시킨 행의 개수
	 */
	public int updateCategory(Category category) {
		return categoryDao.updateCategory(category);
	}
	/**
	 * 수정을 원하는 카테고리 한개에 해당하는 데이터 출력
	 * @param category
	 * @return 출력된 카테고리 한개의 데이터
	 */
	public Category selectCategoryOne(Category category) {
		return categoryDao.selectCategoryOne(category);
	}
	/**
	 * 카테고리 리스트 출력 메서드(+페이징기법)
	 * @param currentPage(현재페이지)
	 * @param pagePerRow(한 화면에서 보여줄 리스트 갯수)
	 * @return Map(마지막 페이지,카테고리 리스트)
	 */
	public Map<String, Object> selectCategoryList(int currentPage,int pagePerRow) {
		/*
		 * 한 화면에 보여줄 리스트 갯수 = 10개
		 * 현재 페이지 = 1, 리스트 시작번호 = 0
		 *  (1-1)*10 = 0
		 * 현재 페이지 = 2, 리스트 시작번호 = 10
		 *  (2-1)*10 = 10
		 * 현재 페이지 = 3, 리스트 시작번호 = 20
		 * 	(3-1)*10 = 20
		 */
		int beginRow = (currentPage-1)*pagePerRow;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		Map<String, Object> returnMap = categoryDao.selectCategoryList(map);
		int total = (Integer) returnMap.get("total");
		/*
		 * 카테고리 전체 리스트 갯수(9) / 한 화면에서 보여줄 리스트 갯수(10) = 0.9
		 * 라스트페이지는 1p
		 * 	나누어 떨어지지 않으면 몫에 +1을 해준값이 라스트 페이지가 된다 (0+1=1)
		 * 카테고리 전체 리스트 갯수(10) / 한 화면에서 보여줄 리스트 갯수(10) = 1
		 * 라스트페이지는 1p
		 * 	나누어 떨어질때는 몫이 라스트페이지가 된다 (1)
		 * 카테고리 전체 리스트 갯수(11) / 한 화면에서 보여줄 리스트 갯수(10) = 1.1
		 * 라스트페이지는 2p
		 *  나누어 떨어지지 않으면 몫에 +1을 해준값이 라스트 페이지가 된다 (1+1=2)
		 */
		int lastPage = total/pagePerRow; // 자바에서 나눗셈 표현법 ex) 2/2=1, 1/2=0 이렇게 몫만 나온다
		if(total%pagePerRow != 0) { // 자바에서 나머지 표현법 ex) 2%2=0, 1%2=1 이렇게 나머지만 나온다
			++lastPage;
		}
		Map<String, Object> returnMap2 = new HashMap<String, Object>();
		returnMap2.put("lastPage", lastPage);
		returnMap2.put("list", returnMap.get("list"));
		return returnMap2;
	}
	/**
	 * 카테고리 등록 메서드
	 * @param category
	 * @return 등록시킨 행의 개수
	 */
	public int insertCategory(Category category) {
		logger.info("CategoryService 호출");
		int categoryDao = this.categoryDao.insertCategory(category);
		logger.debug("%m",categoryDao); //printf()
		return categoryDao;
	}
}
