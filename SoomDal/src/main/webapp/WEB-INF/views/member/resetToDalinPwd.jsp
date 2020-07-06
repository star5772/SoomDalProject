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
</head>
<body>
<sec:authentication property="principal.username" var="username"/>
	<form action="/dal/member/resetToDalinPwd" method="post">
		비밀번호:<input type="password" name="dPassword" id="dp">
		새비밀번호:<input type="password" name="newPassword" id="np">
		<input type="hidden" id="dEmail" name="dEmail" value="${username }">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
		<button>비밀번호 변경</button>
		<h1>${loginId }</h1>
	</form>
</body>
</html>