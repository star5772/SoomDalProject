<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판 글읽기</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<style>
 #center{margin-left: 20px; display: inline-block; margin-top: 20px; margin-bottom: 20px;}
  
 #cancel{
 width: 80px; height: 35px; background-color: #ffa500; color: white; font-size: 17px; 
 font-weight: bold;  outline: 0;border: 0;border-radius: 4px; float: right;
 }
 #cancel2{
 width: 80px; height: 35px; background-color: #ffa500; color: white; font-size: 17px; 
 font-weight: bold;  outline: 0;border: 0;border-radius: 4px; float: left;  margin-top: 10px;  margin-bottom: 20px;
 }
 
 #list{
 width: 80px; height: 35px; background-color: #ffc968; color: white; 
 font-size: 17px; font-weight: bold;  outline: 0;border: 0;border-radius: 4px; float: left;
 }
 #answer{
 	 width: 80px; height: 35px; background-color: #ffa500; color: white; font-size: 17px; 
 font-weight: bold;  outline: 0;border: 0;border-radius: 4px; float: right;  margin-top: 10px;  margin-bottom: 20px;
 }
#formal{
width: 80px; height: 35px;  background-color: #ffc968; color: white; font-size: 17px; 
 font-weight: bold;  outline: 0;border: 0;border-radius: 4px;  float: left; margin-right: 15px; margin-top: 10px; border-radius: 4px;
}
#qNoRead {
	height: 40px; border-bottom: 1px solid #d3d3d3; border-top: 1px solid #d3d3d3; line-height: 40px;
}
</style>
<script>
	$(function() {
		$("#answer").on("click",function() {
			if($("#cContent").val().length==0){
				Swal.fire("실패!", "답변 내용을 작성하세요", "info")
				return false;
			}
			params= {
				_csrf:"${_csrf.token}",
				cContent:$("#cContent").val(),
				qNo:${read.QNo}
			}
			$.ajax({
				url:"/dal/comment/write",
				method:"post",
				data:params
			}).done(()=>location.reload()).fail(()=>Swal.fire("실패!","fail","warning"))
		})
		
		$("#cancel2").on("click", function(){
			params = {
				_csrf:"${_csrf.token}",
				_method:"delete",
				qNo:${read.QNo},
				cNo:"${read.comment.CNo}"
			}
			$.ajax({
				url:"/dal/comment/delete",
				method:"post",
				data:params
			}).done(()=>location.reload()).fail(()=>Swal.fire("실패!","fail","warning"))
		});
	});

</script>
</head>
<body>
<form action="/dal/dalin/qnaBoard/delete" method="post">
	<div id="center" >
		<div style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); margin-bottom: 20px;">Q&A</div>
		<div style="font-size: 19px;">궁금한것 무엇이든! 물어보세요!</div><br>
		<input type="hidden" name="qNo" value="${read.QNo}">
		<div id="qNoRead">
			<label style="background-color: #d3d3d3; display: inline-block; width: 130px; text-align: center; font-size: 17px; height: 38px;">제 목</label>
			<!-- <div type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 400px;font-size: 17px;"></div> -->
			<a type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 400px;font-size: 17px;">${read.title}</a>
			
			<label style="background-color: #d3d3d3; display: inline-block; width: 100px; text-align: center; font-size: 17px; height: 38px;">작성일</label>
			<!-- <div type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 100px;font-size: 17px; text-align: center;"></div> -->
			<a type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 100px;font-size: 17px; text-align: center;">${read.writeDateStr}</a>
			
			<label style="background-color: #d3d3d3; display: inline-block; width: 100px; text-align: center; font-size: 17px; height: 38px;">작성자</label>
			<!-- <div type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 100px;font-size: 17px; text-align: center;"></div> -->
			<a type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 130px;font-size: 17px; text-align: center;">${read.name }</a>
			
		</div><br>
		<div>
			<textarea rows="20" cols="128"  style="background-color:white; font-size: 17px; overflow:hidden;" disabled="disabled">${read.content}
			</textarea>
		</div>
		<br>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username" var="username"/>
			</sec:authorize>
			<c:if test="${read.writer eq username }">
				<button id="cancel"  class="btn btn-success" type="submit">삭 제</button>
			</c:if>
			<button id="list"  onclick="location.href='list'" type="button" >목 록</button>
	</div>
</form>	
	<!--   이용자들이 볼때 댓글 모양-->
	<c:choose>
		<c:when test="${read.cno eq null }">
			
		</c:when>
		<c:otherwise>
			<div style="margin-left: 20px; display: inline-block;"> 
		<hr>
			<label style="background-color: white; display: inline-block; width: 130px; text-align: center; font-size: 17px;">관리자 </label>
			<a type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 400px;font-size: 17px;">${read.comment.CWriteDateStr }</a>
		<hr>
		<textarea rows="5" cols="125" style="font-size: 17px; margin-left:20px; 
		display: inline-block; margin-top: 20px; outline: 0;border: 0; background-color: white;" disabled="disabled">${read.comment.CContent }</textarea>
		<hr>
	</div>
		</c:otherwise>
	</c:choose>
	<!-- 관리잔 답글 달기  sec-->
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<c:if test="${read.cno eq null }">
		<div style="margin-left: 20px; display: inline-block;">
			<textarea name="cContent"  id="cContent" rows="7" cols="126" placeholder="답변하실 내용을 입력해주세요." style="font-size: 17px; margin-left:15px;
				display: inline-block; margin-top: 20px;" ></textarea>
			<button id="answer">답 변</button>
		</div>
		</c:if>
		<!-- 관리자가 자신의 댓글을 볼때 sec -->
		
		<div style="margin-left:20px; float: left; display: inline-block;">
		<c:if test="${not empty read.cno}">
			<button id="cancel2">삭 제</button>
		</c:if>	
		</div>
	</sec:authorize> 

	
</body>
</html>