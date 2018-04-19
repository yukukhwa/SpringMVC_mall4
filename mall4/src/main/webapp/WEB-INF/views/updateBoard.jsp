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
		<table>
			<thead>
				<caption> update Board</caption>
			</thead>
			<tbody>
				<tr>
					<th>게시글 번호 : </th>
					<td>
						<input type="text" name="boardNo" value="${board.boardNo}" readonly="readonly">
					</td>
				</tr>
				<tr>	
					<th>작성자 : </th>
					<td>
						<input type="text" name="sessionMemberId" value="${board.sessionMemberId}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>제목 : </th>
					<td>
						<input type="text" name="boardTitle" value="${board.boardTitle}">
					</td>
				</tr>
				<tr>
					<th>내용 : </th>
					<td>
						<textarea cols="80" rows="20" name="boardContent">${board.boardContent}</textarea>
					</td>
				</tr>
				<tr>
					<th>작성 날짜 :</th>
					<td>
						<input type="text" name="boardDate" value="${board.boardDate}" readonly="readonly">
					</td>
				</tr>
			</tbody>
		</table>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>