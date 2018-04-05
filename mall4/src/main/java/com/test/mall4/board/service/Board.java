package com.test.mall4.board.service;

import java.sql.Date;

public class Board {
	private int boardNo;
	private String memberId;
	private String boardTitle;
	private String boardComment;
	private Date boardDate;
	
	
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardComment() {
		return boardComment;
	}
	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	@Override
	public String toString() {
		return "Board [boardTitle=" + boardTitle + ", boardComment=" + boardComment + ", boardDate=" + boardDate + "]";
	}
	
	
}
