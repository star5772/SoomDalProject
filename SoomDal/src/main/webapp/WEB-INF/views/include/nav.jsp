<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function() {
	$("#DalinLogout").on("click", function() {
		var param = {
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "/dal/dalin/logout",
			method: "post",
			data: param,
			success: function() {
				location.href = "/dal";
			}
		})
	});
	$("#JejaLogout").on("click", function() {
		var param = {
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "/dal/jeja/logout",
			method: "post",
			data: param,
			success: function() {
				location.href = "/dal";
			}
		})
	});
	$("#AdminLogout").on("click",function(){
		var param= {
				_csrf: "${_csrf.token}"
			}
		$.ajax({
			url:"/dal/admin/logout",
			method: "post",
			data: param,
			success: function(){
				location.href = "/dal";
			}
		})
	})
});
</script>
<script>
var openWin;

function openChild()
{
    // window.name = "부모창 이름"; 
    window.name = "main";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("/dal/member/find_id",
            "FindDalinId", "width=700, height=700, resizable = no, scrollbars = no");    
}

</script>	
<style>
#login{ margin-left: 20px; }
</style>
</head>
<body>
    <div class="container">
      <a class="navbar-brand" href="/dal" style="color:black; font-size:large;"><img src="/dal/image/MainLogo.png" style="width: 100px; height: 40px;"></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
      
        <ul class="navbar-nav ml-auto">
        	<sec:authorize access="isAnonymous()">
        		<li class="nav-item"><a class="nav-link" href="/dal/member/search"style="color:black; font-size:medium;"><i class="fas fa-search">&nbsp;달인 찾기</i></a></li>
        		<li class="nav-item"><a class="nav-link" href="/dal/jeja/reqboard/list"style="color:black; font-size:medium;">요청서게시판</a></li>
	          	<li class="nav-item"><a class="nav-link" href="/dal/member/join_select"style="color:black; font-size:medium;">회원가입</a></li>
	          	<li class="nav-item"><a class="nav-link" href="/dal/member/login"style="color:black; font-size: medium;">로그인</a></li>        	
        	</sec:authorize>
        	
        	<sec:authorize access="hasRole('ROLE_JEJA')">
        		<sec:authentication property="principal.username" var="username"/>
        		<li class="nav-item" style="width: 102px; text-align: center;"><a class="nav-link" href="/dal/member/search"style="color:black; font-size:medium;"><i class="fas fa-search">&nbsp;달인 찾기</i></a></li>
        		<li class="nav-item" style="width: 110px; "><a class="nav-link" href="/dal/jeja/reqboard/list"style="color:black; font-size:medium; font-weight: normal;">요청서게시판</a></li>
        		<li class="nav-item" style="width: 65px; text-align: center;"><a class="nav-link" href="/dal/jeja/my_info"style="color:black; font-size:medium; font-weight: normal;">내 정보</a></li>
        		<li class="nav-item" style="width: 58px; text-align: center;"><a class="nav-link" href="/dal/member/memo/memo_receiveList?dEmail=${username }" style="font-weight: normal;color:black; font-size:medium;">쪽지함</a></li>
        		<li class="nav-item" style="width: 75px; text-align: center;"><a class="nav-link" href="#"style="color:black; font-size:medium; font-weight: normal;" id="JejaLogout">로그아웃</a></li>
        	</sec:authorize>
        	
        	<sec:authorize access="hasRole('ROLE_DALIN')">
        		<sec:authentication property="principal.username" var="username"/>
        		<li class="nav-item" style="width: 58px;"><a class="nav-link" href="/dal/member/memo/memo_receiveList?dEmail=${username }"style="color:black; font-size:medium; font-weight: normal;">쪽지함</a></li>
				<li class="nav-item dropdown" style="width: 100px;">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black;font-size:medium; font-weight: normal;">달인 회원</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
					<a class="dropdown-item" href="/dal/dalin/my_profile?dEmail=${username}"style="color:black; font-size:medium;">프로필 관리</a>
					<a class="dropdown-item" href="/dal/dalin/my_info"style="color:black; font-size:medium;">마이페이지</a>
					<a class="dropdown-item" href="#"style="color:black; font-size:medium;" id="DalinLogout">로그아웃</a>
					</div>
				</li>
        	</sec:authorize>
        	
        	<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size:15px; color: black;">관리자메뉴</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
					<a class="dropdown-item" href="/dal/admin/member_manage"style="color:black; font-size:medium;">회원 관리</a>
					<a class="dropdown-item" href="/dal/admin/jeja_manage"style="color:black; font-size:medium;">신고 회원 관리</a>
					<a class="dropdown-item" href="/dal/admin/review_manage"style="color:black; font-size:medium;">신고 게시물 관리</a>
					<a class="dropdown-item" href="/dal/admin/enabled_manage"style="color:black; font-size:medium;">블락 회원 관리</a>
					<a class="dropdown-item" href="/dal/admin/refund_manage"style="color:black; font-size:medium;">환불 관리</a>
					<a class="dropdown-item" href="#"style="color:black; font-size:medium;" id="AdminLogout">로그아웃</a>
					</div>
				</li>
        	</sec:authorize>
        	</ul>
      </div>
    </div>
</body>
</html>