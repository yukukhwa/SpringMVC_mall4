<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	<title>detailItem</title>
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

	<h1>detailItem</h1>
	<div class="form-group">
		<label for="categoryList">카테고리</label>
		<select class="form-control" id="categoryList" name="category.categoryNo" disabled="disabled">
			<c:forEach var="category" items="${list}">
				<option value="${category.categoryNo}">${category.categoryName}</option>
			</c:forEach>
		</select>
	</div>
	<div class="form-group">
		<label for="itemName">상품명</label>
		<input type="text" class="form-control" name="itemName" id="itemName" value="${item.itemName}" disabled="disabled">
	</div>
	<div class="form-group">
		<label for="itemPrice">상품가격</label>
		<input type="text" class="form-control" name="itemPrice" id="itemPrice" value="${item.itemPrice}" disabled="disabled">
	</div>
	<c:if test="${'없음' != item.itemColor}">
		<div class="form-group">
			<label for="itemColor">상품색상</label>
			<select class="form-control" id="itemColor" name="itemColor">
				<option value="0">[색상을 선택해주세요]</option>
				<c:forTokens var="color" items="${item.itemColor}" delims="/">
					<option value="${color}">${color}</option>
				</c:forTokens>
			</select>
		</div>
	</c:if>
	<c:if test="${'없음' != item.itemSize}">
		<div class="form-group">
			<label for="itemSize">상품사이즈</label>
			<input type="text" class="form-control" name="itemSize" id="itemSize" value="${item.itemSize}">
		</div>
	</c:if>
	<div class="form-group">
		<label for="itemAmount">상품수량</label>
		<input type="number" class="form-control" name="itemAmount" id="itemAmount" value="1" min="1" max="${item.itemAmount}">
	</div>
	<div class="form-group">
		<label for="itemInfo">상품정보</label>
		<textarea class="form-control" name="itemInfo" id="itemInfo" rows="4" disabled="disabled">${item.itemInfo}</textarea>
	</div>
	<a href="" class="btn btn-primary"></a>
	<button type="button" id="" class="btn btn-primary">장바구니에 담기</button>
	<a href="${pageContext.request.contextPath}/updateItem?itemNo=${item.itemNo}" class="btn btn-primary">수정하기</a>
</body>
</html>