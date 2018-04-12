<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Index</title>
</head>
<body>
	<h1>Index</h1>
	
	${loginMember.memberNo} , ${loginMember.memberId}님 로그인 중&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/login">로그인</a><br> 
	<a href="${pageContext.request.contextPath}/addAddress">주소등록</a>
	<a href="${pageContext.request.contextPath}/getAddressList">주소리스트보기</a><br>
	<a href="${pageContext.request.contextPath}/addCategory">카테고리등록</a>&nbsp;
	<a href="${pageContext.request.contextPath}/getCategoryList">카테고리리스트보기</a><br>
	<a href="${pageContext.request.contextPath}/addItem">상품등록</a>
	<a href="${pageContext.request.contextPath}/getItemList">상품리스트보기</a><br>
	<a href="${pageContext.request.contextPath}/addMember">멤버등록</a>&nbsp;
	<a href="${pageContext.request.contextPath}/getMemberList">멤버리스트보기</a><br>
	<a href="${pageContext.request.contextPath}/addBoard">게시글등록</a>&nbsp;
	<a href="${pageContext.request.contextPath}/getBoardList">게시글리스트보기</a>
</body>
</html>