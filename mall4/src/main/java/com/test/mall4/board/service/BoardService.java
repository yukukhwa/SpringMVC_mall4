package com.test.mall4.board.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired private BoardDao boardDao;
	
	public int insertBoard(Board board) {
		logger.info("BoardService insertBoard 호출");
		int row = boardDao.insertBoard(board);
		return row;
	}

}
