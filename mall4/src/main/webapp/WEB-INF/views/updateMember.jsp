<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/module/header.jsp" %>
<body>
	<!-- navbar -->
	<%@ include file = "/WEB-INF/views/module/nav.jsp" %>
	<!-- /navbar -->	
	<form method="post" action="${pageContext.request.contextPath}/updateMember">
		<input type="text" name="memberNo" value="${member.memberNo}" readonly>
		<input type="text" name="memberId" value="${member.memberId}" readonly>
		<input type="text" name="memberPw" value="${member.memberPw}">
		<button type="submit">수정완료</button>
	</form>
</body>
</html>