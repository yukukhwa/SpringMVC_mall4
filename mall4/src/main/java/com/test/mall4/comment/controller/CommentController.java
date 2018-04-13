package com.test.mall4.comment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mall4.comment.service.Comment;
import com.test.mall4.comment.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired private CommentService commentService;
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	// addComment에서 포스트방식으로 들어올때 인덱스로 리다이렉트
	@RequestMapping(value= {"/addComment"}, method=RequestMethod.POST)
	public String insertComment(Comment comment) {
		commentService.insertComment(comment);
		return "redirect:/index";
	}
	
	// 겟방식으로 들어올 때 addComment로 포워드
	@RequestMapping(value= {"/addComment"}, method=RequestMethod.GET)
	public String insertComment() {
		return "addComment";
	}
	
}
