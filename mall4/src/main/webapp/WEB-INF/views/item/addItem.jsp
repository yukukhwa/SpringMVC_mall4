<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	<title>addItem</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('button').click(function(){
				if(0 == $('select#categoryList').val()){
					alert('카테고리를 선택해주세요');
				}else{
					$('form').submit();
				}
			});
		});
	</script>
</head>
<body>
	
	<!-- navbar -->
	<%@ include file = "/WEB-INF/views/module/nav.jsp" %>
	<!-- /navbar -->

	<h1>addItem</h1>
	<form action="${pageContext.request.contextPath}/addItem" method="post">
		<select id="categoryList" name="category.categoryNo">
			<option value="0">[카테고리를 선택해주세요]</option>
			<c:forEach var="category" items="${list}">
				<option value="${category.categoryNo}">${category.categoryName}</option>
			</c:forEach>
		</select>
		상품이름: <input type="text" name="itemName">
		상품가격: <input type="text" name="itemPrice">
		<button type="button">상품추가</button>
	</form>
</body>
</html>