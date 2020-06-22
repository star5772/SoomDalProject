<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#div-bottom {
	position:absolute; 
	top:50%; 
	left:50%; 
	margin-top:200px; 
	margin-left:-95px;
}
#div-Center {
	position:absolute; 
	width:655px;
	height:500px; 
	top:50%; 
	left:50%; 
	margin-top:-200px; 
	margin-left:-350px;
}
#jejaLogin {
	margin : auto 0;
	display: inline-block;
	width: 300px;
	height: 300px;
	border: 2px solid #DDDDDD;
	border-radius : 5px;
}
#dalinLogin {
	display: inline-block;
	width: 300px;
	height: 300px;
	border: 2px solid #DDDDDD;
	border-radius : 5px;
	margin-left: 50px;
}
#findId {
	float: left;
}
#findPwd {
	float: right;
}
.inline-div {
	margin-bottom: 20px;
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 20px;
}
#topDiv {
	margin-top: 80px;	
}
#secondDiv {
	position:absolute;
	top:50%; 
	left:50%;
	margin-top:-380px; 
	margin-left:-180px;	
}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div id="topDiv">
<h1 style="text-align: center;">숨달에 오신것을 환영합니다</h1><br>
</div>
<div id="secondDiv">
<a href="#"><img src="C:/Users/ICIA/Desktop/팀프로젝트/soomdalLogo.png"></a>
</div>
<div id="div-Center">	
	<div id="jejaLogin" class="form-group">
		<form action="/dal/jeja/login" method="post">
		<div class="inline-div">
			<h3>제자회원 로그인</h3>
				<label for="jejaId">제자회원 아이디</label>
				<input type="text" name="jEmail" placeholder="아이디(Email)을 입력해주세요" maxlength="50" class="form-control form-control-lg"><br>
				<label for="jejaPwd">제자회원 비밀번호</label>
				<input type="password" name="jPassword" placeholder="비밀번호를 입력하세요" maxlength="10" class="form-control form-control-lg"><br>
				<!-- csrf 토큰을 되돌려야 한다 -->
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
				<button class="btn btn-warning">제자회원 로그인</button><br><br>
				<a id="findId" href="#">제자 아이디 찾기</a>
				<a id="findPwd" href="#">제자 비밀번호 찾기</a>
		</div>	
		</form>
	</div>	
	<div id="dalinLogin" class="form-group">
		<form action="/dal/dalin/login" method="post">
		<div class="inline-div">
			<h3>달인회원 로그인</h3>
				<label for="dalinId">달인회원 아이디</label>
				<input type="text" name="dEmail" placeholder="아이디(Email)을 입력해주세요" maxlength="50" class="form-control form-control-lg"><br>
				<label for="dalinPwd">달인회원 비밀번호</label>
				<input type="password" name="dPassword" placeholder="비밀번호를 입력하세요" maxlength="10" class="form-control form-control-lg"><br>
				<!-- csrf 토큰을 되돌려야 한다 -->
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}">
				<button class="btn btn-success">달인회원 로그인</button><br><br>
				<a id="findId" href="#">달인 아이디 찾기</a>
				<a id="findPwd" href="#">달인 비밀번호 찾기</a>
		</div>	
		</form>
	</div>
</div>
<div id="div-bottom">
<a href="#">계정이 없으신가요?</a>
</div>	
</body>
</html>