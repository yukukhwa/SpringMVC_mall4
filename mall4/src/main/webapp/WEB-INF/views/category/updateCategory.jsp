<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	<title>updateCategory</title>
</head>
<body>

	<!-- navbar -->
	<%@ include file = "/WEB-INF/views/module/nav.jsp" %>
	<!-- /navbar -->

	<h1>updateCategory</h1>
	<form action="${pageContext.request.contextPath}/updateCategory" method="post">
		<table border="1">
			<thead>
				<tr>
					<th>
						카테고리 넘버
					</th>
					<th>
						카테고리 이름
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="hidden" name="categoryNo" value="${category.categoryNo}">
						${category.categoryNo}
					</td>
					<td>
						<input type="text" name="categoryName" value="${category.categoryName}">
					</td>
				</tr>
			</tbody>
		</table>
		<button type="submit">카테고리수정</button>
	</form>
</body>
</html>