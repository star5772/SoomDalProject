<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#login{ margin-left: 20px; }
</style>
</head>
<body>
    <div class="container">
      <a class="navbar-brand" href="/dal">SoomDal</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        	<sec:authorize access="isAnonymous()">
        		<li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-search">달인 찾기</i></a></li>
        		<li class="nav-item"><a class="nav-link" href="#">아이디 찾기</a></li>
	          	<li class="nav-item"><a class="nav-link" href="#">비밀번호 찾기</a></li>
	          	<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
	          	<li class="nav-item"><a class="nav-link" href="#" >로그인</a></li>        	
        	</sec:authorize>
        	
        	<sec:authorize access="hasRole('ROLE_JEJA')">
        		<li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-search">달인 찾기</i></a></li>
        		<li class="nav-item"><a class="nav-link" href="#">내 정보</a></li>
        		<li class="nav-item"><a class="nav-link" href="#">쪽지함</a></li>
        		<li class="nav-item"><a class="nav-link" href="#" >로그아웃</a></li>
        	</sec:authorize>
        	
        	<sec:authorize access="hasRole('ROLE_DALIN')">
        		<li class="nav-item"><a class="nav-link" href="#">내정보</a></li>
        		<li class="nav-item"><a class="nav-link" href="#">쪽지함</a></li>
        		<li class="nav-item"><a class="nav-link" href="#" >로그아웃</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">OOO고객님</a>
					<div>안녕하세요 OOO님</div> <!-- 나중에 작업 -->
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
					<a class="dropdown-item" href="#">프로필 관리</a>
					<a class="dropdown-item" href="#">마이페이지</a>
					</div>
					<a class="dropdown-item" href="#">로그아웃</a>
				</li>
        	</sec:authorize>
        	
        	<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리자메뉴</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
					<a class="dropdown-item" href="#">제자 회원 관리</a>
					<a class="dropdown-item" href="#">달인 회원 관리</a>
					<a class="dropdown-item" href="#">신고 회원 관리</a>
					<a class="dropdown-item" href="#">신고 게시물 관리</a>
					<a class="dropdown-item" href="#">블락 회원 관리</a>
					<a class="dropdown-item" href="#">로그아웃</a>
					</div>
				</li>
        	</sec:authorize>
        	</ul>
      </div>
    </div>
</body>
</html>