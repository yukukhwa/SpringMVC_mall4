<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>getMemberList</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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