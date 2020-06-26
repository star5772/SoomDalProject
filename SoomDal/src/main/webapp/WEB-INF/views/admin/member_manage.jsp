<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${jeja }
	<div id="manage_title" style="display: inline-block; width: 250px; text-align: center; position: absolute; left: 40%">
		<h1>회원 관리</h1>
	</div>
	<div style="display: inline-block; width: 80px; position: absolute; left: 77.5%; top: 25%;">
		<select>
			<option>제자회원</option>
			<option>달인회원</option>
		</select>
	</div>
<div id="manage_wrap">
	<div id="menu_wrap" style="width: 200px; display: inline-block; text-align: center; padding: 150px 20px; float: left;">
		<div class="list-group">
    		<a href="#" class="list-group-item">회원 관리</a>
    		<a href="#" class="list-group-item">게시물 관리</a>
    		<a href="#" class="list-group-item">신고 회원관리</a>
    		<a href="#" class="list-group-item">블락회원 관리</a>
    		<a href="#" class="list-group-item">환불 관리</a>
  		</div>
	</div>

	<div id="table_wrap" style="width: 700px; display: inline-block; padding: 100px 0; float: left;">
		<table class="table table-hover">
			<colgroup>
				<col width="20%">
				<col width="30%">
				<col width="20%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<tr class="warning">
				<th>이름</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>신고당한 횟수</th>
				<th>블락 여부</th>
			</tr>
		
			<!--  
			<c:forEach items="${jeja }" var="j">
				<tr>
					<td>${j.jName }</td>
					<td>${j.jEmail }</td>
					<td>${j.jMno }</td>
					<td>${j.jAccusationCnt }</td>
					<td>${j.enabled }</td>
				</tr>
			</c:forEach>
			-->
		</table>
	</div>
</div>
</body>
</html>