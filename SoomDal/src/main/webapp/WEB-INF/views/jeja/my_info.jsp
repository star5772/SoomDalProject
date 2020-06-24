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
      color: #737373;
   }
   .menu_span {
	  width: 585px;
	  display: inline-block;
   }
</style>
</head>
<body>
   <div id="my_info_container">
      <div id="my_info_title">
         <h1>마이페이지</h1>
      </div>
      <div id="my_info_profile" style="height: 100px;">
         <a href="#" style="text-decoration:none">
         	<div id="profile">
         		<img src="/image/jeja.jpg" class="img-thumbnail" style="width: 70px; height: 70px;">
         	</div>
         	<div id="user_info" style="display:inline-block; width: 540px;">
            	<div id="user_name">
            		<span id="name_length">OOO</span>제자님
           	 	</div>
            	<div id="user_email">
            		<span id="email_length">aaa@a.com</span>
            	</div>
         	</div>
         	<img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"> 
         </a>
      </div>
      <div id="menu">
         <hr>
         <span><h3>레슨 관리</h3></span>
         <ul class="nav flex-column">
            <li class="nav-item">
               <a class="nav-link active" href="#"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-quote-template.svg" style="padding: 5px;"><span class="menu_span">요청서</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
               <hr>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="#"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-quote-template.svg" style="padding: 5px;"><span class="menu_span">견적서</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
               <hr>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="#"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-auto-quote.svg" style="padding: 5px;"><span class="menu_span">레슨 내역</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
            </li>
         </ul>
      </div>
      <hr>
      <div>
         <span><h3>설정</h3></span>
         <ul class="nav flex-column">
            <li class="nav-item">
               <a class="nav-link active" href="#"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-alarm.svg" style="padding: 5px;"><span class="menu_span">알림</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
               <hr>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="#"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-soomgo-info.svg" style="padding: 5px;"><span class="menu_span">공지사항</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
               <hr>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="#"><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-soomgo-notice.svg" style="padding: 5px;"><span class="menu_span">제자 가이드</span><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg"></a>
            </li>
         </ul>
      </div>
   </div>
</body>
</html>