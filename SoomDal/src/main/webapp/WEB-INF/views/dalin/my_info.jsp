<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<script>
	var openWin;

	function openChild() {
		// window.name = "부모창 이름"; 
		window.name = "dalinMyInfo";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("/dal/dalin/usedCashList?dMno=${myInfo.DMno}",
				"usedCash",
				"width=700, height=700, resizable = no, scrollbars = no");
	}
</script>
<style>
#profile {
	display: inline-block;
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
	font-weight: 500;
}

#user_email {
	font-size: 12px;
	color: #b5b5b5;
}

#my_info_profile {
	color: black;
}

a:link {
	color: #737373;
}

a:visited {
	color: #737373;
}

a:active {
	color: #737373;
}

a:hover {
	color: #737373;
}

h3 {
	font-size: 18px;
	font-weight: bold;
}

li {
	font-size: 16px;
	width: 675px;
	font-weight: bolder;
}

.menu_span {
	width: 585px;
	display: inline-block;
}

.store {
	background-color: orange;
	border-radius: 10px;
	display: inline-block;
	width: 110px;
	color: white;
	text-align: center;
}

#str {
	width: 475px;
}

h1 {
	font-weight: bold;
}

hr {
	width: 658.2px;
}
</style>
</head>
<body>
   <div id="my_info_container">
      <div id="my_info_title">
         <h1>마이페이지</h1>
      </div>
      <div id="my_info_profile" style="height: 100px;">
         <a href="/dal/dalin/my_info_update" style="text-decoration:none">
         	<div id="profile">
         		<img src="${myInfo.DProfile }" class="img-thumbnail" style="width: 70px; height: 70px;">
         	</div>
         	<div id="user_info" style="display:inline-block; width: 530px;  color: black;">
            	<div id="user_name">
            		<span id="name_length">${myInfo.DName}</span> 달인님
           	 	</div>
            	<div id="user_email">
            		<span id="email_length">${myInfo.DEmail}</span><br>
            		<span id="level_length">${myInfo.DLevelStr}</span>
            	</div>
         	</div>
         	<img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg">
         </a>
      </div>
      <div>
      <hr>
         <span><h3>숨달 캐시</h3></span>
         <ul class="nav flex-column">
            <li class="nav-item">
               <a class="nav-link active" href="/dal/dalin/payment/store"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-store.svg" style="padding: 5px;"><span id="str" class="menu_span">스토어</span><div class="store"><span>${myInfo.DCash} 캐시</span></div><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
               <hr>
            </li>
            <li class="nav-item">
               <a class="nav-link" onclick="openChild()" href="#"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-dashboard.svg" style="padding: 5px;"><span class="menu_span">사용 내역</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
            </li>
         </ul>
      </div>
      <div id="menu">
         <hr>
         <span><h3>레슨 관리</h3></span>
         <ul class="nav flex-column">
            <li class="nav-item">
               <a class="nav-link active" href="/dal/jeja/request/receiveRequest?dMno=${myInfo.DMno }"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-quote-template.svg" style="padding: 5px;"><span class="menu_span">요청서</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
               <hr>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="/dal/dalin/estimate/sendEstimateList?dMno=${myInfo.DMno}"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-quote-template.svg" style="padding: 5px;"><span class="menu_span">견적서</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
               <hr>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="/dal/jeja/lessonList?jMno=${myInfo.DMno }"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-auto-quote.svg" style="padding: 5px;"><span class="menu_span">레슨 내역</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
            </li>
         </ul>
      </div>
      <hr>
      <div>
         <span><h3>설정</h3></span>
         <ul class="nav flex-column">
            <li class="nav-item">
               <a class="nav-link active" href="/dal/member/memo/memo_receiveList"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-alarm.svg" style="padding: 5px;"><span class="menu_span">알림</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
               <hr>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="/dal/jeja/reqboard/list"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-soomgo-info.svg" style="padding: 5px;"><span class="menu_span">요청서 게시판</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
               <hr>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="/dal/dalin/qnaBoard/list"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-soomgo-notice.svg" style="padding: 5px;"><span class="menu_span">달인 가이드</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
            </li>
         </ul>
      </div>
   </div>
	
</body>
</html>