package com.test.mall4.board.service;

import java.sql.Date;

public class Board {
	private int boardNo;
	private String sessionMemberId;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getSessionMemberId() {
		return sessionMemberId;
	}
	public void setSessionMemberId(String sessionMemberId) {
		this.sessionMemberId = sessionMemberId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", sessionMemberId=" + sessionMemberId + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardDate=" + boardDate + "]";
	}
	
}
