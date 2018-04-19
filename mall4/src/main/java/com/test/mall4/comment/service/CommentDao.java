package com.test.mall4.comment.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.mall4.board.service.Board;

@Repository
public class CommentDao {
	
	@Autowired private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(CommentDao.class);
	
	final String NS = "com.test.mall4.comment.service.CommentMapper.";
	
	// 해당 코멘트의 내용을 가져오는 메서드
	public Comment selectCommentOne(Comment comment) {
		return sqlSession.selectOne(NS+"selectCommentOne", comment);
	}
	
	// 코멘트 리스트 출력하는 메서드 
	public List<Comment> selectComment(int boardNo){
		logger.info("commentDao selectComment 호출");
		return sqlSession.selectList(NS+"selectComment", boardNo);
	}
	
	// 코멘트를 추가하는 메서드
	public int insertComment(Comment comment) {
		logger.info("commentDao 호출");
		return sqlSession.insert(NS+"insertComment", comment);
	}
	
}
