<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/dal/css/login.css">
</head>
<body>
		<div class="topDiv">
		<h1 style="text-align: center;">숨달에 오신것을 환영합니다</h1><br>
		</div>
		<div class="form-group memberLogin">
			<form class="loginForm">
			<div class="inline-div" id="jejalogin">
					<h3>제자회원 로그인</h3>
						<label for="jejaId">제자회원 아이디</label>
						<input type="text" name="jEmail" placeholder="아이디(Email)을 입력해주세요" maxlength="50" class="form-control form-control-lg"><br>
						<label for="jejaPwd">제자회원 비밀번호</label>
						<input type="password" name="jPassword" placeholder="비밀번호를 입력하세요" maxlength="10" class="form-control form-control-lg"><br>
						<!-- csrf 토큰을 되돌려야 한다 -->
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						<button class="btn btn-warning">제자회원 로그인</button><br><br>
						<a class="findId" href="#" style="float:left">제자 아이디 찾기</a>
						<a class="findPwd" href="#"style="float:right">제자 비밀번호 찾기</a>
				</div>	
				<div class="inline-div" id="dalinlogin">
					<h3>달인회원 로그인</h3>
						<label for="dalinId">달인회원 아이디</label>
						<input type="text" name="dEmail" placeholder="아이디(Email)을 입력해주세요" maxlength="50" class="form-control form-control-lg"><br>
						<label for="dalinPwd">달인회원 비밀번호</label>
						<input type="password" name="dPassword" placeholder="비밀번호를 입력하세요" maxlength="10" class="form-control form-control-lg"><br>
						<!-- csrf 토큰을 되돌려야 한다 -->
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						<button class="btn btn-success">달인회원 로그인</button><br><br>
						<a class="findId" href="#" style="float:left">달인 아이디 찾기</a>
						<a class="findPwd" href="#" style="float:right">달인 비밀번호 찾기</a>
				</div>
		</form>
	</div>

</body>
</html>