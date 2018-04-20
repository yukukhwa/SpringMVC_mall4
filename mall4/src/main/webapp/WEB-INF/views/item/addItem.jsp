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
			$('#default').click(function(){
				if($(this).prop('checked')){
					for(i=0+1; i<5+1; i++){
						$('input:checkbox:eq('+i+')').prop('checked',false);
						$('input:checkbox:eq('+i+')').attr('disabled','disabled');
					}
					$('#exText').css("display", "none");
				}else{
					for(i=0+1; i<5+1; i++){
						$('input:checkbox:eq('+i+')').removeAttr('disabled');
					}
				}
			});
			$('button#colorCheck').click(function(){
				if($('input:checkbox:eq(0)').prop('checked') || $('input:checkbox:eq(1)').prop('checked') || $('input:checkbox:eq(2)').prop('checked') || $('input:checkbox:eq(3)').prop('checked') || $('input:checkbox:eq(4)').prop('checked')){
					var str = "";
					$("input:checkbox:checked").each(function (index) {  
				        str += $(this).val() + "/";  
				    });
				    $('#itemColor').val(str);
				}else{
					$('#itemColor').val('');
					alert('상품색상을 선택해주세요');				
				}
			});
			$('button#addItem').click(function(){
				if('0' == $('select#categoryList option:selected').val()){
					alert('카테고리를 선택해주세요');
				}else if('' == $('input#itemName').val()){
					alert('상품명을 기입해주세요');
				}else if('' == $('input#itemPrice').val()){
					alert('상품가격을 기입해주세요');
				}else if('' == $('input#itemColor').val()){
					alert('상품색상을 선택해주세요');
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

	<h1>addItem</h1>
	<form action="${pageContext.request.contextPath}/addItem" method="post">
		<div class="form-group">
			<label for="categoryList">카테고리</label>
			<select class="form-control" id="categoryList" name="category.categoryNo">
				<option value="0">[카테고리를 선택해주세요]</option>
				<c:forEach var="category" items="${list}">
					<option value="${category.categoryNo}">${category.categoryName}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="itemName">상품명</label>
			<input type="text" class="form-control" name="itemName" id="itemName" placeholder="상품명">
		</div>
		<div class="form-group">
			<label for="itemPrice">상품가격</label>
			<input type="text" class="form-control" name="itemPrice" id="itemPrice" placeholder="상품가격">
		</div>
		<div class="form-group">
			<label for="itemColor">상품색상</label>
			<div class="form-check">
				<span style="float: left;">
					<input type="checkbox" class="form-check-input" id="default" value="없음">
					<label class="form-check-label" for="default">없음</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
					<input type="text" id="exText" style="display: none;float: inherit;width: 500px" placeholder="ex)노랑/네이비/그레이/... 이런식으로 작성하세요">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" id="colorCheck">선택완료</button>
				</span>
			</div><br><br>
			등록한 생상을 확인하세요
			<input type="text" class="form-control" name="itemColor" id="itemColor" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="itemSize">상품사이즈</label>
			<div class="form-check">
				<input type="checkbox" class="form-check-input" id="zero" value="없음">
				<label class="form-check-label" for="zero">없음</label>
				<button type="button" id="sizeCheck">선택완료</button>
			</div>
			<input type="text" class="form-control" name="itemSize" id="itemSize" placeholder="상품사이즈">
		</div>
		<div class="form-group">
			<label for="itemAmount">상품수량</label>
			<input type="text" class="form-control" name="itemAmount" id="itemAmount" placeholder="상품수량">
		</div>
		<div class="form-group">
			<label for="itemInfo">상품정보</label>
			<textarea class="form-control" name="itemInfo" id="itemInfo" placeholder="상품정보" rows="4"></textarea>
		</div>
		<button type="button" id="addItem" class="btn btn-primary">상품추가</button>
	</form>
</body>
</html>