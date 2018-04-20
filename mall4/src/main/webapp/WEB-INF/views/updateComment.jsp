<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateComment</title>
</head>
<body>
	<h1>update Comment</h1>
	<form action="${pageContext.request.contextPath}/updateComment" method="post">
		<table>
			<tr>
				<td>
					<input type="hidden" name="commentNo" value="${comment.commentNo}" readonly="readonly">
					<input type="hidden" name="boardNo" value="${comment.boardNo}" readonly="readonly">
					<input type="hidden" name="sessionMemberId" value="${comment.sessionMemberId} "readonly="readonly">
				</td>
			</tr>		
			<tr>
				<td>
					<textarea rows="3" cols="30" name="commentContent" placeholder="댓글수정"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="댓글수정하기">
	</form>
</body>
</html>