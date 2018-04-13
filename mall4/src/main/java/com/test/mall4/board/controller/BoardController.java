package com.test.mall4.board.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.mall4.board.service.Board;
import com.test.mall4.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	/*searchBoard 해당되는 내용을 리스트로 리다이렉트*/
	@RequestMapping(value= {"/searchBoard"}, method=RequestMethod.POST)
	public String searchBoard(Model model) {
		return "redirect:/getBoardList";
	}
	
	/*보드를 검색할 수 있는 searchBoard로 포워드한다*/
	@RequestMapping(value= {"/searchBoard"}, method=RequestMethod.GET)
	public String searchBoard() {
		return "searchBoard";
	}
	
	/*선택한 해당 보드의 내용을 조회하고 상세히 볼수 있다  
	 *detailBoard로 포워드*/ 
	@RequestMapping(value= {"/detailBoard"}, method=RequestMethod.GET)
	public String detailBoard(Board board, Model model) {
		model.addAttribute("board", boardService.selectBoardOne(board));
		System.out.println(boardService.selectBoardOne(board));
		return "detailBoard";
	}
	
	
	/*보드 업데이트 처리한 후  getBoardList로 리다이렉트*/
	@RequestMapping(value = {"/updateBoard"}, method=RequestMethod.POST)
	public String updateBoard(Board board) {
		logger.info("BoardController updateBoard 호출");
		boardService.updateBoard(board);
		return "redirect:/getBoardList";
	}
	
	/*보드 업데이트할때 수정할 해당 게시글을 가져와 updateBoard로 포워드 하기*/
	@RequestMapping(value = {"/updateBoard"}, method=RequestMethod.GET)
	public String selectBoardOne(Model model, Board board) {
		logger.info("BoardController selectBoardOne 호출");
		model.addAttribute("board", boardService.selectBoardOne(board));
		return "updateBoard";
	}
	
	/*보드 삭제처리해 getBoardList로 리다이렉트*/
	@RequestMapping(value = {"/deleteBoard"}, method=RequestMethod.GET)
	public String deleteBoard(Board board) {
		logger.info("BoardController deleteBoard 호출");
		boardService.deleteBoard(board);
		return "redirect:/getBoardList";
	}
	
	/*Boardlist 페이징 처리해 getBoardList.jsp로 포워드 */
	@RequestMapping(value = {"/getBoardList"}, method=RequestMethod.GET)
	public String selectBoardList(Model model
								, @RequestParam(value="currentPage", defaultValue="1") int currentPage
								, @RequestParam(value="pagePerRow", defaultValue="10") int pagePerRow) {
		logger.info("BoardController insertBoard Get 호출");
		Map<String, Object> map = boardService.selectBoardList(currentPage, pagePerRow);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow );
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("list", map.get("list"));
		return "getBoardList";
	}
	
	/*보드의 글 추가 화면인 addBoard.jsp로 포워드*/
	@RequestMapping(value = {"/addBoard"}, method=RequestMethod.GET)
	public String insertBoard() {
		logger.info("BoardController insertBoard Get 호출");
		return "addBoard";
	}
	
	/*보드의 글 추가 해 getBoardList로 리다이렉트*/
	@RequestMapping(value = {"/addBoard"} , method=RequestMethod.POST)
	public String insertBoard(Board board) {
		logger.info("BoardController insertBoard Post 호출");
		boardService.insertBoard(board);
		return "redirect:/getBoardList";
	}
	
	
}
