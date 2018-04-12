<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>updateItem</title>
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
			$('select#categoryList').val(${item.categoryNo});
		});
		 
		request.fail(function( jqXHR, textStatus ) {
		  alert( "Request failed: " + textStatus );
		});
	});
	</script>
</head>
<body>
	<h1>updateItem</h1>
	<form action="${pageContext.request.contextPath}/updateItem" method="post">
		<input type="hidden" name="itemNo" value="${item.itemNo}">
		<table border="1">
			<thead>
				<tr>
					<th>
						카테고리넘버
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
						<select id="categoryList" name="categoryNo">
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