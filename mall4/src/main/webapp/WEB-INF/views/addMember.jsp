<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addMember</title>
</head>
<body>
<h1>addMember</h1>
	<form action="${pageContext.request.contextPath}/addMember" method="post">
		아이디 : <input type="text" name="memberId" placeholder="아이디를 입력해주세요">
		비밀번호 : <input type="text" name="memberPw" placeholder="비밀번호를 입력해주세요">
		<button type="submit">멤버등록</button>
	</form>
</body>
</html>