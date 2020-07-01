<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판 글읽기</title>
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<style>
 #center{margin-left: 20px; display: inline-block; }
  
 #cancel,#cancel2{
 width: 80px; height: 35px; background-color: #ffa500; color: white; font-size: 17px; 
 font-weight: bold;  outline: 0;border: 0;border-radius: 4px; float: right;
 }
 
 #list{
 width: 80px; height: 35px; background-color: #ffc968; color: white; 
 font-size: 17px; font-weight: bold;  outline: 0;border: 0;border-radius: 4px; float: left;
 }
 #answer{
 	 width: 80px; height: 35px; background-color: #ffa500; color: white; font-size: 17px; 
 font-weight: bold;  outline: 0;border: 0;border-radius: 4px; float: right;  margin-top: 10px; 
 }
#formal{
width: 80px; height: 35px;  background-color: #ffc968; color: white; font-size: 17px; 
 font-weight: bold;  outline: 0;border: 0;border-radius: 4px;  float: left; margin-right: 15px; margin-top: 10px; border-radius: 4px;
}
</style>
<script>
	$(function() {
	});
</script>
</head>
<body>
${read }
<form action="/dal/member/qnaBoard/delete" method="post">
	<div id="center" >
		<div style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">Q&A</div>
		<div style="font-size: 19px;">궁금한것 무엇이든! 물어보세요!</div>
		<hr>
		<input type="hidden" name="qNo" value="${read.QNo}">
		<div id="qNoRead">
			<label style="background-color: #d3d3d3; display: inline-block; width: 130px; text-align: center; font-size: 17px;">제 목</label>
			<!-- <div type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 400px;font-size: 17px;"></div> -->
			<a type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 400px;font-size: 17px;">${read.title}</a>
			
			<label style="background-color: #d3d3d3; display: inline-block; width: 100px; text-align: center; font-size: 17px;">작성일</label>
			<!-- <div type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 100px;font-size: 17px; text-align: center;"></div> -->
			<a type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 100px;font-size: 17px; text-align: center;">${read.writeDateStr}</a>
			
			<label style="background-color: #d3d3d3; display: inline-block; width: 100px; text-align: center; font-size: 17px;">작성자</label>
			<!-- <div type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 100px;font-size: 17px; text-align: center;"></div> -->
			<a type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 130px;font-size: 17px; text-align: center;">${read.name }</a>
			
		</div>
		<hr>
		<div>
			<textarea rows="20" cols="128"  style="background-color:white; font-size: 17px; overflow: scroll;" disabled="disabled">${read.content}
			</textarea>
		</div>
		<hr>
		<br>
			<button id="cancel"  class="btn btn-success" type="submit">삭 제</button>
			<button id="list"  onclick="location.href='list'" type="button" >목 록</button>
	</div>
</form>	
	<!--   이용자들이 볼때 댓글 모양--> 
	<div style="margin-left: 20px; display: inline-block;"> 
		<hr>
			<label style="background-color: white; display: inline-block; width: 130px; text-align: center; font-size: 17px;">관리자 </label>
			<a type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 400px;font-size: 17px;">2020-06-20</a>
		<hr>
		<textarea rows="5" cols="125" style="font-size: 17px; margin-left:20px;
		display: inline-block; margin-top: 20px; outline: 0;border: 0; background-color: white;" disabled="disabled">이런식으로 해결이 가능합니다! 해결완료! 우횻!~</textarea>
		<hr>
	</div>
	<!-- 관리잔 답글 달기  sec-->
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div style="margin-left: 20px; display: inline-block;">
			<textarea rows="5" cols="126" placeholder="답변하실 내용을 입력해주세요." style="font-size: 17px; margin-left:20px;
				display: inline-block; margin-top: 20px;" ></textarea>
		
		<table>
			<button id="answer" onclick="" >답 변</button>
		</table> 
		</div>
	
		
		<!-- 관리자가 자신의 댓글을 볼때 sec -->
		
		<div style="margin-left: 20px; display: inline-block;">
		
		<table>
			<button id="formal" onclick=""  >수 정</button>
			<button id="cancel2" onclick="" >삭 제</button>
		</table>
		</div>
	</sec:authorize> 
	
</body>
</html>