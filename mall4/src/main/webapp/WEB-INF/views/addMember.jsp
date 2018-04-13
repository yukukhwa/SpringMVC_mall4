<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>addMember</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script type="text/javascript">
		$(document).ready(function(){
			// 폼 유효성 검사
			function formcheck(obj){
				if(!obj.memberId.value || obj.memberId.value.trim().length ==0){
					alert("아이디가 입력되지 않았습니다.");
					obj.memberId.value="";
					obj.memberId.focus();
					return false;
				}
				if(!obj.memberPw.value || obj.memberPw.value.trim().length ==0){
					alert("비밀번호가 입력되지 않았습니다.");
					obj.memberPw.value="";
					obj.memberPw.focus();
					return false;
				}
				if(!obj.memberPwCheck.value || obj.memberPwCheck.value.trim().length ==0){
					alert("비밀번호확인이 입력되지 않았습니다.");
					obj.memberPwCheck.value="";
					obj.memberPwCheck.focus();
					return false;
				}
				return true;
			}
			
			// 중복 아이디 체크
			function CheckId(){
				// 메서드 만들기
			}
		})
	</script>
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
	<h1>addMember</h1>
		<form id="insertmember" action="${pageContext.request.contextPath}/addMember" onsubmit="return formcheck(this)" method="post">
			아이디 :		<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력해주세요.">
						<input type="button" id="CheckId" value="아이디 중복 확인" onclick="CheckId();">
			비밀번호 : 		<input type="password" name="memberPw" placeholder="비밀번호를 입력해주세요.">
			비밀번호확인 : 	<input type="password" name="memberPwCheck" placeholder="비밀번호확인을 위해 다시 입력해주세요.">
			<button type="submit">멤버등록</button>
		</form>
		<div id="here"></div>
</body>
</html>