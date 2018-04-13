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
						&nbsp; ${loginMember.memberId}님 환영합니다.							
					</c:otherwise>			      		
				</c:choose>	
		    </ul>
		    <form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		    </form>
		</div>
	</nav>
	<div class="jumbotron" style=" width: 80%; float: left;">
		<h1 class="display-3">Hello, Mall4!</h1>
			<p class="lead">없는거 빼고 다 파는 쇼핑몰</p>
		<hr class="my-4">
		<p>한국스마트정보교육원 개발자27기 유*화, 김*희, 나*수, 배*혜</p>
		<p class="lead">
		  <a class="btn btn-primary btn-lg" href="#" role="button">둘러보기</a>
		</p>
	</div>
	<div class="list-group" style=" width: 20%; float: left;">
		<a href="${pageContext.request.contextPath}/getCategoryList" class="list-group-item list-group-item-action">카테고리 리스트</a>
	  	<a href="${pageContext.request.contextPath}/getItemList" class="list-group-item list-group-item-action active">상품 리스트</a>
	  	<a href="${pageContext.request.contextPath}/getBoardList" class="list-group-item list-group-item-action">게시글 리스트</a>
		<c:if test="${loginMember.memberNo != null}">
			<a href="${pageContext.request.contextPath}/getMemberList" class="list-group-item list-group-item-action">멤버리스트보기</a>
			<a href="${pageContext.request.contextPath}/getAddressList" class="list-group-item list-group-item-action">주소리스트보기</a>
		</c:if>
	</div>
</body>
</html>