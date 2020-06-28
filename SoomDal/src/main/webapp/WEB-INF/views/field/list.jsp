<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#dal_profile {
		display: inline-block;
		float: left;
	}
	#dal_content {
		float: left;
		margin:0 0 0 24px;
	}
</style>
</head>
<body>
<div id="title_image" style="height: 200px;">
	<div id="title_wrap">
		<h1 style="padding: 10px;">해당 필드 이름</h1>
		<div id="field_statistics" style="height: 45px;">
			<div style="border-right: 1px solid black; display: inline-block; padding: 0 10px;"><span>고수 숫자</span><p>활동 고수</p></div>
			<div style="display: inline-block; padding: 0 10px;"><span>별</span><p>평점</p></div>
		</div>
	</div>
</div>
<div>
${dalin }
	<!-- 아래 c:forEach 로 list 개수만큼 div 반복 -->
	<div style="padding: 24px 0;">
		<div id="dal_profile">
			프로필 사진 
		</div>
		<div id="dal_content">
			<h5>달인 이름</h5>
			<p>달인 서비스 제공 내용</p>
			<div>별점</div>
			<div>리뷰 한줄</div>
		</div>
	</div>
	<hr>
</div>
</body>
</html>