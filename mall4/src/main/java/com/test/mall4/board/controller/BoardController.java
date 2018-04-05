package com.test.mall4.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.mall4.board.service.Board;
import com.test.mall4.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = {"/addBoard"}, method=RequestMethod.GET)
	public String insertBoard() {
		logger.info("BoardController insertBoard Get 호출");
		return "addBoard";
	}
	
	@RequestMapping(value = {"/addBoard"} , method=RequestMethod.POST)
	public String insertBoard(Board board) {
		logger.info("BoardController insertBoard Post 호출");
		boardService.insertBoard(board);
		return "redirect:/index";
	}
	
	
}
