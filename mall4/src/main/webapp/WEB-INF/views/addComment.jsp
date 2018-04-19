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
		<input type="hidden" name="boardNo" value="${board.boardNo}">
		<input type="hidden" name="sessionMemberId" value="${loginMember.memberId}">
		<textarea name="commentContent" placeholder="댓글을 입력해주세요" cols="20" rows="2"></textarea>
		<input type="submit" value="댓글달기">
	</form>
</body>
</html>