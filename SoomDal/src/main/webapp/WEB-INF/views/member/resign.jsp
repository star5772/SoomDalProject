<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
$(document).ready(function(){
	$("#delete").on("click",function(){
		var params = {
			_method:"delete",
			_csrf:"${_csrf.token}",
		}
		$.ajax({
			url: "/dal/member/resign",
			method:"post",
			data:params
		}).done(()=>alert("삭제완료")).done(()=>{location.href="/dal"}).fail(()=>{console.log("fail");})
	})
})
</script>
<style>
 
</style>
</head>
<body>
	<div>
		<h1 style="font-size: 30px; font-weight: bold; line-height: 1.5em;">계정삭제</h1><br><br><br>
	</div>
	<div>
		<h3 style="font-size: 18px; font-weight: bold; top:500%;">정말로 계정을 삭제하고 싶으세요?</h3><br><br>
	</div>
	<p>- 계정을 삭제하면 모든 개인정보가 삭제되며, 구매하신 캐시는 소멸되며 환불되지 않아요.</p><br>
	<p>- 숨달로부터 너무 많은 알림을 받는 것이 문제라면, 알람 설정에서 변경하실 수 있어요.
숨고는 당신이 떠나는 것을 원하지 않아요. 만약 우리가 도와줄 수 있는 일이 있다면 support@soomdal.com으로 메일을 보내거나, 010-7321-5773으로 전화주세요.</p><br>
	<div>
		<strong style="font-size: 16px;">계정 삭제 이유</strong><br>
	</div>
	<div>
		<textarea style="width:100%; height:50%; background:#fff; border:1px solid #ccc; border-radius: 4px; font-size: 14px; padding: 6px 10px; overflow: scroll;"></textarea><br><br>
	</div>
	<div id="btn_area" style="display: inline-block;">
		<button id="delete" style="text-align: center; font-size: 15px; font-weight: bold; color: white;" class="btn btn-warning">계정삭제</button>
	</div>
	<div id="btn_area" style="display: inline-block;">
		<button id="cancel" class="btn btn-secondary" onclick="location.href='/dal'" style="text-align: center; font-size: 15px; font-weight: bold; border-radius: 4px; font-size: 14px; color:white;">취소</button>
	</div>
	<form action="/dal/member/resign">
		<input type="hidden" name="_csrf" value="${_csrf.token }">
	</form>
</body>
</html>