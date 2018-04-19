<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	<title>updateItem</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('select#categoryList').val(${item.category.categoryNo});
	});
	</script>
</head>
<body>
	<!-- navbar -->
	<%@ include file = "/WEB-INF/views/module/nav.jsp" %>
	<!-- /navbar -->

	<h1>updateItem</h1>
	<form action="${pageContext.request.contextPath}/updateItem" method="post">
		<input type="hidden" name="itemNo" value="${item.itemNo}">
		<table border="1">
			<thead>
				<tr>
					<th>
						카테고리명
					</th>
					<th>
						상품명
					</th>
					<th>
						상품가격
					</th>				
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<select id="categoryList" name="category.categoryNo">
							<c:forEach var="category" items="${list}">
								<option value="${category.categoryNo}">${category.categoryName}</option>								
							</c:forEach>
						</select>
					</td>
					<td>
						<input type="text" name="itemName" value="${item.itemName}">
					</td>
					<td>
						<input type="text" name="itemPrice" value="${item.itemPrice}">
					</td>
				</tr>
			</tbody>		
		</table>
		<button type="submit">상품수정</button>	
	</form>
</body>
</html>