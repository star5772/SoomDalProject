<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<script>
function check(value, pattern, area, fail_msg) {
	area.text("");
	if(value.length==0) { 
		area.text("필수입력입니다").css({"color":"red", "font-size":"1em"});
		return false;
	}
	else if(pattern.test(value)==false) { 
		area.text(fail_msg).css({"color":"red", "font-size":"1em"});
		return false;
	}
	return true
}

function nameCheck() {
	var patt=/^[가-힣]{2,10}$/;
	return check($("#jName").val(),patt,$("#jName_msg"),"이름을 다시 확인해주세요");
}

function pwdCheck() {
	var patt=/(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$/;
	return check($("#jPassword").val(),patt,$("#jPwd_msg"),"비밀번호를 다시 확인해주세요");
}

function newPwdCheck() {
	var patt=/(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$/;
	return check($("#jNewPassword").val(),patt,$("#jNewPwd_msg"),"비밀번호를 다시 확인해주세요");
}

function newPwdCheck2() {
	$("#jNewPwd2_msg").text("");
	var pwd1 = $("#jNewPassword").val();
	var pwd2 = $("#jNewPassword2").val();
	if(pwd1!==pwd2) {
		$("#jNewPwd2_msg").text("비밀번호가 일치하지 않습니다").css({"color":"red", "font-size":"1em"});
		return false;
	}
	return true;
}

function telCheck() {
	var inputTel = $("#jTel").val();
	var tel = inputTel.replace(/\-/g,'');
	$("#jTel").val(tel);
	var pattern =  /^[0-9]{8,11}$/;
	return check(tel, pattern, $("#jTel_msg"), "연락처를 확인해주세요")
}

	$(function() {
		$("#nameArea").hide();
		$("#pwdArea").hide();
		$("#telArea").hide();
		$("#activateChangeName").on("click", function() {
			$("#nameArea").toggle();
		});
		$("#activateChangePwd").on("click", function() {
			$("#pwdArea").toggle();
		});
		$("#activateChangeTel").on("click", function() {
			$("#telArea").toggle();
		});
		
		$("#jName").on("blur",nameCheck);
		$("#jPassword").on("blur",pwdCheck);
		$("#jNewPassword").on("blur",newPwdCheck);
		$("#jNewPassword2").on("blur",newPwdCheck2);
		$("#jTel").on("blur",telCheck);
		
		// 이름을 변경하는 경우
		$("#changeName").on("click",function() {
			// 먼저 패턴 한 번 더 체크하고 실패하면 실행x
			if(nameCheck()==false) {
				alert("입력하신 이름을 다시 확인해주세요");
				return false;
			}
			params={
				_method:"put",
				newName: $("#jName").val(),
				_csrf: "${_csrf.token}"
			}
			$.ajax({
				url:"/dal/jeja/info_update",
				method:"post",
				data:params
			}).done(()=>alert("변경성공")).done(()=>location.reload()).fail(()=>alert("변경실패"));
		});
		
		// 비밀번호 변경하는 경우
		$("#changePwd").on("click",function() {
			var result1 = pwdCheck();
			var result2 = newPwdCheck();
			var result3 = newPwdCheck2();
			var result = result1 && result2 && result3;
			console.log(result);
			if(result==false) {
				alert("입력하신 사항을 다시 확인해주세요");
				return false;
			}
			params={
				_method:"put",
				_csrf: "${_csrf.token}",
				jPassword:$("#jPassword").val(),
				newPassword:$("#jNewPassword").val()
			}
			$.ajax({
				url:"/dal/jeja/info_update",
				method:"post",
				data:params
			}).done(()=>alert("변경성공")).done(()=>location.reload()).fail(()=>alert("변경실패"));
		});
		
		// 연락처 변경하는 경우
		$("#changeTel").on("click",function() {
			if(telCheck()==false) {
				alert("입력하신 사항을 다시 확인해주세요");
				return false;
			}
			params={
				_method:"put",
				_csrf: "${_csrf.token}",
				newTel: $("#jTel").val()
			}
			$.ajax({
				url:"/dal/jeja/info_update",
				method:"post",
				data:params
			}).done(()=>alert("변경성공")).done(()=>location.reload()).fail(()=>alert("변경실패"));
		});
	});
</script>
<style>
	#update_title {
		text-align: center;
		padding: 15px 20px;
	}
	#frm_wrap {
		display: inline-block;
		position: relative;
		top:40%;
		left: 40%;
		padding: 80px 0;
		
	}
	#btn_resign {
		padding-top: 30px;
	}
	.info_wrap {
		padding: 10px 0;
		width: 500px;
	}
	.info_wrap span {
		padding: 0 10px;
	}
	.info_wrap input {
		width: 200px;
	}
</style>
</head>
<body>
	<div id="update_wrap">
		<div id="update_title">
			<h1>계정</h1>
		</div>
		<div id="frm_wrap">
		<form id="updateFrm">
			<div id="private">
				<h2>개인 정보</h2>
			</div>
			<div class="info_wrap">
				<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_01.png"><span style="display: inline-block; width: 130px;">${jejaRead.name }</span><button type="button" class="btn btn-info" id="activateChangeName">수정</button>
				<div id="nameArea" class="card" style="width: 250px; padding: 10px;">
					<span class="key" style="padding: 5px 5px;">이름 : <span id="jName_msg"></span></span><input type="text" id="jName" class="form-control" placeholder="변경하실 이름을 입력해주세요" maxlength="10"><br>
	  				<button type="button" class="btn btn-info" id="changeName" style="width: 80px;">수정사항 저장</button>
				</div>
			</div>
			<div class="info_wrap">
				<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_02.png"><span>${jejaRead.email }</span>
			</div>
			<div class="info_wrap">
				<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_03.png"><span style="display: inline-block; width: 130px;">비밀번호</span><button type="button" class="btn btn-info" id="activateChangePwd">수정</button>
				<div id="pwdArea" class="card" style="width: 280px; padding: 10px;">
					<span class="key" style="padding: 5px 5px;">현재 비밀번호 : <span id="jPwd_msg"></span></span><input type="password" id="jPassword" name="jPassword" class="form-control" maxlength="10"><br>
					<span class="key" style="padding: 5px 5px;">새 비밀번호 : <span id="jNewPwd_msg"></span></span><input type="password" id="jNewPassword" name="jNewPassword" class="form-control" maxlength="10"><br>
					<span class="key" style="padding: 5px 5px;">새 비밀번호 확인 : <span id="jNewPwd2_msg"></span></span><input type="password" id="jNewPassword2" class="form-control" maxlength="10"><br>
	  				<button type="button" class="btn btn-info" id="changePwd" style="width: 80px;">수정사항 저장</button>
				</div>
			</div>
			<div class="info_wrap">
				<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_05.png"><span style="display: inline-block; width: 130px;">${jejaRead.tel }</span><button type="button" class="btn btn-info" id="activateChangeTel">수정</button>
				<div id="telArea" class="card" style="width: 250px; padding: 10px;">
					<span class="key" style="padding: 5px 5px;">연락처 : <span id="jTel_msg"></span></span>
					<input type="text" id="jTel" class="form-control" maxlength="11" placeholder=" - 을 빼고 입력해주세요"><br>
	  				<button type="button" class="btn btn-info" id="changeTel" style="width: 80px;">수정사항 저장</button>
				</div>
			</div>
		</form>
		<div id="btn_resign">
			<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_08.png"><a href="/dal/member/resign"><span>계정 삭제</span></a>
		</div>
		</div>
	</div>
</body>
</html>