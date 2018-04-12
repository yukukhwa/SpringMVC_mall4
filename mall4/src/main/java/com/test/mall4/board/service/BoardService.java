package com.test.mall4.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	@Autowired private BoardDao boardDao;
	
	/*보드 수정처리*/ 
	public int updateBoard(Board board) {
		return boardDao.updateBoard(board);
	}
	
	/*수정할 보드를 화면에 출력*/
	public Board selectBoardOne(Board board) {
		return boardDao.selectBoardOne(board);
	}
	
	/*해당 보드를 삭제처리*/
	public int deleteBoard(Board board) {
		int row = boardDao.deleteBoard(board);
		return row;
	}
	
	/*보드의 리스트를 조회 */
	public Map<String, Object> selectBoardList(int currentPage, int pagePerRow) {
		logger.info("BoardService selectBoardList 호출");
		//1. currentPage를 beginPage로
		Map<String, Integer> map = new HashMap<String, Integer>();
		// 시작페이지 구한다
		int beginRow = (currentPage-1)*pagePerRow;
		// 구한 시작페이지와 넘겨받은 pagePerRow를 map에다 저장한다
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		List<Board> list = boardDao.selectBoardList(map);
		//2. 카운트
		// dao에 있는 totalCount메서드의 결과를 boardCount에 저장
		int total = boardDao.totalCountBoard();
		int lastPage = total/pagePerRow;
		// 총갯수와 pagePerRow의 나머지가 0이 아니라면 한개씩 더해준다. 
		if(total%pagePerRow != 0) {
			lastPage++;
		}
		
		/*맵에 lastPage와 list를 저장해 리턴해준다*/
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("lastPage", lastPage);
		returnMap.put("list", list);
		return returnMap;
	}
	
	/*Board의 글을 추가*/
	public int insertBoard(Board board) {
		logger.info("BoardService insertBoard 호출");
		int row = boardDao.insertBoard(board);
		return row;
	}

}
