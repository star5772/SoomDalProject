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
	<form id="change_pwd_frm" action="/dal/jeja/change_pwd" method="post">
		<div>
			<label for="jEmail">이메일</label>
			<input id="jEmail" type="text" name="jEmail" >
			<span class="helper-text" id="jEmail_msg"></span>
		</div>
		<div class="form-group">
			<label for="jTel">전화번호</label>
			<input id="jTel" type="text" name="jTel">
			<span class="helper-text" id="jTel_msg"></span>
		</div>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<button type="button" class="btn btn-success" id="change_pwd">비밀번호 찾기</button>
	</form>
</body>
</html>