package com.test.mall4.board.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	@Autowired private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(BoardDao.class);
	
	final String NS = "com.test.mall4.board.service.BoardMapper.";
	public int insertBoard(Board board) {	
		int row = sqlSession.insert(NS+"insertBoard",board);
		return row;
	}

}
