<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchBoard</title>
</head>
<body>
	<h1>searchBoard</h1>
	<form action="${pageContext.request.contextPath}/searchBoard" method="post">
		<select name="searchBoardOption" id="searchBoardOption">
			<option value="boardNo">게시글번호</option>
			<option value="sessionMemberId">글쓴이</option>
			<option value="boardTitle">게시글제목</option>
			<option value="boardContent">게시글내용</option>
		</select>
		<input type="text" name="searchBoardContent" placeholder="검색할 내용적기">
		<button type="submit">검색</button>
	</form>
	
</body>
</html>