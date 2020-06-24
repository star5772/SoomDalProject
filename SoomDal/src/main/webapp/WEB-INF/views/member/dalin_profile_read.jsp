<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DalinRead</title>
<script>
	
</script>
<style>
h2{
	font-weight: bold;
}
h5{
	font-weight: bold;
}
#dalinRead p{
	font-weight: lighter;
	font-size: 14px;
}	
hr{
	border: solid 1px;
	color: #F3F3F3;
}
#dalinRead{
	height: 600px;
	width: 800px;
	margin: 0 auto;
}

#dalinRead #review #rWriter p{
	font-size: 16px;
	font-weight: bold;
	display: inline-block;
}
#dalinRead #review #rWriter{
	display: inline-block;
}
#rScore{
	display: inline-block;
}
#rDate{
	color : #878787;
	display: inline-block;
}
#dProfile{
	display: inline-block;
	margin-top: 100px;
}
#dalinRead #dProfile p{
	margin-left: 200px;
	font-size: 20px;
	font-weight: bold;
	width: 150px;
	height: 40px;
	
}
#update{
	margin-left: 750px;
	background-color: orange;
	color : white;
	outline: 0;
	border: 0;
	border-radius: 4px;
	text-align: center;
	width: 50px;
	height: 25px;
	font-size: 12px;
}
#dAttachment1{
	display: inline-block;
}
#dAttachment2{
	display: inline-block;
}
#dAttachment3{
	display: inline-block;
}
#dAttachment4{
	display: inline-block;
}
#rContent{
	width: 100px;
	height: 50px;
}


</style>
</head>
<body>
	<form id="profileReadFrm" action="member/profile/read" method="get"></form>
	<div id="dalinRead">
		<div id="dProfile">
			<div style="border-radius: 50%; height: 200px; width: 200px; background-color: gray; ">
			<p id="dName">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dalin.dName}김희은</p></div>
		</div>
		<div>
			<button id="update">수&nbsp;정</button>
		</div>
		<div id="dName-bottom">
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>한줄소개</h2><br><br>
				</div>
				<div>
					<p>${dalin.dIntro}한줄소개</p>
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>대표서비스</h2><br><br>
				</div>
				<div>
					<p>${dalin.bMainService}대표서비스</p>
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>활동지역</h2><br><br>
				</div>
				<div>
					<p>${dalin.dArea}활동지역</p>
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>서비스 상세설명</h2><br><br>
				</div>
				<div>
					<p>${dalin.dDetailService}서비스상세설명</p>
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>결제수단</h2><br><br>
				</div>
				<div>
					<p>${dalin.dPaymentMethod}결제수단</p>
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>사진</h2><br><br>
				</div>
				<div >
					<div id="dAttachment1">
						<p>${profileAttachment.dAttachmentNo}사진1</p>
					</div>
					<div id="dAttachment2">
						<p>${profileAttachment.dAttachmentNo}사진2</p>
					</div>
					<div id="dAttachment3">
						<p>${profileAttachment.dAttachmentNo}사진3</p>
					</div>
					<div id="dAttachment4">
						<p>${profileAttachment.dAttachmentNo}사진4</p>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>리뷰</h2><br>
				</div>
				<div>
					<h2>별점평균</h2>
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div id="review" >
					<div id="rWriter">
						<p>${review.rWriter}김희은</p>
					</div>
					<div id="rScore">
						<p>${review.rScore}별</p>
					</div>
					<div id="rDate">
						<p>${review.rDate}2020.06.18</p>
					</div>
				</div>
				<div id="rContent">
					<p>${review.rContent}리뷰내용dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>질문&amp;답변</h2><br><br>
				</div>
				<div>
					<div>
						<div>
							<h5>Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</h5>
						</div>
						<div>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;${reqQuestion.dQContent}답변</p>
						</div>
					</div>
					<div>
						<div>
							<h5>Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</h5>
						</div>
						<div>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;${reqQuestion.dQContent}답변</p>
						</div>
					</div>
					<div>
						<div>
							<h5>Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</h5>
						</div>
						<div>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;${reqQuestion.dQContent}답변</p>
						</div>
					</div>
					<div>
						<div>
							<h5>Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</h5>
						</div>
						<div>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;${reqQuestion.dQContent}답변</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>