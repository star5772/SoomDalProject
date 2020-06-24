<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#profile {
		display: inline-block;
		float: left;
		margin: 15px;
	}
	#info {
		float: left;
	}
	#menu {
		clear: both;
	}
	#my_info_container {
		margin: 0 200px;
	}
	#my_info_title {
		padding: 50px 0px;
		font-weight: bold;
	}
	#user_name {
		font-size: 18px;
	}
	#user_email {
		font-size: 12px;
		color: #b5b5b5;
	}
	#my_info_profile {
		color: black;
	}
	a:link {color:black;}
	a:visited {color:black;}
	a:active {color:black;}
	a:hover {color:black;}
	
	h3 {
		font-size: 18px;
	}
	li {
		font-size: 16px;
	}
	
</style>
</head>
<body>
	<div id="my_info_container">
		<div id="my_info_title">
			<h1>마이페이지</h1>
		</div>
		
		<div id="my_info_profile">
			<a href="#" style="text-decoration:none">
			<div id="profile">image</div>
			<div id="user_info">
				<div id="user_name">
				<span id="name_length">OOO</span>제자님
				</div>
				<div id="user_email">
				<span id="email_length">aaa@a.com</span>
				</div>
			</div>
			</a>
		</div>
		<div id="menu">
			<hr>
			<span><h3>레슨 관리</h3></span>
			<ul class="nav flex-column">
				<li class="nav-item">
					<a class="nav-link active" href="#" style="color:#757575">요청서</a>
					<hr>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#" style="color:#757575">견적서</a>
					<hr>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#" style="color:#757575">레슨 내역</a>
				</li>
			</ul>
		</div>
		<hr>
		<div>
			<span><h3>설정</h3></span>
			<ul class="nav flex-column">
				<li class="nav-item">
					<a class="nav-link active" href="#" style="color:#757575">알림</a>
					<hr>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#" style="color:#757575">공지사항</a>
					<hr>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#" style="color:#757575">제자 가이드</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>