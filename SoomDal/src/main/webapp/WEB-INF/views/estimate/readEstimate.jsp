<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>estimateRead</title>
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
	margin-left: 280px;
	padding-top: 50px;
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
	padding-bottom: 5px;
	font-weight: bolder;
}

h4 {
	font-weight: bold;
}

.dap {
	padding-bottom: 30px;
}

#btn {
	display: inline-block;
	padding-left: 450px;
	padding-bottom: 30px;
	padding-top: 100px;
	margin: 0 auto;
}

#estimate {
	padding-left: 10px;
}
#pppprofile{
	display: inline-block;
}
</style>
</head>
<body>
	<div>
		<h2>받은 견적서</h2>
		<div class='readEstimate'>
			<div id="pppprofile"> 
				<div id="imgdiv">
					<img src="/image/dalin.jpg" style='width: 80px; height: 80px;'>
				</div>

				<div id="profile">
					<span style="font-weight: bold; margin-top: 100px;">${readEstimate.DName }달인</span><br>
					<span>${readEstimate.DEmail }</span>
				</div>
				<div id="date">
					<span>${readEstimate.EWriteTimeStr }</span>
				</div>

			</div>
			<hr>
			<div id="estimate">
				<div>
					<div class="request">
						<h4>1. 견적 금액</h4>
					</div>
					<div class="dap">
						<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readEstimate.EMoney}</p>
					</div>
				</div>
				<div>
					<div class="request">
						<h4>2. 견적 내용</h4>
					</div>
					<div class="dap">
						<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readEstimate.EContent }</p>
					</div>
				</div>
			</div>
		</div>
		<div id="btn">
			<button class="btn btn-secondary" style="width: 50px;">거절</button>
			&nbsp;&nbsp;
			<button class="btn btn-warning" style="width: 50px;">수락</button>
		</div>
	</div>


</body>
</html>