<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>getMemberList</title>
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
	<h1>getMemberList</h1>
	<form>
		<select name="pagePerRow" id="pagePerRow">
			<option value="10" selected="selected">10개씩 보기</option>
			<option value="15">15개씩 보기</option>
			<option value="20">20개씩 보기</option>
		</select>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>멤버넘버</th>
				<th>멤버아이디</th>
				<th>멤버패스워드</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="member" items="${list}">
				<tr>
					<td>${member.memberNo}</td>
					<td>${member.memberId}</td>
					<td>${member.memberPw}</td>
					<td><a href="${pageContext.request.contextPath}/updateMember?memberNo=${member.memberNo}">수정버튼</a></td>
					<td><a href="${pageContext.request.contextPath}/deleteMember?memberNo=${member.memberNo}">삭제버튼</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${currentPage > 1}">
	<a href="${pageContext.request.contextPath}/getMemberList?currentPage=${currentPage-1}&pagePerRow=${pagePerRow}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="1" end="${lastPage}" step="1">
		<a href="${pageContext.request.contextPath}/getMemberList?currentPage=${i}&pagePerRow=${pagePerRow}">[${i}]</a>
	</c:forEach>
	<c:if test="${currentPage < lastPage}">
	<a href="${pageContext.request.contextPath}/getMemberList?currentPage=${currentPage+1}&pagePerRow=${pagePerRow}">[다음]</a>
	</c:if>
</body>
</html>