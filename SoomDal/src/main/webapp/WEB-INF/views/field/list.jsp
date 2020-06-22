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
<h3>달인 리스트</h3>
<div>
	<!-- 아래 c:forEach 로 list 개수만큼 div 반복 -->
	<div>
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