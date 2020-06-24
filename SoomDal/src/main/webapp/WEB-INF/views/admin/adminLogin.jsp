<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>관리자 로그인</h3>
	<form action="/dal/jeja/login" method="post">
	<label for="jejaId">관리자 아이디</label>
	<input type="text" name="jEmail" placeholder="아이디(Email)을 입력해주세요" maxlength="50" class="form-control form-control-lg"><br>
	<label for="jejaPwd">관리자 비밀번호</label>
	<input type="password" name="jPassword" placeholder="비밀번호를 입력하세요" maxlength="10" class="form-control form-control-lg"><br>
	<!-- csrf 토큰을 되돌려야 한다 -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<button class="btn btn-warning">관리자 로그인</button><br><br>
	</form>
</body>
</html>