<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<style>
#login {
	width: 500px;
	height: 400px;
	margin: 100px 200px 200px 300px;
}
</style>
</head>
<body>
			<div id="login">	
				<form action="/dal/admin/loginpost" method="post">
				<label for="password" style="font-size: 20px;">관리자 아이디</label>
				<input type="text" name="username" placeholder="아이디(Email)을 입력해주세요" maxlength="50" class="form-control form-control-lg"><br>
				<label for="username" style="font-size: 20px;">관리자 비밀번호</label>
				<input type="password" name="password" placeholder="비밀번호를 입력하세요" maxlength="10" class="form-control form-control-lg"><br>
				<!-- csrf 토큰을 되돌려야 한다 -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<button style="font-size:small; color: white;" class="btn btn-warning">로그인</button><a style="margin-left: 360px; font-size: small; color: white;"class="btn btn-warning" href="/dal/admin/join">관리자등록</a>
				</form>
			</div>
</body>
</html>