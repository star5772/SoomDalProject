<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="font-size: 43px; font-weight: bold; color: rgb(243,156,18); font-family:"Arial Black";">Q&A</div>
<div style="font-size: 19px;">궁금한것 무엇이든 ! 물어보세요</div>
<hr>
<div >
	<label style="background-color:#d3d3d3; display: inline-block;">제목</label><input type="text" value="제목을 입력해주세요." style="color: rgb(94,94,94);">
</div>
<hr>
<textarea rows="35" cols="100" placeholder="궁금하신 내용을 입력해주세요." ></textarea>
<hr>
<div >
	<label style="background-color:#d3d3d3; display: inline-block;">비밀글설정</label>
	<input type="checkbox" checked="checked">공개글
	<input type="checkbox" checked="checked">비밀글	
</div>
<hr>
<div style="float: right;">
<button>등록</button> <button>취소</button>
</div>
</body>
</html>