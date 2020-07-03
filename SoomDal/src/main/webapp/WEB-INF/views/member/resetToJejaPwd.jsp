<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/member/resetToJejaPwd" method="post">
		비밀번호:<input type="password" name="jPassword">
		새비밀번호:<input type="password" name="newPassword">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
		<button>비밀번호 변경</button>
	</form>
</body>
</html>