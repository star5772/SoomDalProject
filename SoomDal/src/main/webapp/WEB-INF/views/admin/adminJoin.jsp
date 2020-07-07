<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 계정 등록</title>
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
	<form action="/dal/admin/join" method="post">
	<label for="username" style="font-size: 20px;">관리자계정</label>
	<input type="text" name="username" class="form-control form-control-lg"><br>
	<label for="password" style="font-size: 20px;">관리자 비밀번호</label>
	<input type="password" name="password" class="form-control form-control-lg"><br>
	<label for="adCode" style="font-size: 20px;">관리자코드</label>
	<input type="password" name="adCode" class="form-control form-control-lg"><br>
	<button style="font-size:small; color: white;" type="submit" class="btn btn-warning">등록</button>
	</form>
</div>
</body>
</html>