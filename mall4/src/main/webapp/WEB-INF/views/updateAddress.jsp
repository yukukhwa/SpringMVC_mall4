<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updateAddress</title>
</head>
<body>
	<h1>updateAddress</h1>
	<form action="${pageContext.request.contextPath}/updateAddress" method="post">
		<table border="1">
			<thead>
				<tr>
					<th>주소 번호</th>
					<th>멤버 넘버</th>
					<th>주소 내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						주소 번호 : <input type="text" name="addressNo" value="${address.addressNo}" readonly="readonly">
					</td>
					<td>
						멤버 넘버 : <input type="text" name="memberNo" value="${address.memberNo}" readonly="readonly">
					</td>
					<td>
						주소 내용 : <input type="text" name="addressContent" value="${address.addressContent}">
					</td>
				</tr>
			</tbody>
		</table>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>