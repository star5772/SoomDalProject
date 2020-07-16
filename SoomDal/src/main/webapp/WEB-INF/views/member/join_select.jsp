<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script>

</script>
<style>
#top {
	height: 150px;
	padding-bottom: 50px;
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
	padding-top: 30px;
	padding-left: 85px;
}
#left h2 {
	padding-top: 50px;
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
	padding-top: 50px;
	text-align: center;
}
#right #jejajoin {
	padding-top: 30px;
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
button {
  width: 140px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

button:hover {
  background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
</style>
</head>
<body>
	<div id="top">
		<h1 style="font-weight: bold;">숨달에 오신 것을 환영합니다!</h1>
		<h2 style="text-align: center; ">숨달 회원가입은 달인과 제자가 나뉘어져 있어요!</h2>
	</div>
	<div id="left">
		<h2 style="font-weight: bold;">도움을 주고싶어요!</h2>
		<div id="dalinjoin">
			<button class="eff" style="width: 125px; font-size: 17px;"  type="button"  onclick="location.href = '/dal/dalin/join'">DALIN가입</button>
		</div>
	</div>
	<div id="right">
		<h2 style="font-weight: bold;">배우고 싶어요!</h2>
		<div id="jejajoin">
			<button class="eff"  style="width: 125px; font-size: 17px;" type="button"  onclick="location.href = '/dal/jeja/join'">JEJA가입</button>
		</div>
	</div>
	
	<div id="bottom">
		<a href="/dal/member/login"><span>이미 계정이 있으신가요?</span></a>
	</div>
</body>
</html>