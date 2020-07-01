<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#write").on("click",function(){
		if($("#qTitle").val().length==0 || $("#qContent").val().length==0) {
			Swal.fire("실패!","제목과 본문을 작성하세요","info")
			return;
		}
		$("#writeForm").submit();
	}) 
})
</script>
<style>
 #center{margin-left: 20px; display: inline-block; }
 #write{
 width: 80px; height: 35px; background-color: #ffa500; color: white; 
 font-size: 17px; font-weight: bold; outline: 0;border: 0;
 border-radius: 4px; float: right;
 }
 
 #cancel{
 width: 80px; height: 35px; background-color: #ffc968; color: white;
  font-size: 17px; font-weight: bold; outline: 0;border: 0;
  border-radius: 4px; float: left;
 } 
 
</style>
</head>
<body>
	<div id="center" >
		<div
			style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">Q&A</div>
		<div style="font-size: 19px;">궁금한것 무엇이든! 물어보세요!</div>
		<hr>
	<form action="/dal/member/qnaBoard/write" method="post" id="writeForm">
		<div>
			<label style="background-color: #d3d3d3; display: inline-block; width: 130px; text-align: center; font-size: 17px;">제 목</label>
			<input type="text" placeholder="제목을 입력해주세요." style="color: rgb(94, 94, 94); width: 780px;font-size: 17px;" name="qTitle" id="qTitle">
		</div>
		<hr>
		<textarea rows="20" cols="126" placeholder="궁금하신 내용을 입력해주세요." style="font-size: 17px;" name="qContent" id="qContent"></textarea>
		<hr>
		<div>
			<label style="width:130px;  text-align: center; background-color: #d3d3d3; display: inline-block; font-size: 17px;">비밀글설정</label>
			<input type="radio" name="qIsSecret" value="0" style="width: 25px; "><span style="font-size: 17px; display: inline-block;" >공개글</span>
			<input type="radio" name="qIsSecret" value="1" style="width: 25px; "><span style="font-size: 17px; display: inline-block;"  >비밀글</span>
		</div>
		<hr>
		<br>
			<button id="write" onclick="submit" type="button" class="btn btn-warning" >등 록</button>
			<button  id="cancel" onclick="location.href='list'" type="button">취 소</button>
	</form>
	</div>

</body>
</html>