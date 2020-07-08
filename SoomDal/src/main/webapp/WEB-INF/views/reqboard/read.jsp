
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<style>
.tdw{
	display: inline-block;
	height: 50px;
	text-align: center;
}
label {
	margin-bottom: 0px;
	height: 50px;
}
input {
	height: 35px;
}
span {
	margin-bottom: 20px;
}
</style>
<script>
function report_pop() {
	var rbNo=${reqRead.rbNo};
	window.open("report?rbNo="+rbNo,"report","width=500, height=500,left=500,top=200, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}
$(function() {
	$("#report").on("click",function() {
		report_pop();
	});
	$("#deleteToReq").on("click",function() {
		var params = {
				rbNo = $("#rbNo").val(),
				_csrf = "${_csrf.token}"
			}
		$.ajax({
			url: "/dal/member/reqboard/delete",
			method: "post",
			data: params,
			success: function() {
				alert("삭제 완료");
				location.href = "/dal/member/reqboard/list"
			}
		})
	})
});

	
</script>
</head>
<body>
	<div>
		<h1 style="font-size: 30px; font-weight: bold; line-height: 1.5em; margin-top: 20px; margin-bottom: 20px;">요청서</h1>
	</div>
	<div style="width: 100%; border-bottom: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; line-height: 40px; height: 40px;">
		<div class="tdw"><label style="width:130px; text-align:center; background-color: #DDDDDD; font-size: 17px; display: inline-block; height: 38px;">제목</label>&emsp;<input type="text" name="rbTitle" style="font-size:17px; marfont-size: 17px; width: 350px; border: none; " readonly="readonly"value="${reqRead.rbTitle }"></div>
		<div class="tdw"><label style="width:100px; text-align:center;background-color: #DDDDDD; font-size: 17px; display: inline-block; margin-left: 60px; height: 38px;">작성일</label>&emsp;<input type="text" name="rbDate" style="font-size: 17px; width: 150px; border: none;text-align:center;" readonly="readonly"value="${reqRead.rbWriteDateStr }"></div>
		<div class="tdw"><label style="width:100px; text-align:center;background-color: #DDDDDD; font-size: 17px; display: inline-block; margin-left: 15px; height: 38px;">작성자</label>&emsp;<input type="text" name="rbWriter" style="font-size: 17px; width: 150px;  border: none;text-align:center; width: 100px; "readonly="readonly"value="${reqRead.JName }"></div>
	</div><br>
	<input type="hidden" id="rbNo" value="${reqRead.rbNo }">
	<input type="hidden" id="rNo" value="${reqRead.RNo}">
	<input type="hidden" id="jMno" value="${reqRead.JMno}">
	<div style="font-size: 20px;">
		<span style="font-weight: bold;">▶ 배우고싶은 분야 : </span><span>${reqRead.fieldOrHobby}</span><br><br>
		<span style="font-weight: bold;">▶ 레슨의 목적 : </span><span>${reqRead.lessonPurpose}</span><br><br>
		<span style="font-weight: bold;">▶ 수준 : </span><span>${reqRead.myLevel}</span><br><br>
		<span style="font-weight: bold;">▶ 장비의 유무 : </span><span>${reqRead.tools}</span><br><br>
		<span style="font-weight: bold;">▶ 원하는 레슨 형태 : </span><span>${reqRead.lesson}</span><br><br>
		<span style="font-weight: bold;">▶ 원하는 레슨 시간 : </span><span>${reqRead.lessonTime}</span><br><br>
		<span style="font-weight: bold;">▶ 연령대 : </span><span>${reqRead.age}</span><br><br>
		<span style="font-weight: bold;">▶ 성별 : </span><span>${reqRead.gender}</span><br><br>
		<span style="font-weight: bold;">▶ 원하는 레슨 지역 : </span><span>${reqRead.zone}</span><br><br>
		<p style="font-weight: bold;">▶ 희망 사항 </p>
		<textarea rows="15"  style="resize: none; width: 1070px; height: 200px;" readonly="readonly"> ${reqRead.etc}</textarea>
	</div>
	<div style="margin-bottom: 40px; margin-top: 20px;">
	<div id="btn_area" style="display: inline-block;">
		<button id="list" onclick="location.href='list'" style="text-align: center; font-size: 17px; font-weight: bold; color: white; margin-top: 10px;border-radius: 4px;" class="btn btn-warning">목록으로</button>
	</div>
	<div id="btn_area" style="display: inline-block;">
		<button id="report" type="button" style="text-align: center; font-size: 17px; font-weight: bold; color: white;  margin-top: 10px;border-radius: 4px; margin-left: 5px;" class="btn btn-secondary">신고</button>
	</div>
	<div>
		<button id="deleteToReq" type="button">삭제</button>
	</div>
	<sec:authorize access="hasRole('ROLE_DALIN')">
	<div id="btn_area" style="display: inline-block; float: right">
		<button id="estimate" onclick="location.href='/dal/dalin/estimate/sendEstimate?rNo=${reqRead.RNo}'" style="font-size: 17px; font-weight: bold; color: white;  margin-top: 10px;border-radius: 4px;" class="btn btn-warning">견적서 보내기</button>
	</div>
	</sec:authorize>
	</div>
</body>

</html>
