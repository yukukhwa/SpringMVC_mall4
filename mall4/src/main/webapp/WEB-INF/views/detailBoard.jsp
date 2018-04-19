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
	<form>
		<table>
			<thead>
        		<caption> detail Board </caption>
    		</thead>
			<tbody>
			 	<tr>
	                <th>제목: </th>
	                <td><input type="text" value="${board.boardTitle}" name="boardTitle" readonly="readonly"></td>
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
    	<a href="${pageContext.request.contextPath}/deleteBoard?boardNo=${board.boardNo}">[삭제]</a>
	</form>
<%@ include file="/WEB-INF/views/addComment.jsp" %>
</body>
</html>