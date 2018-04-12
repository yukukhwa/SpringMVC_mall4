<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>getCategoryList</title>
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
	<h1>getCategoryList</h1>
	<table border="1">
		<thead>
			<tr>
				<th>
					카테고리 넘버
				</th>
				<th>
					카테고리 이름
				</th>
				<th>
					수정
				</th>
				<th>
					삭제
				</th>
			</tr>			
		</thead>
		<tbody>
			<c:forEach var="category" items="${list}">
				<tr>
					<td>
						${category.categoryNo}
					</td>
					<td>
						${category.categoryName}
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/updateCategory?categoryNo=${category.categoryNo}">수정</a>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/deleteCategory?categoryNo=${category.categoryNo}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form action="${pageContext.request.contextPath}/getCategoryList" method="get">
		<select id="pagePerRow" name="pagePerRow">
			<option value="3">3줄보기</option>
			<option value="5">5줄보기</option>
			<option value="10">10줄보기</option>
		</select>
	</form>
	<c:if test="${currentPage > 1}">
		<a href="${pageContext.request.contextPath}/getCategoryList?currentPage=1&pagePerRow=${pagePerRow}">[처음으로]</a>
		<a href="${pageContext.request.contextPath}/getCategoryList?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}">[이전]</a>
	</c:if>
	<c:if test="${currentPage < lastPage}">
		<a href="${pageContext.request.contextPath}/getCategoryList?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}">[다음]</a>
		<a href="${pageContext.request.contextPath}/getCategoryList?currentPage=${lastPage}&pagePerRow=${pagePerRow}">[마지막으로]</a>
	</c:if>
</body>
</html>