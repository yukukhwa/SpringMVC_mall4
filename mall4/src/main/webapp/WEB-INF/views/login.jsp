<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/login" method="POST">	
		아이디 :	<input name="memberId" placeholder="아이디를 입력해주세요" value="${requestMember.memberId}">			
		비밀번호 :	<input name="memberPw" placeholder="비밀번호를 입력해주세요">
				<c:if test="${requestMember != null}">로그인에 실패했습니다.</c:if>
				<button type="submit">로그인</button>
	</form>

</body>
</html>