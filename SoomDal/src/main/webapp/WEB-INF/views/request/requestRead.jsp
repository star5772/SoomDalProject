<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>readRequestRead</title>
<style>
#imgdiv{
	margin: 0 auto;
	display: inline-block;
}
#profile{
	display: inline-block;
	padding-left: 15px;
}
#readRequestRead{
	
	width: 60%;
	margin: 0 auto;
}
#date{
	display : inline-block;
	margin-left: 280px;
	padding-top: 50px;
	
}
h2{
	margin-bottom: 50px;
	font-size: 25px;
	font-weight: bold;
}
.readRequest{
	padding-bottom: 5px;
	font-weight: bolder;
}
h4{
	font-weight: bold;
}
.dap{
	padding-bottom: 30px;
}
#btn{
	display: inline-block;
	padding-left: 300px;
	padding-bottom: 30px;
	padding-top: 40px;
}
#rreadRequest{
	padding-left: 10px;
}
</style>
</head>
<body>
	<div id="readRequestRead">
		<h2>상세 요청서</h2>
	<div id="modu">
		<div id="imgdiv" >
			<img src="/image/jeja.jpg" style="width: 80px; height: 80px;" >
		</div>
		<div id="profile">
			<span style="font-weight: bold;">${readRequest.JName }제자</span><br>
			<span>${readRequest.JEmail }</span>
		</div>
		<div id="date">
			<span>${readRequest.RWriteDateStr }</span>
		</div>
		<hr>
		<div id="rreadRequest">
		<div>
			<div class="readRequest">
				<h4>1. 레슨하는 목적이 무엇인가요?</h4>
			</div>
			<div class="dap">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readRequest.RLessonPurpose }</p>
			</div>
		</div>
		<div>
			<div class="readRequest">
				<h4>2. 본인의 수준은 어느정도인가요?</h4>
			</div>
			<div class="dap">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readRequest.RYourLevel }</p>
			</div>
		</div>
		<div>
			<div class="readRequest">
				<h4>3. 레슨하려는 장비를 가지고 있으신가요?</h4>
			</div>
			<div class="dap">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readRequest.RItemExists }</p>
			</div>
		</div>
		<div>
			<div class="readRequest">
				<h4>4. 그룹,개인 중 어떤 레슨형태를 원하시나요?</h4>
			</div>
			<div class="dap">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readRequest.RLessonType }</p>
			</div>
		</div>
		<div>
			<div class="readRequest">
				<h4>5. 원하는 날짜를 선택해주세요!</h4>
			</div>
			<div class="dap">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readRequest.RWantDateStr }</p>
			</div>
		</div>
		<div>
			<div class="readRequest">
				<h4>6. 원하는 수업시간이 있으신가요?</h4>
			</div>
			<div class="dap">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readRequest.RWantTime }</p>
			</div>
		</div>
		<div>
			<div class="readRequest">
				<h4>7. 당신의 나이는 어떻게 되시나요?</h4>
			</div>
			<div class="dap">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readRequest.RAge }</p>
			</div>
		</div>
		<div>
			<div class="readRequest">
				<h4>8. 당신의 성별을 선택해 주세요!</h4>
			</div>
			<div class="dap">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readRequest.RGender }</p>
			</div>
		</div>
		<div>
			<div class="readRequest">
				<h4>9. 문의 및 희망사항이 있으신가요?</h4>
			</div>
			<div class="dap">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readRequest.RWannable }</p>
			</div>
		</div>
		<div>
			<div class="readRequest">
				<h4>10. 레슨을 원하는 희망지역이 있으신가요?</h4>
			</div>
			<div class="dap">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readRequest.RWantArea }</p>
			</div>
		</div>
		</div>
	</div>
		<div id="btn">
			<button id="no"class="btn btn-secondary" style="width:50px;">거절</button>&nbsp;&nbsp;
			<button class="btn btn-warning" style="width:50px;">수락</button>
		</div>
	</div>

</body>
</html>