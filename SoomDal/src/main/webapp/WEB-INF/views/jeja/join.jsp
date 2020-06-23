<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(value, pattern, area, fail_msg) {
	area.text("");
	if(value.length==0) { 
		area.text("필수입력입니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	else if(pattern.test(value)==false) { 
		area.text(fail_msg).css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true
}
function idCheck() {
	var patt=/^[A-Za-z][A-Za-z0-9\.]+@[A-Za-z\.]+$/;
	return check($("#jEmail").val(),patt,$("#jEmail_msg"),"아이디(Email)을 다시 확인해주세요");
}
function ajaxCheck() {
	$.ajax({
		url:"/dal/jeja/check_email",
		method:"get",
		data:"jEmail="+$("#jEmail").val()
	}).done(()=>{$("#jEmail_msg").text("사용가능한 아이디입니다.").css("color","green").css("font-size","0.75em");})
	.fail(()=>{$("#jEmail_msg").text("사용중인 아이디입니다").css("color","red").css("font-size","0.75em");})
}
function pwdCheck() {
	var patt=/(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$/;
	return check($("#jPassword").val(),patt,$("#jPassword_msg"),"비밀번호를 다시 확인해주세요");
}
function pwdCheck2() {
	$("#jPassword2_msg").text("");
	var pwd1 = $("#jPassword").val();
	var pwd2 = $("#jPassword2").val();
	if(pwd1!==pwd2) {
		$("#jPassword2_msg").text("비밀번호가 일치하지 않습니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true; 
}
function nameCheck() {
	var patt=/^[가-힣]{2,10}$/;
	return check($("#jName").val(),patt,$("#jName_msg"),"이름을 다시 확인해주세요");
}
function telCheck() {
	var patt=/^[0-9]{10,11}$/;
	return check($("#jTel").val(),patt,$("#jTel_msg"),"전화번호를 다시 확인해주세요");
}
$(function() {
	$("#jEmail").on("blur",function() {
		var result = idCheck();
		if(result==true)
			ajaxCheck();
	});
	$("#jPassword").on("blur",pwdCheck);
	$("#jPassword2").on("blur",pwdCheck2);
	$("#jName").on("blur",nameCheck);
	$("#jTel").on("blur",telCheck);
	
	$("#join").on("click",function() {
		var result1 = idCheck();
		var result2 = pwdCheck();
		var result3 = pwdCheck2();
		var result4 = nameCheck();
		var result5 = telCheck();
		var result = result1 && result2 && result3 && result4 && result5;
		if(result==false)
			return false;
		$.when($.ajax("/dal/jeja/check_email?jEmail=" + $("#jEmail").val())).done(()=>$("#joinFrm").submit()).fail(()=>alert("실패"))
	});
});
</script>
</head>
<body>
	<form id="joinFrm" action="/dal/jeja/join" method="post">
		<div>
			<label for="jEmail">아이디</label> 
			<span id="jEmail_msg"></span>
			<div class="form-group">
				<input type="text" class="form-control" id="jEmail"name="jEmail" placeholder="아이디(Email)을 입력해주세요">
			</div>
		</div>
		<div>
			<label for="jPassword">비밀번호</label> 
			<span id="jPassword_msg"></span>
			<div class="form-group">
				<input type="password" class="form-control" id="jPassword"name="jPassword">
			</div>
		</div>
		<div>
			<label for="jPassword2">비밀번호 확인</label> 
			<span id="jPassword2_msg"></span>
			<div class="form-group">
				<input type="password" class="form-control" id="jPassword2">
			</div>
		</div>
		<div>
			<label for="jName">이름</label> 
			<span id="jName_msg"></span>
			<div class="form-group">
				<input type="text" class="form-control" id="jName"name="jName">
			</div>
		</div>
		<div>
			<label for="jTel">전화번호</label> 
			<span id="jTel_msg"></span>
			<div class="form-group">
				<input type="text" class="form-control" id="jTel"name="jTel">
			</div>
		</div>
		<button class="btn btn-info" id="join" type="button">회원 가입</button>
	</form>
</body>
</html>