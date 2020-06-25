
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div>
		<div class="tdw"><label style="background-color: #DDDDDD; font-size: medium; display: inline-block;">제목</label><input type="text" name="rbTitle" style="font-size: small; width: 300px; border: 1px solid black;"></div>
		<div class="tdw"><label style="background-color: #DDDDDD; font-size: medium; display: inline-block;">작성일</label><input type="text" name="rbDate" style="font-size: small; width: 150px; border: 1px solid black;" ></div>
		<div class="tdw"><label style="background-color: #DDDDDD; font-size: medium; display: inline-block;">작성자</label><input type="text" name="rbWriter" style="font-size: small; width: 150px; border: 1px solid black;"></div>
		</div>
	</div>
	<textarea rows="30" cols="150" style="border: none;">
	분야 :
	
	종목 :
	
	목적 : 
	
	작성자 수준:
	
	도구의 유뮤:
	
	원하는 레슨 형태(개인, 그룹):
	
	원하는 날짜, 시간:
	
	연령:
	
	성별:
	
	원하는 지역:
	
	기타 문의 및 희망사항:
	</textarea>
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
