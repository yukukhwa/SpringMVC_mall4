<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>getCommentList</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
	<h1>getCommentList</h1>
	<form action="${pageContext.request.contextPath}/getCommentList" method="get">
		<c:forEach var="comment" items="${list}">
			<table>
				<tr>
					<td>
						${comment.boardNo}
						${comment.commentNo}
						${comment.sessionMemberId}
						${comment.commentContent}
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/updateComment?commentNO=${comment.commentNo}">[수정]</a>
						<a href="#">[삭제]</a>
					</td>
				</tr>
			</table>
		</c:forEach>
	</form>
</body>
</html>