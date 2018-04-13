package com.test.mall4.comment.service;

public class Comment {
	private int commentNo;
	private int boardNo;
	private String commentContent;
	private String sessionMemberId;
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getSessionMemberId() {
		return sessionMemberId;
	}
	public void setSessionMemberId(String sessionMemberId) {
		this.sessionMemberId = sessionMemberId;
	}
	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", boardNo=" + boardNo + ", commentContent=" + commentContent
				+ ", sessionMemberId=" + sessionMemberId + "]";
	}
	
	
}
