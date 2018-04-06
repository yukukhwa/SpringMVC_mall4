<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>getMemberList</title>
</head>
<body>
	<h1>getMemberList</h1>
	<select name="pagePerRow">
		<option value=10 selected="selected">
	</select>
	<table border="1">
		<thead>
			<tr>
				<th>멤버아이디</th>
				<th>멤버패스워드</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="member" items="${list}">
				<tr>
					<td>${member.memberId}</td>
					<td>${member.memberPw}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p>리스트  ${model.list}</p>
	<p>현재페이지 ${model.currentPage}</p>
	<p>마지막페이지 ${model.lastPage}</p>	
</body>
</html>