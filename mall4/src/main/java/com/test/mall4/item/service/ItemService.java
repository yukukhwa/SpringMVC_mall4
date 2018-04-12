package com.test.mall4.item.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ItemService {
	@Autowired
	private ItemDao itemDao;
	private static final Logger logger = LoggerFactory.getLogger(ItemService.class);
	
	public int deleteItem(Item item) {
		return itemDao.deleteItem(item);
	}
	
	public int updateItem(Item item) {
		return itemDao.updateItem(item);
	}
	
	public Item selectItemOne(Item item) {
		return itemDao.selectItemOne(item);
	}
	
	public Map<String, Object> selectItemList(int currentPage, int pagePerRow) {
		/*
		 * 1p = 0~9 (1-1=0*10=0)
		 * 2p = 10 ~19 (2-1=1*10=10)
		 * 3p = 20 ~ 29 (3-1=2*10=20)
		 */
		int beginRow = (currentPage-1)*pagePerRow;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		/*
		 * 50개를 10개씩 보여줄때 페이지 개수 = 50/10=5p
		 * 55개를 10개씩 보여줄때 페이지 개수 = 55/10=5.5p --> 6p
		 */
		Map<String, Object> returnMap = itemDao.selectItemList(map);
		int total = (Integer) returnMap.get("total");
		int lastPage = total/pagePerRow;
		if(total%pagePerRow != 0) {
			++lastPage;
		}
		returnMap.put("lastPage", lastPage);
		return returnMap;
	}
	
	public int insertItem(Item item) {
		logger.info("ItemService 호출");
		int row = itemDao.insertItem(item);
		//logger.info(itemDao);
		return row;
	}
}
