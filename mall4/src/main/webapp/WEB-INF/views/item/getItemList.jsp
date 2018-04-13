<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>getItemList</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			if($('select#pagePerRow').val() != ${pagePerRow}){
				$('select#pagePerRow').val(${pagePerRow});
			}
			$('select#pagePerRow').change(function(){
				$(this).parent('form').submit();
			});
		});
	</script>
</head>
<body>
	<h1>getItemList</h1>
	<table border="1">
		<thead>
			<tr>
				<th>
					상품넘버
				</th>
				<th>
					카테고리명
				</th>
				<th>
					상품명
				</th>
				<th>
					상품가격
				</th>
				<th>
					수정
				</th>
				<th>
					삭제
				</th>
				<th>
					장바구니
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>
						${item.itemNo}
					</td>
					<td>
						${item.category.categoryName}
					</td>
					<td>
						${item.itemName}
					</td>
					<td>
						${item.itemPrice}
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/updateItem?itemNo=${item.itemNo}">수정</a>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/deleteItem?itemNo=${item.itemNo}">삭제</a>
					</td>
					<td>
						<a id="order" href="${pageContext.request.contextPath}/addOrder?item.itemNo=${item.itemNo}&member.memberNo=${loginMember.memberNo}">장바구니에 담기</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form action="${pageContext.request.contextPath}/getItemList" method="get">
		<select id="pagePerRow" name="pagePerRow">
			<option value="3">3줄보기</option>
			<option value="5">5줄보기</option>
			<option value="10">10줄보기</option>
		</select>	
	</form>
	<c:if test="${currentPage>1}">
		<a href="${pageContext.request.contextPath}/getItemList?currentPage=1&pagePerRow=${pagePerRow}">[처음으로]</a>
		<a href="${pageContext.request.contextPath}/getItemList?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}">[이전]</a>
	</c:if>
	<c:if test="${currentPage<lastPage}">
		<a href="${pageContext.request.contextPath}/getItemList?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}">[다음]</a>
		<a href="${pageContext.request.contextPath}/getItemList?currentPage=${lastPage}&pagePerRow=${pagePerRow}">[마지막으로]</a>
	</c:if>
</body>
</html>