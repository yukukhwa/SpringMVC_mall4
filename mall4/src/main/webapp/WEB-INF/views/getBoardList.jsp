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
	<c:import url="searchBoard.jsp"></c:import>
	<form action="" method="post">
		<table border="1">
			<thead>
				<tr>
					<th>게시글번호</th>
					<th>글쓴이</th>
					<th>게시글 제목</th>
					<th>등록 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${list}">
				<tr>
					<td>${board.boardNo}</td>
					<td>${board.sessionMemberId}</td>
					<td><a href="${pageContext.request.contextPath}/detailBoard?boardNo=${board.boardNo}">${board.boardTitle}</a></td>
					<td>${board.boardDate}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	<form>
		<select name="pagePerRow">
			<option value="5">5개씩 보기</option>
			<option value="10">10개씩 보기</option>
			<option value="15">15개씩 보기</option>
			<option value="20">20개씩 보기</option>
		</select>
		<button type="submit">적용하기</button>
	</form>
			<c:if test="${currentPage != 1}">
				<a href="${pageContext.request.contextPath}/getBoardList?currentPage=1">[처음으로]</a>
			</c:if>
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath}/getBoardList?currentPage=${currentPage-1}">[이전]</a>
			</c:if>
			<c:if test="${currentPage < lastPage}">
				<a href="${pageContext.request.contextPath}/getBoardList?currentPage=${currentPage+1}">[다음]</a>
			</c:if>
			<c:if test="${currentPage != lastPage}">
				<a href="${pageContext.request.contextPath}/getBoardList?currentPage=${lastPage}">[마지막으로]</a>
			</c:if>
</body>
</html>