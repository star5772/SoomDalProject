<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function() {
	$("#change_pwd").on("click", function() {
		$("#change_pwd_frm").submit();
	})
})
</script>
</head>
<body>
	<form id="change_pwd_frm" action="/dal/dalin/change_pwd" method="post">
		<div>
			<label for="dEmail">이메일</label>
			<input id="dEmail" type="text" name="dEmail" >
			<span class="helper-text" id="dEmail_msg"></span>
		</div>
		<div class="form-group">
			<label for="dTel">전화번호</label>
			<input id="dTel" type="text" name="dTel">
			<span class="helper-text" id="dTel_msg"></span>
		</div>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<button type="button" class="btn btn-success" id="change_pwd">비밀번호 찾기</button>
	</form>
</body>
</html>