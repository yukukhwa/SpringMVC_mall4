<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addCategory</title>
</head>
<body>
	<h1>addCategory</h1>
	<form action="${pageContext.request.contextPath}/addCategory" method="post">
		카테고리 이름 : <input type="text" name="categoryName">
		<button type="submit">카테고리 추가</button>
	</form>
</body>
</html>