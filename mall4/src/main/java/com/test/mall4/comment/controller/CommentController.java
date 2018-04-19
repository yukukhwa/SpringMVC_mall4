package com.test.mall4.comment.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.mall4.comment.service.Comment;
import com.test.mall4.comment.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired private CommentService commentService;
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	/*@RequestMapping(value= {"/updateComment"}, method=RequestMethod.POST)
	public String updateComment() {
		return "";
	}*/
	
	@RequestMapping(value= {"/updateComment"}, method=RequestMethod.GET)
	public String selectCommentOne(Comment comment, Model model) {
		return "updateComment";
	}
	
	//코멘트 리스트 출력
	@RequestMapping(value={"/getCommentList"}, method=RequestMethod.GET)
	public String selectComment(Model model
								,@RequestParam(value="boardNo") int boardNo) {
		logger.info("CommentController selectComment 호출");
		List<Comment> list = commentService.selectComment(boardNo);
		model.addAttribute("list",list);
		return "getCommentList";
	}
	
	// addComment에서 포스트방식으로 들어올때 
	@RequestMapping(value={"/addComment"}, method=RequestMethod.POST)
	public String insertComment(Comment comment) {
		logger.info("Comment post Controller 호출");
		commentService.insertComment(comment);
		return "redirect:/getCommentList";
	}
	
	// 겟방식으로 들어올 때 addComment로 포워드
	@RequestMapping(value={"/addComment"}, method=RequestMethod.GET)
	public String insertComment() {
		logger.info("addComment get Controller 호출 ");
		return "addComment";
	}
	
}
