<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		$('#ex').click(function(){
			if($(this).prop('checked')){
				$('#exText').css("display", "block");
			}else{
				$('#exText').css("display", "none");
				$('#exText').val('');
			}
		});
		$('#exText').change(function(){
			var text = $(this).val();
			$('#ex').val(text);
		});
		$('button#colorCheck').click(function(){
			if($('input:checkbox:eq(0)').prop('checked') || $('input:checkbox:eq(1)').prop('checked') || $('input:checkbox:eq(2)').prop('checked') || $('input:checkbox:eq(3)').prop('checked')){
				var str = "";
				$("input:checkbox:checked").each(function (index) {  
			        str += $(this).val() + "/";  
			    });
			    $('#itemColor').val(str);
			}else{
				$('#itemColor').val(${item.itemColor});
				alert('상품색상을 선택해주세요');				
			}
		});
		$('button#updateItem').click(function(){
			if('' == $('input#itemName').val()){
				alert('상품명을 기입해주세요');
			}else if('' == $('input#itemPrice').val()){
				alert('상품가격을 기입해주세요');
			}else if('' == $('input#itemSize').val()){
				alert('상품사이즈를 기입해주세요');
			}else if('' == $('input#itemAmount').val()){
				alert('상품수량을 기입해주세요');
			}else if('' == $('textarea#itemInfo').val()){
				alert('상품정보를 기입해주세요');
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

	<h1>updateItem</h1>
	<form action="${pageContext.request.contextPath}/updateItem" method="post">
		<input type="hidden" name="itemNo" value="${item.itemNo}">
		<div class="form-group">
			<label for="categoryList">카테고리</label>
			<select class="form-control" id="categoryList" name="category.categoryNo">
				<c:forEach var="category" items="${list}">
					<option value="${category.categoryNo}">${category.categoryName}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="itemName">상품명</label>
			<input type="text" class="form-control" name="itemName" id="itemName" value="${item.itemName}" placeholder="상품명">
		</div>
		<div class="form-group">
			<label for="itemPrice">상품가격</label>
			<input type="text" class="form-control" name="itemPrice" id="itemPrice" value="${item.itemPrice}" placeholder="상품가격">
		</div>
		<div class="form-group">
			<label for="itemColor">상품색상</label>
			<div class="form-check">
				<span style="float: left;">
					<input type="checkbox" class="form-check-input" id="red" value="레드">
					<label class="form-check-label" for="red">레드</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" class="form-check-input" id="blue" value="블루">
					<label class="form-check-label" for="blue">블루</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" class="form-check-input" id="black" value="블랙">
					<label class="form-check-label" for="black">블랙</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" class="form-check-input" id="ex">
					<label class="form-check-label" for="ex">기타</label>
				</span>
				<span style="float: left;">
					<input type="text" id="exText" style="display: none;float: inherit;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" id="colorCheck">선택완료</button>
				</span>
			</div>
			<input type="text" class="form-control" name="itemColor" id="itemColor" value="${item.itemColor}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="itemSize">상품사이즈</label>
			<input type="text" class="form-control" name="itemSize" id="itemSize" value="${item.itemSize}" placeholder="상품사이즈">
		</div>
		<div class="form-group">
			<label for="itemAmount">상품수량</label>
			<input type="text" class="form-control" name="itemAmount" id="itemAmount" value="${item.itemAmount}" placeholder="상품수량">
		</div>
		<div class="form-group">
			<label for="itemInfo">상품정보</label>
			<textarea class="form-control" name="itemInfo" id="itemInfo" rows="4" placeholder="상품정보">${item.itemInfo}</textarea>
		</div>
		<button type="button" id="updateItem" class="btn btn-primary">수정하기</button>
	</form>
</body>
</html>