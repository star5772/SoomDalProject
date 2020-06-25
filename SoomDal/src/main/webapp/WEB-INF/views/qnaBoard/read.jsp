<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판 글읽기</title>
<style>
 #center{margin-left: 20px; display: inline-block; }
  
 #cancel{
 width: 80px; height: 35px; background-color: #ffa500; color: white; font-size: 17px; 
 font-weight: bold;  outline: 0;border: 0;border-radius: 4px; float: right;
 }
 
 #list{
 width: 80px; height: 35px; background-color: #ffc968; color: white; 
 font-size: 17px; font-weight: bold;  outline: 0;border: 0;border-radius: 4px; float: left;
 }
</style>
</head>
<body>
<%-- ${qnaBoard } --%>
	<div id="center" >
		<div
			style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">Q&A</div>
		<div style="font-size: 19px;">궁금한것 무엇이든! 물어보세요!</div>
		<hr>
		<div>
			<label style="background-color: #d3d3d3; display: inline-block; width: 130px; text-align: center; font-size: 17px;">제 목</label>
			<!-- <div type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 400px;font-size: 17px;"></div> -->
			<a type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 400px;font-size: 17px;">행님덜! 인사 오지게 박습니다.</a>
			
			<label style="background-color: #d3d3d3; display: inline-block; width: 130px; text-align: center; font-size: 17px;">작성일</label>
			<!-- <div type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 100px;font-size: 17px; text-align: center;"></div> -->
			<a type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 120px;font-size: 17px; text-align: center;">2020-06-24</a>
			
			<label style="background-color: #d3d3d3; display: inline-block; width: 130px; text-align: center; font-size: 17px;">작성자</label>
			<!-- <div type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 100px;font-size: 17px; text-align: center;"></div> -->
			<a type="text" style="display:inline-block; color: rgb(94, 94, 94); width: 100px;font-size: 17px; text-align: center;">이은지</a>
			
		</div>
		<hr>
		<div>
			<a type="text" id="qTitle" style="width: 1027px; height: 500px; font-size: 17px; overflow: scroll;">안녕하세요안녕하세요ㅍ안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
			안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
			안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
			안녕하세요안녕하세요ㅍ안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
			안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
			안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
			안녕하세요안녕하세요ㅍ안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
			안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
			안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
			</a>
		</div>
		<hr>
		<br>
			<button id="cancel"  onclick="" >삭 제</button>
			<button id="list" onclick="" >목 록</button>
	</div>
</body>
</html>