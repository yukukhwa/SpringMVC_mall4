<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
		integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
		crossorigin="anonymous">
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
	<script src="//code.jquery.com/jquery.js"></script>
	<!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
	<script src="/resources/bootstrap/js/respond.js"></script>
	
	<title>addMember</title>
	<script>
		$(function() {
			//모달을 전역변수로 선언
			var modalContents = $(".modal-contents");
			var modal = $("#defaultModal");
	
			// 아이디 _(underscore), 영어, 숫자만 가능
			$('.onlyAlphabetAndNumber').keyup(function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var inputVal = $(this).val();
					$(this).val($(this).val().replace(/[^_a-z0-9]/gi, ''));
				}
			});
	
			$(".onlyHangul").keyup(function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
				}
			});
	
			$(".onlyNumber").keyup(function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^0-9]/gi, ''));
				}
			});
	
			// 유효성(validation) 검사하여 상태를 class에 적용
			$('#id').keyup(function(event) {
				var divId = $('#divId');
				if ($('#id').val() == "") {
					divId.removeClass("has-success");
					divId.addClass("has-error");
				} else {
					divId.removeClass("has-error");
					divId.addClass("has-success");
				}
			});
	
			$('#password').keyup(function(event) {
				var divPassword = $('#divPassword');
				if ($('#password').val() == "") {
					divPassword.removeClass("has-success");
					divPassword.addClass("has-error");
				} else {
					divPassword.removeClass("has-error");
					divPassword.addClass("has-success");
				}
			});
	
			$('#passwordCheck').keyup(function(event) {
				var passwordCheck = $('#passwordCheck').val();
				var password = $('#password').val();
				var divPasswordCheck = $('#divPasswordCheck');
				if ((passwordCheck == "") || (password != passwordCheck)) {
					divPasswordCheck.removeClass("has-success");
					divPasswordCheck.addClass("has-error");
				} else {
					divPasswordCheck.removeClass("has-error");
					divPasswordCheck.addClass("has-success");
				}
			});
	
			$('#name').keyup(function(event) {
				var divName = $('#divName');
				if ($.trim($('#name').val()) == "") {
					divName.removeClass("has-success");
					divName.addClass("has-error");
				} else {
					divName.removeClass("has-error");
					divName.addClass("has-success");
				}
			});
	
			$('#phoneNumber').keyup(function(event) {
				var divPhoneNumber = $('#divPhoneNumber');
				if ($.trim($('#phoneNumber').val()) == "") {
					divPhoneNumber.removeClass("has-success");
					divPhoneNumber.addClass("has-error");
				} else {
					divPhoneNumber.removeClass("has-error");
					divPhoneNumber.addClass("has-success");
				}
			});
	
			// 유효성(validation) 검사
			$("form").submit(
					function(event) {
						var provision = $('#provision');
						var memberInfo = $('#memberInfo');
						var divId = $('#divId');
						var divPassword = $('#divPassword');
						var divPasswordCheck = $('#divPasswordCheck');
						var divName = $('#divName');
						var divNickname = $('#divNickname');
						var divEmail = $('#divEmail');
						var divPhoneNumber = $('#divPhoneNumber');
	
						//회원가입약관
						if ($('#provisionYn:checked').val() == "N") {
							modalContents.text("회원가입약관에 동의하여 주시기 바랍니다."); //모달 메시지 입력
							modal.modal('show'); //모달 띄우기
	
							provision.removeClass("has-success");
							provision.addClass("has-error");
							$('#provisionYn').focus();
							return false;
						} else {
							provision.removeClass("has-error");
							provision.addClass("has-success");
						}
	
						//개인정보취급방침
						if ($('#memberInfoYn:checked').val() == "N") {
							modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
							modal.modal('show');
	
							memberInfo.removeClass("has-success");
							memberInfo.addClass("has-error");
							$('#memberInfoYn').focus();
							return false;
						} else {
							memberInfo.removeClass("has-error");
							memberInfo.addClass("has-success");
						}
	
						//아이디 검사
						if ($('#id').val() == "") {
							modalContents.text("아이디를 입력하여 주시기 바랍니다.");
							modal.modal('show');
	
							divId.removeClass("has-success");
							divId.addClass("has-error");
							$('#id').focus();
							return false;
						} else {
							divId.removeClass("has-error");
							divId.addClass("has-success");
						}
	
						//패스워드 검사
						if ($('#password').val() == "") {
							modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
							modal.modal('show');
	
							divPassword.removeClass("has-success");
							divPassword.addClass("has-error");
							$('#password').focus();
							return false;
						} else {
							divPassword.removeClass("has-error");
							divPassword.addClass("has-success");
						}
	
						//패스워드 확인
						if ($('#passwordCheck').val() == "") {
							modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
							modal.modal('show');
	
							divPasswordCheck.removeClass("has-success");
							divPasswordCheck.addClass("has-error");
							$('#passwordCheck').focus();
							return false;
						} else {
							divPasswordCheck.removeClass("has-error");
							divPasswordCheck.addClass("has-success");
						}
	
						//패스워드 비교
						if ($('#password').val() != $('#passwordCheck').val()
								|| $('#passwordCheck').val() == "") {
							modalContents.text("패스워드가 일치하지 않습니다.");
							modal.modal('show');
	
							divPasswordCheck.removeClass("has-success");
							divPasswordCheck.addClass("has-error");
							$('#passwordCheck').focus();
							return false;
						} else {
							divPasswordCheck.removeClass("has-error");
							divPasswordCheck.addClass("has-success");
						}
	
						//이름
						if ($('#name').val() == "") {
							modalContents.text("이름을 입력하여 주시기 바랍니다.");
							modal.modal('show');
	
							divName.removeClass("has-success");
							divName.addClass("has-error");
							$('#name').focus();
							return false;
						} else {
							divName.removeClass("has-error");
							divName.addClass("has-success");
						}
	
						//휴대폰 번호
						if ($('#phoneNumber').val() == "") {
							modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
							modal.modal('show');
	
							divPhoneNumber.removeClass("has-success");
							divPhoneNumber.addClass("has-error");
							$('#phoneNumber').focus();
							return false;
						} else {
							divPhoneNumber.removeClass("has-error");
							divPhoneNumber.addClass("has-success");
						}
					});
		});
	</script>
</head>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-fixed-top">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/index">Mall4</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor03" aria-controls="navbarColor03"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor03">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/index">Home <span
						class="sr-only">(current)</span></a></li>
				<c:choose>
					<c:when test="${loginMember.memberNo == null}">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/addMember">회원가입</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/login">로그인</a></li>
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
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/getOrderList?member.memberNo=${loginMember.memberNo}">장바구니</a>
						</li>					
						<li>
							<a class="nav-link" style="font-weight: bold;">${loginMember.memberId}님 환영합니다.</a>
						</li>
						<li>
							<a class="nav-link" href="${pageContext.request.contextPath}/logout">
							<button type="submit">로그아웃</button></a>
						</li>													
					</c:otherwise>	
				</c:choose>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="text">
				<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</nav>
	<h1>addMember</h1>
	<div class="container">
		<!-- 모달창 -->
		<div class="modal fade" id="defaultModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">알림</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>						
					</div>
					<div class="modal-body">
						<p class="modal-contents"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<!--// 모달창 -->	

		<!-- addMember form -->
		<hr />
		<form class="form-horizontal" role="form" method="post" action="javascript:alert( 'success!' );">
			<div class="form-group" >
				<label for="provision" class="col-lg-2 control-label">회원가입약관</label>
				<div class="col-lg-10" id="provision">
					<textarea class="form-control" rows="4" style="resize: none"></textarea>
					<div class="radio">
						<label> <input type="radio" id="provisionYn"
							name="provisionYn" value="Y" autofocus="autofocus" checked>
							동의합니다.
						</label>
						<label> <input type="radio" id="provisionYn"
							name="provisionYn" value="N"> 동의하지 않습니다.
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="memberInfo" class="col-lg-2 control-label">개인정보취급방침</label>
				<div class="col-lg-10" id="memberInfo">
					<textarea class="form-control" rows="4" style="resize: none"></textarea>
					<div class="radio">
						<label> <input type="radio" id="memberInfoYn"
							name="memberInfoYn" value="Y" checked> 동의합니다.
						</label>				
						<label> <input type="radio" id="memberInfoYn"
							name="memberInfoYn" value="N"> 동의하지 않습니다.
						</label>
					</div>
				</div>
			</div>
			<div class="form-group" id="divId">
				<label for="inputId" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-6">
					<input type="text" class="form-control onlyAlphabetAndNumber"
						id="id" name="memberId" data-rule-required="true"
						placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30">
				</div>
			</div>
			<div class="form-group" id="divPassword">
				<label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
				<div class="col-lg-6">
					<input type="password" class="form-control" id="password"
						name="memberPw" data-rule-required="true" placeholder="패스워드"
						maxlength="30">
				</div>
			</div>
			<div class="form-group" id="divPasswordCheck">
				<label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드
					확인</label>
				<div class="col-lg-6">
					<input type="password" class="form-control" id="passwordCheck"
						data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
				</div>
			</div>
			<div class="form-group" id="divName">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-6">
					<input type="text" class="form-control onlyHangul" id="name"
						data-rule-required="true" placeholder="한글만 입력 가능합니다."
						maxlength="15">
				</div>
			</div>

			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
				<div class="col-lg-1">
					<select class="form-control" id="gender">
						<option value="M">남</option>
						<option value="F">여</option>
					</select>
				</div>
			</div>

			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
					번호</label>
				<div class="col-lg-6">
					<input type="tel" class="form-control onlyNumber" id="phoneNumber"
						data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요."
						maxlength="11">
				</div>
			</div>

			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">SMS
					수신여부</label>
				<div class="col-lg-6">
					<label class="radio-inline"> <input type="radio"
						id="smsReceiveYn" name="smsReceiveYn" value="Y" checked>
						동의합니다.
					</label> <label class="radio-inline"> <input type="radio"
						id="smsReceiveYn" name="smsReceiveYn" value="N"> 동의하지
						않습니다.
					</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="submit" class="btn btn-default">회원가입</button>
				</div>
			</div>
		</form>
		<hr />

		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"	integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"	crossorigin="anonymous"></script>
		<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</body>
</html>