<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
	<h1>detailBoard</h1>
		<table>
			<thead>
        		<caption> detail Board </caption>
    		</thead>
			<tbody>
			 	<tr>
	                <th>제목: </th>
	                <td>${board.boardTitle}</td>
	            </tr>
	   			<tr>
	                <th>작성자: </th>
	                <td>${board.sessionMemberId}</td>
	            </tr>
	            <tr>
	            	<th>작성시간: </th>
	            	<td>
	            		${board.boardDate}
	            	</td>
	            </tr>
	            <tr>
	                <th>내용: </th>
	                <td>
	          			<textarea cols="80" rows="20" name="boardContent" readonly="readonly">${board.boardContent}</textarea>
	                </td>
	            </tr>
	            
            </tbody>
        </table>
    	<a href="${pageContext.request.contextPath}/updateBoard?boardNo=${board.boardNo}">[수정]</a>
    	<a href="${pageContext.request.contextPath}/deleteBoard?boardNo=${board.boardNo}">[삭제]</a> <br><br>
			
			<c:forEach var="comment" items="${list}">
				<table>
					<tr>
						<td>
								<input type="hidden" name="boardNo" value="${comment.boardNo}">
								<input type="hidden" name="commentNo" value="${comment.commentNo}">
								${comment.sessionMemberId}
								${comment.commentContent}
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/updateComment?commentNo=${comment.commentNo}">[수정]</a>
							<a href="${pageContext.request.contextPath}/deleteComment?commentNo=${comment.commentNo}">[삭제]</a>
						</td>
					</tr>
				</table>
			</c:forEach>
		
		<h1>addComment</h1>
		<form action="${pageContext.request.contextPath}/addComment" method="post">
			<input type="hidden" name="boardNo" value="${board.boardNo}">
			<input type="hidden" name="sessionMemberId" value="${loginMember.memberId}">
			<textarea name="commentContent" placeholder="댓글을 입력해주세요" cols="20" rows="2"></textarea>
			<input type="submit" value="댓글달기">
		</form>

</body>
</html>