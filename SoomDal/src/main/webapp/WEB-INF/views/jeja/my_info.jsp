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
	a {
		padding: 
	}
</style>
</head>
<body>
	<br><br><br><br><br>
	<div id="my_info_container">
		<div id="my_info_title">
			<h3>마이페이지</h3>
		</div>
		<hr>
		<div id="my_info_profile">
			<div id="profile">profile</div>
			<div id="info">
				OOO제자님<br> 제자 이메일
			</div>
		</div>
		<div id="menu">
			<hr>
			<span>레슨 관리</span>
			<ul class="nav flex-column">
				<li class="nav-item">
					<a class="nav-link active" href="#">요청서</a>
					<hr>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">견적서</a>
					<hr>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">레슨 내역</a>
				</li>
			</ul>
		</div>
		<hr>
		<div>
			<span>설정</span>
			<ul class="nav flex-column">
				<li class="nav-item">
					<a class="nav-link active" href="#">알림</a>
					<hr>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">공지사항</a>
					<hr>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">제자 가이드</a>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>