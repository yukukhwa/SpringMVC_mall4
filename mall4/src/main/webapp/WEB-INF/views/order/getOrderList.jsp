<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>getOrderList</title>
</head>
<body>
	<h1>getOrderList</h1>
	<table border="1">
		<thead>
			<tr>
				<th>
					주문넘버
				</th>
				<th>
					구매자명
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
						${order.orderNo}
					</td>
					<td>
						${order.member.memberId}
					</td>
					<td>
						${order.item.itemName}
					</td>
					<td>
						${order.item.itemPrice}
					</td>
					<td>
						<input type="text" value="${order.orderCount}">
						<a href="${pageContext.request.contextPath}/updateOrderCount?orderCount=${order.orderCount}&member.memberNo=${loginMember.memberNo}&item.itemNo=${order.item.itemNo}">변경</a>
					</td>
					<td>
						${order.item.itemPrice*order.orderCount}
					</td>
					<td>
						${order.orderDate}
					</td>
					<td>
						<a href="#">삭제</a>
					</td>
					<td>
						<a href="#">주문</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>