<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>getBoardList</title>
</head>
<body>
	<h1>getBoardList</h1>
	<form action="" method="post">
		<table border="1">
			<thead>
				<tr>
					<th>게시글번호</th>
					<th>글쓴이</th>
					<th>게시글 제목</th>
					<th>게시글 내용</th>
					<th>등록 날짜</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.boardNo}</td>
					<td>${board.sessionMemberId}</td>
					<td>${board.boardTitle}</td>
					<td>${board.boardContent}</td>
					<td>${board.boardDate}</td>
					<td></td>
					<td></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	

</body>
</html>