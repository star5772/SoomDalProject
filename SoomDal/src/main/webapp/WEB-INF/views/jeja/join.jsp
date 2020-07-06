<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
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
		data:"jEmail="+$("#jEmail").val(),
		success: function() {
			$.ajax({
				url: "/dal/dalin/check_email",
				method: "get",
				data: "dEmail=" + $("#jEmail").val(),
				success: function() {
					$("#jEmail_msg").text("사용가능한 이메일입니다").css({"color":"green", "font-size":"0.75em"});
				},error: function() {
					$("#jEmail_msg").text("사용중인 이메일입니다").css({"color":"red", "font-size":"0.75em"});
				}
			})
		},error: function() {
			$("#jEmail_msg").text("사용중인 이메일입니다").css({"color":"red", "font-size":"0.75em"});
		}	
	})
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
	var tel1 = $("#jTel1").val();
	var tel2 = $("#jTel2").val();
	var tel3 = $("#jTel3").val();
	var $tel = tel1 + tel2 + tel3;
	$("#jTel").val($tel);
	var pattern =  /^[0-9]{9,11}$/;
	return check($tel, pattern, $("#jTel_msg"), "휴대폰(전화번호)를 확인해주세요")
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
	$("#jTel3").on("blur",telCheck);
	
	$("#join").on("click",function() {
		console.log("dd");
		var result1 = idCheck();
		var result2 = pwdCheck();
		var result3 = pwdCheck2();
		var result4 = nameCheck();
		var result5 = telCheck();
		var result = result1 && result2 && result3 && result4 && result5;
		if(result==false)
			return false;
		$.when($.ajax("/dal/dalin/check_email?dEmail=" + $("#jEmail").val())).done(()=>$("#joinFrm").submit()).fail(()=>alert("실패"))
	});
});
</script>
<style>
	.infoDiv {
		display: inline-block;
		width: 700px;
		height: 71.4px;
		margin-bottom: 10px;
	}
	#wrap {
		position:absolute;
		width: 465px;
		height: 500px;
		margin: auto 0;
		top:50%;
		left: 50%;
		margin-left: -220px;
		margin-top: -200px;
		font-size: large;
		padding: 24px;
	}
	.form-control {
		width: 400px;
		height: 40px;	
		font-size: large; 
		margin-bottom: 10px;
	}
	.btn {
		width: 80px;
		height: 30px;
		font-size: medium;
		font-weight: bold;
		text-align: center;
		line-height: 50%;
		color: white;
<<<<<<< HEAD
=======
		float: right;
		margin-top: 20px;
>>>>>>> branch 'master' of https://github.com/star5772/SoomDalProject
	}
	#jTel1 {
		display: inline-block;
		width:140px;
		height: 40px;
		font-size: large; 
	}
	#jTel2 {
		display: inline-block;
		width:125px;
		height: 40px;
		font-size: large; 
	}
	#jTel3 {
		display: inline-block;
		width:125px;
		height: 40px;
		font-size: large; 
	}

</style>
</head>
<body>
<div id="wrap" class="card">
	<form id="joinFrm" action="/dal/jeja/join" method="post">
		<div class="infoDiv">
			<label for="jEmail" style="font-size: medium;">아이디</label> 
			<span id="jEmail_msg"></span>
			<div class="form-group">
				<input type="text" class="form-control" id="jEmail"name="jEmail" placeholder="아이디(Email)을 입력해주세요" maxlength="50">
			</div>
		</div>
		<div class="infoDiv">
			<label for="jPassword" style="font-size: medium;">비밀번호</label> 
			<span id="jPassword_msg"></span>
			<div class="form-group">
				<input type="password" class="form-control" id="jPassword"name="jPassword" placeholder="8자리이상 숫자,문자 조합" maxlength="10">
			</div>
		</div>
		<div class="infoDiv">
			<label for="jPassword2" style="font-size: medium;">비밀번호 확인</label> 
			<span id="jPassword2_msg"></span>
			<div class="form-group">
				<input type="password" class="form-control" id="jPassword2">
			</div>
		</div>
		<div class="infoDiv">
			<label for="jName" style="font-size: medium;">이름</label> 
			<span id="jName_msg"></span>
			<div class="form-group">
				<input type="text" class="form-control" id="jName"name="jName" placeholder="실명을 입력하세요" maxlength="10">
			</div>
		</div>
		<div class="infoDiv">
			<label for="jTel" style="font-size: medium;">연락처</label> 
			<span id="jTel_msg"></span>
			<div class="form-group">
				<input type="text" class="form-control" id="jTel1" maxlength="3">
				<input type="text" class="form-control" id="jTel2" maxlength="4">
				<input type="text" class="form-control" id="jTel3" maxlength="4">
				<input type="hidden" id="jTel"name="jTel" value="">
			</div>
		</div>
		<div>
			<button class="btn btn-warning" type="button" id="join" >회원가입</button>
		</div>
	</form>
</div>
</body>
</html>