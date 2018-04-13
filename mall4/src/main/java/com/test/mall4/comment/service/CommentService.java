package com.test.mall4.comment.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

	@Autowired private CommentDao commentDao;
	private static final Logger logger = LoggerFactory.getLogger(CommentService.class);
	
	// 코멘트 추가 서비스
	public int insertComment(Comment comment) {
		logger.info("commentService 호출");
		return commentDao.insertComment(comment);
	}
}
