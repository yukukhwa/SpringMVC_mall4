<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addBoard</title>
</head>
<body>
	<h1>addBoard</h1>
		<form action="${pageContext.request.contextPath}/addBoard" method="post">
			<input type="hidden" name="sessionMemberId" value="${loginMember.memberId}">
			<input type="text" name="boardTitle" placeholder="게시글 제목을 입력해주세요">
			<input type="text" name="boardContent" placeholder="게시글 내용을 입력해주세요">
			<button type="submit">게시글등록</button>
		</form>
</body>
</html>