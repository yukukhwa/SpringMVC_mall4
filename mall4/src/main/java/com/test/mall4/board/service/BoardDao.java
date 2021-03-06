package com.test.mall4.board.service;

import java.util.List;
import java.util.Map;

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
	
	//검색
	public List<Board> searchBoard(Map<String, String> map) {
		return sqlSession.selectList(NS+"searchBoard", map);
	}
	
	//수정화면
	public int updateBoard(Board board) {
		return sqlSession.update(NS+"updateBoard", board);
	}
	
	//수정화면 가져오기
	public Board selectBoardOne(Board board) {
		return sqlSession.selectOne(NS+"selectBoardOne", board);
	}
	
	//삭제처리
	public int deleteBoard(Board board) {
		return sqlSession.delete(NS+"deleteBoard", board);
	}
	
	// 카운트 
	public int totalCountBoard() {
		return sqlSession.selectOne(NS+"totalCountBoard");
	}
	
	// 리스트 
	public List<Board> selectBoardList(Map<String, Integer> map){
		return sqlSession.selectList(NS+"selectBoardList", map);
	}
	
	// Board를 추가하는 메서드
	public int insertBoard(Board board) {
		logger.info("BoardDao insertBoard 호출");
		int row = sqlSession.insert(NS+"insertBoard",board);
		return row;
	}

}
