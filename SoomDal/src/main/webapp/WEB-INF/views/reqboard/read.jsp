
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.tdw{
	display: inline-block;
}
</style>

</head>

<body>

	<div id="report">
		<h1 style="font-size: 30px; font-weight: bold; line-height: 1.5em;">요청서</h1>
	</div>
	<div>
		<div style="width: 100%">
		<div class="tdw"><label style="background-color: #DDDDDD; font-size: medium; display: inline-block;">제목</label><input type="text" name="rbTitle" style="font-size: small; width: 300px; border: 1px solid black;" readonly="readonly"value="${reqRead.rbTitle }"></div>
		<div class="tdw"><label style="background-color: #DDDDDD; font-size: medium; display: inline-block;">작성일</label><input type="text" name="rbDate" style="font-size: small; width: 150px; border: 1px solid black;" readonly="readonly"value="${reqRead.rbWriteDateStr }"></div>
		<div class="tdw"><label style="background-color: #DDDDDD; font-size: medium; display: inline-block;">작성자</label><input type="text" name="rbWriter" style="font-size: small; width: 150px; border: 1px solid black;"readonly="readonly"value="${reqRead.rbWriter }"></div>
		</div>
	</div>
	<textarea rows="23" cols="100" style="border: none;" readonly="readonly">${reqRead.rbContent }</textarea>
	<div>
		<hr>
	</div>
	
	<div id="btn_area" style="display: inline-block;">
		<button id="list" style="text-align: center; font-size: 10px; font-weight: bold; color: white;" class="btn btn-warning">목록</button>
	</div>
	<div id="btn_area" style="display: inline-block;">
		<button id="report" style="text-align: center; font-size: 10px; font-weight: bold; color: white;" class="btn btn-secondary">신고</button>
	</div>
	<div id="btn_area" style="display: inline-block; float: right">
		<button id="estimate" style="font-size: 10px; font-weight: bold; color: white;" class="btn btn-warning">견적서 보내기</button>
	</div>

</body>

</html>
