
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
	});
</script>
</head>
<body>
	<div>
		<h1 style="font-size: 30px; font-weight: bold; line-height: 1.5em;">요청서</h1>
	</div>
	<div>
	<hr>
		<div style="width: 100%">
		<div class="tdw"><label style="width:130px; text-align:center; background-color: #DDDDDD; font-size: 17px; display: inline-block; ">제목</label>&emsp;<input type="text" name="rbTitle" style="font-size:17px; marfont-size: 17px; width: 350px; border: none; " readonly="readonly"value="${reqRead.rbTitle }"></div>
		<div class="tdw"><label style="width:100px; text-align:center;background-color: #DDDDDD; font-size: 17px; display: inline-block; margin-left: 60px;">작성일</label>&emsp;<input type="text" name="rbDate" style="font-size: 17px; width: 150px; border: none;text-align:center;" readonly="readonly"value="${reqRead.rbWriteDateStr }"></div>
		<div class="tdw"><label style="width:100px; text-align:center;background-color: #DDDDDD; font-size: 17px; display: inline-block; margin-left: 15px;">작성자</label>&emsp;<input type="text" name="rbWriter" style="font-size: 17px; width: 150px;  border: none;text-align:center; width: 100px; "readonly="readonly"value="${reqRead.rbWriter }"></div>
		</div>
	<hr>
	</div>
	<textarea rows="20" cols="133" disabled="disabled" style="border: none; background-color:white; font-size: 17px; overflow: scroll;" readonly="readonly">${reqRead.rbContent }</textarea>
	<div>
		<hr>
	</div>
	<div id="btn_area" style="display: inline-block;">
		<button id="list" onclick="location.href='list'" style="text-align: center; font-size: 17px; font-weight: bold; color: white; margin-top: 10px;border-radius: 4px;" class="btn btn-warning">목록으로</button>
	</div>
	<div id="btn_area" style="display: inline-block;">
		<button id="report" type="button" style="text-align: center; font-size: 17px; font-weight: bold; color: white;  margin-top: 10px;border-radius: 4px;" class="btn btn-secondary">신고</button>
	</div>
	<div id="btn_area" style="display: inline-block; float: right">
		<button id="estimate" style="font-size: 17px; font-weight: bold; color: white;  margin-top: 10px;border-radius: 4px;" class="btn btn-warning">견적서 보내기</button>
	</div>
</body>

</html>
