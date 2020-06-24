<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

</script>
<style>
#top {
	height: 200px;
}
#top h1 {
	margin-top:150px;
	height: 50px;
	text-align: center;
}
#left {
	display: inline-block;
	width: 300px;
	height:200px;
	float: left;
	margin-left: 170px;
	border: 3px solid #DDDDDD;
	border-radius: 5px;
}
#left #dalinjoin {
	padding-top: 100px;
	padding-left: 85px;
}
#left h2 {
	padding-top: 10px;
	text-align: center;
}
#right {
	display: inline-block;
	width: 300px;
	height:200px;
	margin-right: 180px;
	border: 3px solid #DDDDDD;
	border-radius: 5px;
	float: right;
}
#right h2 {
	padding-top: 10px;
	text-align: center;
}
#right #jejajoin {
	padding-top: 100px;
	padding-left: 85px;
}
.btn {
	height: 50px;
	font-size: small;
}
#bottom {
	margin-top: 400px;
	padding-left: 460px;
	font-size: small; 
}


</style>
</head>
<body>
	<div id="top">
		<h1>회원가입하기</h1>
	</div>
	<div id="left">
		<h2>도움을 주고싶어요</h2>
		<div id="dalinjoin">
			<button type="button" class="btn btn-warning" onclick="location.href = '/dal/dalin/join'">달인으로 가입하기</button>
		</div>
	</div>
	<div id="right">
		<h2>배우고 싶어요</h2>
		<div id="jejajoin">
			<button type="button" class="btn btn-success" onclick="location.href = '/dal/jeja/join'">제자로 가입하기</button>
		</div>
	</div>
	
	<div id="bottom">
		<a href="/dal/member/login"><span>이미 계정이 있으신가요?</span></a>
	</div>
</body>
</html>