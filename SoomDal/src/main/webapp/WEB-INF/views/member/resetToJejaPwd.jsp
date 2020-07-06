<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<sec:authorize access="isAuthenticated()">
	<script>
		console.log("222222222222");
		var isLogin = true;
		var loginId = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"
	</script>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<script>
		console.log("111111111111111");
		var isLogin = false;
		var loginId = undefined;
	</script>
</sec:authorize>
<script>
/* 	$(function() {
		console.log("4444444");
		$("#btn").on("click",function() {
			console.log($("#dp").val());
			console.log($("#np").val());
			console.log($("#dEmail").val()+"mail");
		});
	}); */
</script>
<style>
#newPwd{
	margin-top: 50px;
	border: 1px solid #DDDDDD;
	margin-left: 300px;
	width: 500px;
	height: 300px;
	font-size: 17px;
	text-align: center;
}
button{
	float:right;
	border-radius: 4px;
	margin-right: 200px;
	margin-top: 40px;
	
}
#one{
	margin-top: 50px;
	font-weight: bold;
}
</style>
</head>
<body>
<sec:authentication property="principal.username" var="username"/>
<h1 style="text-align: center; font-weight: bold; margin-top: 70px;">새로운 비밀번호를 입력해 주세요!</h1>
	<form action="/dal/member/resetToJejaPwd" method="post" id="newPwd">
	<div id="one">
		비밀번호&nbsp;<input type="password" name="jPassword" id="dp">
	</div>
	<div id="one">
		새비밀번호&nbsp;<input type="password" name="newPassword" id="np">
	</div>
		<input type="hidden" id="jEmail" name="jEmail" value="${username }">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
		<br>
		<button class="btn btn-success" style="font-size: 17px;">변경하기</button>
		<h1>${loginId }</h1>
	</form>
</body>
</html>