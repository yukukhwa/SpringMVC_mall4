<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>addItem</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var request = $.ajax({
			  url: "${pageContext.request.contextPath}/selectCategoryAllList",
			  method: "get",
			  dataType: "json"
			});
			 
			request.done(function( msg ) {
				console.log(typeof msg);
				//alert(msg.length + '<-- msg.length');
				for(var i=0; i<msg.length; i++){
					console.log(msg[i].categoryNo + '<-- msg.categoryNo');
					console.log(msg[i].categoryName + '<-- msg.categoryName');
					$('select#categoryList').append('<option value="'+msg[i].categoryNo+'">'+msg[i].categoryName+'</option>');
				}
			});
			 
			request.fail(function( jqXHR, textStatus ) {
			  alert( "Request failed: " + textStatus );
			});
		});
	</script>
</head>
<body>
	<h1>addItem</h1>
	<form action="${pageContext.request.contextPath}/addItem" method="post">
		<select id="categoryList" name="categoryNo">
			<option>[카테고리를 선택해주세요]</option>
		</select>
		상품이름: <input type="text" name="itemName">
		상품가격: <input type="text" name="itemPrice">
		<button type="submit">상품추가</button>
	</form>
</body>
</html>