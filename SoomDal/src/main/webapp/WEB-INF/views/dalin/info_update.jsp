<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function() {
	var idx = 0;
	$("#add").on("click", function(){
		if(idx>3) {
			alert("첨부파일은 5개 까지입니다");
			return false;
		}
		var $input = $("<input>").attr("type","file").attr("class", "form-control-file")
		.attr("name","attachments[" + idx + "]");
		idx++;
		$input.appendTo($("#attachment_div"))
	});
	$("#update").on("click", function() {
		alert("수정되었습니다");
		});
	$("#dal_profile").on("click", function() {
		
	});
});
</script>
<style>
h2 {
	font-weight: bold;
}

h4 {
	font-weight: bold;
}

#dalinUpdate p {
	font-weight: lighter;
	font-size: 14px;
}

hr {
	border: solid 1px;
	color: #F3F3F3;
}

#dalinUpdate {
	height: 600px;
	width: 800px;
	margin: 0 auto;
}

#dalinUpdate #review #rWriter p {
	font-size: 16px;
	font-weight: bold;
	display: inline-block;
}

#dalinUpdate #review #rWriter {
	display: inline-block;
}

#rScore {
	display: inline-block;
}

#rDate {
	color: #878787;
	display: inline-block;
}

#dProfile {
	display: inline-block;
	margin-top: 100px;
}

#dalinUpdate #dProfile p {
	margin-left: 200px;
	font-size: 28px;
	font-weight: bold;
	width: 200px;
	height: 40px;
}

#update {
	margin-left: 750px;
	background-color: orange;
	color: white;
	outline: 0;
	border: 0;
	border-radius: 4px;
	text-align: center;
	width: 50px;
	height: 25px;
	font-size: 12px;
}

#dAttachment1 {
	display: inline-block;
}

#dAttachment2 {
	display: inline-block;
}

#dAttachment3 {
	display: inline-block;
}

#dAttachment4 {
	display: inline-block;
}

#rContent {
	width: 100px;
	height: 50px;
}

input {
	width: 500px;
	height: 30px;
	font-size: 14px;
	border: 0;
	
}
</style>
</head>
<body>
	<form id="profileReadFrm" action="dalin/info_update" method="get"></form>
	<div id="dalinUpdate">
		<div id="dProfile">
			<div style="border-radius: 50%; height: 200px; width: 200px; background-color: gray;">
				<p id="dName">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dalin.dName}김희은</p>
			</div>
			<div style="margin-left: 160px;">
				<button type="button" style="border: 0px white; background-color: white;" id="dal_profile"><i class="fas fa-camera fa-2x"></i></button><img id="show_profile" src="${dalin.dProfile }">
			</div>
		</div>
		<div>
			<button id="update"
				onclick="location.href='/dal/dalin/dalin_profile_update'">수&nbsp;정</button>
		</div>
		<div id="dName-bottom">
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>한줄소개</h2>
					<br> <br>
				</div>
				<div>
					<input type="text" id="intro" name="intro"
						value="${dalin.dIntro}한줄소개">
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>대표서비스</h2>
					<br> <br>
				</div>
				<div>
					<input type="text" id="mainService" name="mainService"
						value="${dalin.dMainService}대표서비스">
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>활동지역</h2>
					<br> <br>
				</div>
				<div>
					<input type="text" id="area" name="area" value="${dalin.dArea}활동지역">
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>서비스 상세설명</h2>
					<br> <br>
				</div>
				<div>
					<input type="text" id="detailService" name="detailService"
						value="${dalin.dDetailService}서비스상세설명">
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>결제수단</h2>
					<br> <br>
				</div>
				<div>
					<input type="text" id="patmentMethod" name="patmentMethod"
						value="${dalin.dPaymentMethod}결제수단">
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>사진</h2>
					<br> <br>
				</div>
				<div>
					<input type="file" name="sajin" id="sajin" style="display: inline-block; width: 430px;"> 
					<input type="hidden" name="_csrf" value="${_csrf.token}">
					<button type="button" id="add">첨부파일 추가</button>
					<div id="attachment_div"></div>
					<div>
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
						<h2>질문&amp;답변</h2>
						<br> <br>
					</div>
					<div>
						<div>
							<div>
								<h4>
									Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?
								</h4>
							</div>
							<div>
								<input type="text" name="q1" id="q1" value="${reqQuestion.dQContent}답변">
							</div>
						</div><br>
						<div>
							<div>
								<h4>
									Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?
								</h4>
							</div>
							<div>
								<input type="text" name="q2" id="q2" value="${reqQuestion.dQContent}답변">
							</div>
						</div><br>
						<div>
							<div>
								<h4>
									Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?
								</h4>
							</div>
							<div>
								<input type="text" name="q2" id="q2" value="${reqQuestion.dQContent}답변">
							</div>
						</div><br>
						<div>
							<div>
								<h4>
									Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?
								</h4>
							</div>
							<div>
								<input type="text" name="q2" id="q2" value="${reqQuestion.dQContent}답변">
							</div>
						</div><br>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>