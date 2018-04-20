<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	<title>addCategory</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('button').click(function(){
				if('' == $('input#categoryName').val()){
					alert('카테고리명을 입력해주세요');
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
	
	<h1>addCategory</h1>
	<form action="${pageContext.request.contextPath}/addCategory" method="post">
		카테고리 이름 : <input type="text" name="categoryName" id="categoryName">
		<button type="button">카테고리 추가</button>
	</form>
</body>
</html>