package com.test.mall4.comment.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDao {
	
	@Autowired private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(CommentDao.class);
	
	final String NS = "com.test.mall4.comment.service.CommentMapper.";
	
	// 코멘트를 추가하는 메서드
	public int insertComment(Comment comment) {
		return sqlSession.insert(NS+"insertComment", comment);
	}
	
}
