<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/module/header.jsp" %>
<head>
	<script>
		$(function() {	
						
			// 유효성(validation) 검사
			$("form").submit(function(event) {
				var provision = $('#provision');				
				var divId = $('#divId');
				var divPassword = $('#divPassword');
				var divPasswordCheck = $('#divPasswordCheck');
				var divName = $('#divName');
				var divPhoneNumber = $('#divPhoneNumber');

				// 회원가입약관
				if ($('#provisionYn:checked').val() == "N") {			
						alert('회원가입약관을 체크해주세요.');
						$('#provisionYn').focus();
					return false;
				} 
				// 아이디 검사
				if ($('#memberId').val() == "") {
					alert('아이디 중복검사를 해주세요.');
					return false;
				} 
				// 패스워드 검사
				if ($('#memberPw').val() == "") {
					alert('비밀번호를 입력해주세요.');
					$('#memberPw').focus();
					return false;
				} 
				// 패스워드 확인
				if ($('#passwordCheck').val() == "") {
					alert('비밀번호 확인을 입력해주세요.');
					$('#passwordCheck').focus();
					return false;
				} 
				// 패스워드 확인
				if ($('#memberPw').val() != $('#passwordCheck').val() || $('#passwordCheck').val() == "") {
					alert('비밀번호와 확인이 같지않거나 입력하지 않았습니다.');
					$('#passwordCheck').focus();
					return false;
				} 
				// 이름
				if ($('#name').val() == "") {
					alert('이름을 입력해주세요.');
					$('#name').focus();
					return false;
				} 
				// 휴대폰
				if ($('#phoneNumber').val() == "") {
					alert('휴대폰을 입력해주세요.');
					$('#phoneNumber').focus();
					return false;
				}
			});
		});
	</script>
</head>
<body>
	<!-- navbar -->
	<%@ include file = "/WEB-INF/views/module/nav.jsp" %>
	<!-- /navbar -->	
	<h1>addMember</h1>
	<div class="container">
		<!-- addMember form -->
		<form class="form-horizontal" role="form" method="post" action="javascript:alert( 'success!' );">
			<div class="form-group" >
				<label for="provision" class="col-lg-2 control-label">회원가입약관</label>
				<div class="col-lg-10" id="provision">
					<textarea class="form-control" rows="4" style="resize: none"></textarea>
					<div class="radio">
						<label> <input type="radio" id="provisionYn" name="provisionYn" value="Y" autofocus="autofocus" checked>
							동의합니다.
						</label>
						<label> <input type="radio" id="provisionYn" name="provisionYn" value="N"> 
							동의하지 않습니다.
						</label>
					</div>
				</div>
			</div>			
			<div class="form-group" id="divId">
				<label for="inputId" class="col-lg-2 control-label">
					아이디
				</label>
				<div class="col-lg-6">
					<input type="text" class="form-control onlyAlphabetAndNumber"
						id="memberId" name="memberId" data-rule-required="true"
						 maxlength="30" disabled="disabled" 
						 value="${param.memberId}">
					<a href="${pageContext.request.contextPath}/checkId">아이디 중복확인</a>
				</div>
			</div>
			<div class="form-group" id="divPassword">
				<label for="inputPassword" class="col-lg-2 control-label">
					패스워드
				</label>
				<div class="col-lg-6">
					<input type="password" class="form-control" id="memberPw"
						name="memberPw" data-rule-required="true" placeholder="패스워드"
						maxlength="30">
				</div>
			</div>
			<div class="form-group" id="divPasswordCheck">
				<label for="inputPasswordCheck" class="col-lg-2 control-label">
					패스워드 확인
				</label>
				<div class="col-lg-6">
					<input type="password" class="form-control" id="passwordCheck" data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
				</div>
			</div>
			<div class="form-group" id="divName">
				<label for="inputName" class="col-lg-2 control-label">
					이름
				</label>
				<div class="col-lg-6">
					<input type="text" class="form-control onlyHangul" id="name" data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">
					성별
				</label>
				<div class="col-lg-1">
					<select class="form-control" id="gender">
						<option value="M">남</option>
						<option value="F">여</option>
					</select>
				</div>
			</div>
			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">
					휴대폰 번호
				</label>
				<div class="col-lg-6">
					<input type="tel" class="form-control onlyNumber" id="phoneNumber"
						data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요."
						maxlength="11">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">
					SMS수신여부
				</label>
				<div class="col-lg-6">
					<label class="radio-inline"> <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="Y" checked>
					동의합니다.	
					</label> 
					<label class="radio-inline"> <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="N"> 
					동의하지 않습니다.
					</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="submit" class="btn btn-default">회원가입</button>
				</div>
			</div>
		</form>
	</div>

		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"	integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"	crossorigin="anonymous"></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</body>
</html>