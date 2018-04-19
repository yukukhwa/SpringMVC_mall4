package com.test.mall4.comment.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.mall4.board.service.Board;

@Service
public class CommentService {

	@Autowired private CommentDao commentDao;
	private static final Logger logger = LoggerFactory.getLogger(CommentService.class);
	
	public Comment selectComment(Comment comment) {
		return commentDao.selectCommentOne(comment);
	}
	
	public List<Comment> selectComment(int boardNo){
		logger.info("commentService selectComment 호출");
		return commentDao.selectComment(boardNo);
	}
	
	// 코멘트 추가 서비스
	public int insertComment(Comment comment) {
		logger.info("commentService 호출");
		return commentDao.insertComment(comment);
	}
}
