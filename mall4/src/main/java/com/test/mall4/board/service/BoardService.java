package com.test.mall4.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired private BoardDao boardDao;
	
	public Map<String, Object> selectBoardList(int currentPage, int pagePerRow) {
		//1. currentPage를 beginPage로
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginPage", (currentPage-1)*pagePerRow);
		map.put("pagePerRow", pagePerRow);
		//2. 카운트
		int boardCount = boardDao.totalCountBoard();
		int lastPage = 0;
		if(boardCount%pagePerRow != 0) {
			lastPage++;
		}
		List<Board> list = boardDao.selectBoardList();
		map.put("lastPage", lastPage);
		map.put("list", list);
		return map;
	}
	
	//Board추가
	public int insertBoard(Board board) {
		logger.info("BoardService insertBoard 호출");
		int row = boardDao.insertBoard(board);
		return row;
	}

}
