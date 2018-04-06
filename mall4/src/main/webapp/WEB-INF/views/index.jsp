<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
</head>
<body>
	<h1>Index</h1>
	<p>${loginMember.memberId}님 로그인 중</p>
	<a href="${pageContext.request.contextPath}/login">로그인</a>
	<a href="${pageContext.request.contextPath}/addAddress">주소추가</a>
	<a href="${pageContext.request.contextPath}/addCategory">카테고리추가</a>
	<a href="${pageContext.request.contextPath}/addItem">상품추가</a>
	<a href="${pageContext.request.contextPath}/addMember">멤버추가</a>
	<a href="${pageContext.request.contextPath}/getMemberList">멤버리스트보기</a>
	<a href="${pageContext.request.contextPath}/addBoard">게시글등록</a>	
	<a href="${pageContext.request.contextPath}/getBoardList">게시글리스트보기</a>
</body>
</html>