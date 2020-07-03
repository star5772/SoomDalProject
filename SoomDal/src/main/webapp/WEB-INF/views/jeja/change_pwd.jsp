<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/dal/jeja/change_pwd">
		비밀번호:<input type="password" name="jPassword" id="jPassword">
		새 비밀번호:<input type="password" name="newPassword" id="newPassword">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<button>비밀번호 찾기</button>
	</form>
</body>
</html>