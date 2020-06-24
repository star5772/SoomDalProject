<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판 글쓰기</title>
<style>
 #center{margin-left: 50px; display: inline-block; } 
</style>
</head>
<body>
	<div id="center" >
		<div
			style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">Q&A</div>
		<div style="font-size: 19px;">궁금한것 무엇이든! 물어보세요!</div>
		<hr>
		<div>
			<label
				style="background-color: #d3d3d3; display: inline-block; width: 130px; text-align: center; font-size: 17px;">제 목</label>
			<input type="text" placeholder="제목을 입력해주세요." style="color: rgb(94, 94, 94); width: 780px;font-size: 17px;">
		</div>
		<hr>
		<textarea rows="20" cols="126" placeholder="궁금하신 내용을 입력해주세요." style="font-size: 17px;" ></textarea>
		<hr>
		<div>
			<label style="width:130px;  text-align: center; background-color: #d3d3d3; display: inline-block; font-size: 17px;">비밀글설정</label>
			<input type="radio" name="isSecret" style="width: 25px; "><span style="font-size: 17px; display: inline-block;"  >공개글</span>
			<input type="radio" name="isSecret" style="width: 25px; "><span style="font-size: 17px; display: inline-block;"  >비밀글</span>
		</div>
		<hr>
		<div style=" float:right;">
			<button  onclick="" style="width: 80px; height: 30px; background-color: black; color: white; font-size: 17px; font-weight: bold;">등 록</button>
			<button  onclick="" style="width: 80px; height: 30px; background-color: #d3d3d3; font-size: 17px; font-weight: bold;">취 소</button>
		</div>
	</div>
</body>
</html>