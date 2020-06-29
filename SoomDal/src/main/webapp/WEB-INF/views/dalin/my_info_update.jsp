<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	return check($("#dName").val(),patt,$("#dName_msg"),"이름을 다시 확인해주세요");
}

function pwdCheck() {
	var patt=/(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$/;
	return check($("#dPassword").val(),patt,$("#dPwd_msg"),"비밀번호를 다시 확인해주세요");
}

function newPwdCheck() {
	var patt=/(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$/;
	return check($("#dNewPassword").val(),patt,$("#dNewPwd_msg"),"비밀번호를 다시 확인해주세요");
}

function newPwdCheck2() {
	$("#dNewPwd2_msg").text("");
	var pwd1 = $("#dNewPassword").val();
	var pwd2 = $("#dNewPassword2").val();
	if(pwd1!==pwd2) {
		$("#dNewPwd2_msg").text("비밀번호가 일치하지 않습니다").css({"color":"red", "font-size":"1em"});
		return false;
	}
	return true;
}

function telCheck() {
	var inputTel = $("#dTel").val();
	var tel = inputTel.replace(/\-/g,'');
	$("#dTel").val(tel);
	var pattern =  /^[0-9]{8,11}$/;
	return check(tel, pattern, $("#dTel_msg"), "연락처를 확인해주세요")
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
		
		$("#dName").on("blur",nameCheck);
		$("#dPassword").on("blur",pwdCheck);
		$("#dNewPassword").on("blur",newPwdCheck);
		$("#dNewPassword2").on("blur",newPwdCheck2);
		$("#dTel").on("blur",telCheck);
		
		// 이름을 변경하는 경우
		$("#changeName").on("click",function() {
			// 먼저 패턴 한 번 더 체크하고 실패하면 실행x
			if(nameCheck()==false) {
				alert("입력하신 이름을 다시 확인해주세요");
				return false;
			}
			params={
				_method:"put",
				dName: $("#dName").val(),
				_csrf: "${_csrf.token}"
			}
			$.ajax({
				url:"/dal/dalin/my_info_update",
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
				dPassword:$("#dPassword").val(),
				newDPassword:$("#dNewPassword").val()
			}
			$.ajax({
				url:"/dal/dalin/my_info_update",
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
				dTel: $("#dTel").val()
			}
			$.ajax({
				url:"/dal/dalin/my_info_update",
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
				<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_01.png"><span style="display: inline-block; width: 130px;">${dalinRead.DName }</span><button type="button" class="btn btn-info" id="activateChangeName">수정</button>
				<div id="nameArea" class="card" style="width: 250px; padding: 10px;">
					<span class="key" style="padding: 5px 5px;">이름 : <span id="dName_msg"></span></span><input type="text" id="dName" class="form-control" placeholder="변경하실 이름을 입력해주세요" maxlength="10"><br>
	  				<button type="button" class="btn btn-info" id="changeName" style="width: 80px;">수정사항 저장</button>
				</div>
			</div>
			<div class="info_wrap">
				<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_02.png"><span>${dalinRead.DEmail }</span>
			</div>
			<div class="info_wrap">
				<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_03.png"><span style="display: inline-block; width: 130px;">비밀번호</span><button type="button" class="btn btn-info" id="activateChangePwd">수정</button>
				<div id="pwdArea" class="card" style="width: 280px; padding: 10px;">
					<span class="key" style="padding: 5px 5px;">현재 비밀번호 : <span id="dPwd_msg"></span></span><input type="password" id="dPassword" name="dPassword" class="form-control" maxlength="10"><br>
					<span class="key" style="padding: 5px 5px;">새 비밀번호 : <span id="dNewPwd_msg"></span></span><input type="password" id="dNewPassword" name="dNewPassword" class="form-control" maxlength="10"><br>
					<span class="key" style="padding: 5px 5px;">새 비밀번호 확인 : <span id="dNewPwd2_msg"></span></span><input type="password" id="dNewPassword2" class="form-control" maxlength="10"><br>
	  				<button type="button" class="btn btn-info" id="changePwd" style="width: 80px;">수정사항 저장</button>
				</div>
			</div>
			<div class="info_wrap">
				<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_05.png"><span style="display: inline-block; width: 130px;">${dalinRead.DTel }</span><button type="button" class="btn btn-info" id="activateChangeTel">수정</button>
				<div id="telArea" class="card" style="width: 250px; padding: 10px;">
					<span class="key" style="padding: 5px 5px;">연락처 : <span id="dTel_msg"></span></span>
					<input type="text" id="dTel" class="form-control" maxlength="11" placeholder=" - 을 빼고 입력해주세요"><br>
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