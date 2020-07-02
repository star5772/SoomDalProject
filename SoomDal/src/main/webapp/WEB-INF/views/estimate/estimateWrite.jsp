<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>estimate_write</title>
<style>
#imgdiv {
	margin: 0 auto;
	display: inline-block;
}

#profile {
	display: inline-block;
	padding-left: 15px;
	margin-top: 30px;
	
}

.readEstimate {
	width: 600px;
	margin: 0 auto;
	display: inline-block;
	margin-left: 200px;
}

#date {
	display: inline-block;
	text-align: left;
	margin-left: 230px;
}

h2 {
	margin-bottom: 50px;
	font-size: 25px;
	font-weight: bold;
	padding-bottom: 30px;
	padding-left: 150px;
	padding-top: 50px;
}

.request {
	padding-bottom: 10px;
	font-weight: bolder;
}

h4 {
	font-weight: bold;
}

.dap {
	padding-bottom: 30px;
}

#estimate {
	padding-left: 10px;
}
#pppprofile{
	display: inline-block;
}
hr{
	margin-bottom: 20px;
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
	margin-top: 80px;
	font-size: 11px;
	font-weight: bolder;
}
#send{
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
<div>
<form action="/dal/member/estimate/sendEstimate" method="post">
	<h2>견적서 작성</h2>
	<div style="border: 2px solid #F6F6F6; width: 700px; padding-left: 45px; margin-left: 200px;">
		<input type="hidden" name="rNo" value="${RNo}">
		<div class='readEstimate' style="padding: 30px 30px 30px 30px; margin: 0 auto;">
			<div id="pppprofile"> 
				<div id="imgdiv">
					<img src="/image/dalin.jpg" style='width: 80px; height: 80px;'>
				</div>
			</div>
			<hr>
			<div id="estimate">
				<div>
					<div class="request">
						<h4>1. 견적 금액</h4>
					</div>
					<div class="dap" style="width: 510px; height: 30px; margin-left: 20px; font-size: 13px;">
						<textarea rows="1" cols="80" style="border: 1px solid #dddddd;" name="eMoney"></textarea>
					</div>
				</div>
				<div>
					<div class="request" style="margin-top: 40px;">
						<h4>2. 견적 내용</h4>
					</div>
					<div class="dap" style="width: 510px; height: 100px; margin-left: 20px;  font-size: 13px;">
						<textarea rows="5" cols="80" style="border: 1px solid #dddddd;" name="eContent"></textarea>
					</div>
				</div>
				<div>
					<div class="request" style="margin-top: 40px;">
						<h4>3. 연락 수단</h4>
					</div>
					<div class="dap" style="width: 510px; height: 80px; margin-left: 20px;  font-size: 13px;">
						<textarea rows="5" cols="80" style="border: 1px solid #dddddd;" name="eTelType"></textarea>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div id="btn">
			<button id="back" onclick="location.href='/dal/member/request/readToRequestForReceive?rNo=${RNo}'" >뒤로가기</button>
			&nbsp;&nbsp;
			<button id="send">보내기</button>
		</div>
	</form>
</div>
</body>
</html>