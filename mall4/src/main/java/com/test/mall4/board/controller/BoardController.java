package com.test.mall4.board.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.mall4.board.service.Board;
import com.test.mall4.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// Boardlist 페이징 처리 마무리하기, 로그인
	@RequestMapping(value = {"/getBoardList"}, method=RequestMethod.GET)
	public String selectBoardList(Model model
								, @RequestParam(value="currentPage", defaultValue="1") int currentPage
								, @RequestParam(value="pagePerRow", defaultValue="10") int pagePerRow) {
		logger.info("BoardController insertBoard Get 호출");
		Map<String, Object> map = boardService.selectBoardList(currentPage, pagePerRow);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		/*model.addAttribute("lastPage", lastPage);*/
		model.addAttribute("list", map);
		return "getBoardList";
	}
	
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
