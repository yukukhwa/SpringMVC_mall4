<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>addItem</title>
</head>
<body>
	<h1>addItem</h1>
	<form action="${pageContext.request.contextPath}/addItem" method="post">
		
		상품이름: <input type="text" name="itemName">
		상품가격: <input type="text" name="itemPrice">
		<button type="submit">상품추가</button>
	</form>
</body>
</html>