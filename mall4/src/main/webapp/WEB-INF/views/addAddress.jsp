<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addAddress</title>
</head>
<body>
	<h1>addAddress</h1>
		<form action="${pageContext.request.contextPath}/addAddress" method="post">
			<input type="hidden" name="memberNo" value="${loginMember.memberNo}">
			주소 : <input type="text" name="addressContent" placeholder="주소를 입력해주세요">
			<button type="submit">주소등록</button>
		</form>
</body>
</html>