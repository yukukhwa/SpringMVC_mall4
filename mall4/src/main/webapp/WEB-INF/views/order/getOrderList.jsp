<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	<title>getOrderList</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('input#orderCount').change(function(){
				var orderCount = $(this).val();
				var itemNo = $(this).parent('td').find('input#itemNo').val();
				//alert(orderCount+'개수로 변경합니다');
				$(this).parent('td').find('a').attr('href','${pageContext.request.contextPath}/updateOrderCount?orderCount='+orderCount+'&member.memberNo=${loginMember.memberNo}&item.itemNo='+itemNo);
			});
			$('input#orderNo').click(function(){
				if($(this).prop("checked")){
					$('tbody').find('input[type="checkbox"]').prop('checked', true);
				}else{
					$('tbody').find('input[type="checkbox"]').prop('checked', false);
				}
			});
			$('button#checkDelete').click(function(){
				$('form').submit();
			});
		});
	</script>
</head>
<body>
	<!-- navbar -->
	<%@ include file = "/WEB-INF/views/module/nav.jsp" %>
	<!-- /navbar -->

	<h1>getOrderList</h1>
	<form action="${pageContext.request.contextPath}/deleteOrder" method="post">
		<table border="1">
			<thead>
				<tr>
					<th>
						<input type="checkbox" id="orderNo">
						주문넘버
					</th>
					<th>
						구매자명
					</th>
					<th>
						상품카테고리
					</th>
					<th>
						상품명
					</th>
					<th>
						상품가격
					</th>
					<th>
						구매수량
					</th>
					<th>
						총가격
					</th>
					<th>
						주문날짜
					</th>
					<th>
						삭제
					</th>
					<th>
						주문
					</th>
				</tr>	
			</thead>
			<tbody>
				<c:forEach var="order" items="${list}">
					<tr>
						<td>
							<input type="checkbox" name="orderNo" value="${order.orderNo}">
							${order.orderNo}
						</td>
						<td>
							${order.member.memberId}
						</td>
						<td>
							${order.item.category.categoryName}
						</td>
						<td>
							${order.item.itemName}
						</td>
						<td>
							${order.item.itemPrice}
						</td>
						<td>
							<input type="text" id="orderCount" value="${order.orderCount}">
							<input type="hidden" id="itemNo" value="${order.item.itemNo}">
							<a href="#">변경</a>
						</td>
						<td>
							${order.item.itemPrice*order.orderCount}
						</td>
						<td>
							${order.orderDate}
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/deleteOrder?member.memberNo=${loginMember.memberNo}&orderNo=${order.orderNo}">삭제</a>
						</td>
						<td>
							<a href="#">주문</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	<br>
	<button type="button" id="checkDelete">선택삭제</button>
	<button type="button" id="checkOrder">선택주문</button>
</body>
</html>