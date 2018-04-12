<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<title>Index</title>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-fixed-top">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/index">Mall4</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarColor03">
			<ul class="navbar-nav mr-auto">				
				<li class="nav-item active">
					<a class="nav-link" href="${pageContext.request.contextPath}/index">Home <span class="sr-only">(current)</span></a>
				</li>
				<c:choose>
					<c:when test="${loginMember.memberNo == null}">
						<li class="nav-item">
						  	<a class="nav-link" href="${pageContext.request.contextPath}/addMember">회원가입</a>
						</li>
						<li class="nav-item">						
							<a class="nav-link" href="${pageContext.request.contextPath}/login">로그인</a>
						</li>
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
						<li>
							<a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a>
						</li>								
					</c:otherwise>			      		
				</c:choose>	
		    </ul>
		    <form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		    </form>
		</div>
	</nav>
	<h1>Index</h1>		
		<a href="${pageContext.request.contextPath}/getCategoryList">카테고리리스트보기</a><br>
		<a href="${pageContext.request.contextPath}/getItemList">상품리스트보기</a><br>
		<a href="${pageContext.request.contextPath}/getBoardList">게시글리스트보기</a><br>
		<c:if test="${loginMember.memberNo != null}">
			<a href="${pageContext.request.contextPath}/getMemberList">멤버리스트보기</a><br>
			<a href="${pageContext.request.contextPath}/getAddressList">주소리스트보기</a><br>
		</c:if>
</body>
</html>