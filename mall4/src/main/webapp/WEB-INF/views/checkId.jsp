<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/module/header.jsp" %>
<body>
	<form method="post" action="${pageContext.request.contextPath}/checkId">
		<input type="text" name="memberId" id="memberId" value="${requestMember.memberId}">
		<button type="submit">중복 확인</button>
	</form>
	
	<c:choose>
		<c:when test="${requestMember != null}">
			<p>사용가능한 아이디입니다.</p>
			<a href="${pageContext.request.contextPath}/addMember?memberId="+${returnMember.memberId}>아이디 사용하기</a>
		</c:when>
		<c:when test="${returnMember != null}">
			<p>중복된 아이디가 있습니다.</p>			
		</c:when>
		<c:otherwise>
			<p></p>			
		</c:otherwise>
	</c:choose>	
</body>
</html>