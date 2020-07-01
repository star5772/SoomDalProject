<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<script>
$(document).ready(function(){
	$("#write").on("click",function(){
		console.log($("#writeForm").serialize())
		$("#writeForm").submit();
	})
})
</script>
</head>
<body>
	<div id="report">
		<h1 style="font-size: 30px; font-weight: bold; line-height: 1.5em;">요청서</h1>
	</div>
</body>
	<form action="/dal/member/reqboard/write" method="post" id="writeForm">
	<div>
		<label for="rbTitle">제목</label><br>
		<input type="text" id="rbTitle" name="rbTitle" style="font-size: 15px; font-weight: bold; width: 47%; height: 100%; border-radius: 5px;"><br><br><br>
	</div>
	<div>
	<h3>요청내용</h3>
	<textarea rows="23" cols="100" id="rbContent" name="rbContent" style="resize: none" name="content">
	분야 :
		
	종목 :
		
	목적 :
		
	작성자 수준 :
		
	도구의 유무 :
		
	레슨 형태(개인, 그룹) :
		
	원하는 날짜, 시간 :
		
	연령 :
		
	성별 :
		
	원하는 지역 :
		
	기타 문의 및 희망사항 :
	</textarea>
	</div>
	<input type="hidden" name="_csrf" value="${_csrf.token}">
	<button type="button" id="write" class="btn btn-warning" style="text-align: center; font-size: 15px; font-weight: bold; color: white">작성</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="button" id="list" class="btn btn-secondary" style="text-align: center; font-size: 15px; font-weight: bold; color: white">목록으로</button>
	</form>
</html>