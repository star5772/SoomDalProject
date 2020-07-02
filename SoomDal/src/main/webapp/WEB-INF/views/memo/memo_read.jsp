<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memo_read</title>
<style>
h2 {
	margin-top: 50px;
	margin-left: 80px;
	margin-bottom: 80px;
	font-size: 25px;
	font-weight: bold;
	font-size: 25px;
}
#back{
	width: 70px;
	height: 25px;
	text-align: center;
	background-color: #BDBDBD;
	color: white;
	border: 0;
	outline: 0;
	border-radius: 4px;
	font-weight: normal;
	margin-left: 500px;
	margin-top: 250px;
	font-size: 11px;
	font-weight: bolder;
	
}
#estimateRead{
	width: 70px;
	height: 25px;
	text-align: center;
	background-color: #FFBB00;
	color: white;
	border: 0;
	outline: 0;
	border-radius: 4px;
	font-weight: normal;
	margin-left: 7px;
	font-weight: bolder;
	font-size: 11px;
}
</style>
</head>
<body>
	<h2>쪽지함</h2>

	<div>
		<div>
			<div style="margin-left: 250px; width: 600px;">
				<div style="display: inline-block;">
					<img style="border-radius: 50%; width: 60px; height: 60px;">
				</div>
				<div style="display: inline-table; height: 50px; text-align: center; width: 500px;">
					<div style="text-align: left; padding-left: 50px; height: 50px;">
						<p style="font-size: 15px; font-weight: bold;">[${memoRead.mno }]&nbsp;${memoRead.title }</p>
						<p style="font-size: 11px; font-weight: 200; margin-left: 0px; padding-right: 140px;">${memoRead.writeTimeStr }</p>
					</div>
				</div>
				<hr>
				<p style="padding-left: 20px; padding-top: 10px; font-size: 13px;">${memoRead.content }</p>
			</div>
		</div>
				<button id="back" onclick="location.href='/dal/member/memo/memo_receiveList?username=${memoRead.receiver}'">뒤로가기</button>
	</div>

</body>
</html>