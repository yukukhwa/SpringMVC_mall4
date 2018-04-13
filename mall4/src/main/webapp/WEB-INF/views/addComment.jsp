<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addComment</title>
</head>
<body>
	<h1>addComment</h1>
	<form action="${pageContext.request.contextPath}/addComment" method="post">
		<input type="text" name="boardNo" value="${board.boardNo}">
		<input type="text" name="sessionMemberId" value="${loginMember.memberId}">
		<textarea name="commentContent" placeholder="댓글을 입력해주세요" cols="20" rows="4"></textarea>
		<button type="submit">댓글달기</button>
	</form>
</body>
</html>