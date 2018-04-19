<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-fixed-top">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/index">Mall4</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor03" aria-controls="navbarColor03"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor03">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/index">Home <span
						class="sr-only">(current)</span></a></li>
				<c:choose>
					<c:when test="${loginMember.memberNo == null}">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/addMember">회원가입</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/login">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item">
						  	<a class="nav-link" href="${pageContext.request.contextPath}/addBoard">게시글 등록</a>
						</li>
						<li class="nav-item">
						  	<a class="nav-link" href="${pageContext.request.contextPath}/addItem">상품 등록</a>
						</li>
						<li class="nav-item">
						  	<a class="nav-link" href="${pageContext.request.contextPath}/addCategory">카테고리 등록</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath}/addAddress">주소 등록</a>			  	
						</li>	
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/getOrderList?member.memberNo=${loginMember.memberNo}">장바구니</a>
						</li>					
						<li>
							<a class="nav-link" style="font-weight: bold;">${loginMember.memberId}님 환영합니다.</a>
						</li>
						<li>
							<a class="nav-link" href="${pageContext.request.contextPath}/logout">
							<button type="submit">로그아웃</button></a>
						</li>													
					</c:otherwise>	
				</c:choose>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</nav>
</body>
</html>