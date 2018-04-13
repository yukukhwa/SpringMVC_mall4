<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>getAddressList</title>
<script type="text/javascript">
	$(document).ready(function(){
		if($('#pagePerRow')) {
			
		}
	})
</script>
</head>
<body>
	<h1>getAddressList</h1>
		<table border="1">
			<thead>
				<tr>
					<th>주소 번호</th>
					<th>멤버 번호</th>
					<th>주소 내용</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="address" items="${list}">
				<tr>
					<td>${address.addressNo}</td>
					<td>${address.memberNo}</td>
					<td>${address.addressContent}</td>
					<td>
						<a href="${pageContext.request.contextPath}/updateAddress?addressNo=${address.addressNo}">수정</a>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/deleteAddress?addressNo=${address.addressNo}">삭제</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<form>
			<select name="pagePerRow" id="pagePerRow">
				<option value="5">5개씩 보기</option>
				<option value="10">10개씩 보기</option>
				<option value="15">15개씩 보기</option>
				<option value="20">20개씩 보기</option>
			</select>
			<button type="submit">적용하기</button>
		</form>
			<c:if test="${currentPage != 1}">
				<a href="${pageContext.request.contextPath}/getAddressList?currentPage=1">[처음으로]</a>
			</c:if>
			<c:if test="${currentPage > 1}">
				<a href="${pageContext.request.contextPath}/getAddressList?currentPage=${currentPage-1}">[이전]</a>
			</c:if>
			<c:if test="${currentPage < lastPage}">
				<a href="${pageContext.request.contextPath}/getAddressList?currentPage=${currentPage+1}">[다음]</a>
			</c:if>
			<c:if test="${currentPage != lastPage}">
				<a href="${pageContext.request.contextPath}/getAddressList?currentPage=${lastPage}">[마지막으로]</a>
			</c:if>
</body>
</html>