<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<style>
#change_pwd_frm{
	margin-top: 50px;
	border: 1px solid #DDDDDD;
	margin-left: 300px;
	width: 500px;
	height: 300px;
}
.form-group{
	font-size: 17px;
	text-align: center;
	margin-top: 50px;
}
button{
	float: right;
	
}
#All{
	margin-top: 50px;
}
#change_pwd{
	font-size: 17px;
	border-radius: 4px;
	margin-right: 200px;
	margin-top: 40px;
}
#jTel,#jtel-one {
	display: inline-block;
	width:80px;
	height: 30px;
	font-size: small; 
}
#tel-two,#jtel-two {
	display: inline-block;
	width:80px;
	height: 30px;
	font-size: small; 
}
#tel-three,#jtel-three {
	display: inline-block;
	width:80px;
	height: 30px;
	font-size: small; 
}
</style>
<script>
$(document).ready(function() {
	$("#change_pwd").on("click", function() {
		$("#change_pwd_frm").submit();
	})
})
</script>
</head>
<body>
<h1 style="text-align: center; font-weight: bold; margin-top: 70px;">비밀번호를 잃어버리셨군요!</h1>
	<form id="change_pwd_frm" action="/dal/jeja/change_pwd" method="post" >
	<div id="All">
		<div class="form-group" style="margin-right: 80px;">
			<label for="jEmail" >이메일</label>
			<input id="jEmail" type="text" name="jEmail" style="margin-left: 15px;">
			<span class="helper-text" id="jEmail_msg"></span>
		</div>
		<div class="form-group">
		<!-- 	<label for="jTel">Tel</label>
			&nbsp;
			<input id="jTel" type="text" name="jTel"> -->
		<label for="jTel">연락처</label>&nbsp;&nbsp;
					<select id="jTel" class="form-control" name="jTel">
						<option value="010">010</option>
						<option value="011">011</option>
					</select> - 
					<input type="text" id="tel-two" class="form-control" maxlength="4"> - 
					<input type="text" id="tel-three" class="form-control" maxlength="4">
					<input type="hidden" id="jTel"name="jTel" value="">
			<span class="helper-text" id="jTel_msg"></span>
		</div>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<button type="button" class="btn btn-success" id="change_pwd">번호찾기</button>
	</div>
	</form>
</body>
</html>