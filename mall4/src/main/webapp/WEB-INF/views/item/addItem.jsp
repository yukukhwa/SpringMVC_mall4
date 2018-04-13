<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>addItem</title>
</head>
<body>
	<h1>addItem</h1>
	<form action="${pageContext.request.contextPath}/addItem" method="post">
		<select id="categoryList" name="category.categoryNo">
			<option>[카테고리를 선택해주세요]</option>
			<c:forEach var="category" items="${list}">
				<option value="${category.categoryNo}">${category.categoryName}</option>
			</c:forEach>
		</select>
		상품이름: <input type="text" name="itemName">
		상품가격: <input type="text" name="itemPrice">
		<button type="submit">상품추가</button>
	</form>
</body>
</html>