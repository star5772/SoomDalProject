<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	$("#delete").on("click",function(){
		var params = {
			_method:"delete",
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "/dal/member/resign",
			method:"post",
			data:params
		}).done((result)=>{$("#delete").text(result);}).fail((result)=>{console.log(result);})
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
	<p>- 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 ! </p><br>
	<p>- 그의 몸이 얼마나 튼튼하며 그들의 피부가 얼마나 생생하며 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이</p><br>
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
		<button id="cancel" class="btn btn-secondary" style="text-align: center; font-size: 15px; font-weight: bold; border-radius: 4px; font-size: 14px; color:white;">취소</button>
	</div>
	<form action="/dal/member/resign">
		<input type="hidden" name="_csrf" value="${_csrf.token }">
	</form>
</body>
</html>