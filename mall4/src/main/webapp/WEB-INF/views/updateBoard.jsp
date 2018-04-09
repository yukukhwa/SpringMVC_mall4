<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateBoard</title>
</head>
<body>
	<h1>updateBoard</h1>
	<form action="${pageContext.request.contextPath}/updateBoard" method="post">
		<table border="1">
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>게시글 쓴 아이디</th>
					<th>게시글 제목</th>
					<th>게시글 내용</th>
					<th>게시글 날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						게시글 번호 : <input type="text" name="boardNo" value="${board.boardNo}" readonly="readonly">
					</td>
					<td>
						게시글 쓴 아이디 : <input type="text" name="sessionMemberId" value="${board.sessionMemberId}" readonly="readonly">
					</td>
					<td>
						게시글 제목 : <input type="text" name="boardTitle" value="${board.boardTitle}">
					</td>
					<td>
						게시글 내용 : <input type="text" name="boardContent" value="${board.boardContent}">
					</td>
					<td>
						게시글 날짜 : <input type="text" name="boardDate" value="${board.boardDate}" readonly="readonly">
					</td>
				</tr>
			</tbody>
		</table>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>