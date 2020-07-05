<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<script>

function loadAttach() {
	var file = $("#sajin")[0].files[0];
	console.log(file);
	var maxSize = 1024*1024; // 1MB
	if(file.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#sajin").val("");
		return false;
	}
	var reader = new FileReader();
	   reader.onload = function(e) {
	      $("#show_attach1").attr("src", e.target.result);
	   }
	   reader.readAsDataURL(file);
	   return true;
}
function loadAttach1() {
	var file1 = $("#attach0")[0].files[0];
	console.log(file1);
	var maxSize = 1024*1024; // 1MB
	if(file1.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#attach0").val("");
		return false;
	}
	var reader = new FileReader();
	   reader.onload = function(e) {
	      $("#show_attach2").attr("src", e.target.result);
	   }
	reader.readAsDataURL(file1);
	return true;
}
function loadAttach2() {
	var file2 = $("#attach1")[0].files[0];
	var maxSize = 1024*1024; // 1MB
	if(file2.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#attach1").val("");
		return false;
	}
	var reader = new FileReader();
	   reader.onload = function(e) {
	      $("#show_attach3").attr("src", e.target.result);
	   }
	reader.readAsDataURL(file2);
	return true;
}
function loadAttach3() {
	var file3 = $("#attach2")[0].files[0];
	var maxSize = 1024*1024; // 1MB
	if(file3.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#attach2").val("");
		return false;
	}
	var reader = new FileReader();
	   reader.onload = function(e) {
	      $("#show_attach4").attr("src", e.target.result);
	   }
	reader.readAsDataURL(file3);
	return true;
}
function loadAttach4() {
	var file4 = $("#attach3")[0].files[0];
	var maxSize = 1024*1024; // 1MB
	if(file4.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#attach3").val("");
		return false;
	}
	var reader = new FileReader();
	   reader.onload = function(e) {
	      $("#show_attach5").attr("src", e.target.result);
	   }
	reader.readAsDataURL(file4);
	return true;
}
function loadAttach5() {
	var file = $("#dProfileSajin")[0].files[0];
	var maxSize = 1024*1024; // 1MB
	if(file.size>maxSize) {
		Swal.fire({
			icon: 'error',
		  	title: '크기 오류',
			text: '파일크기는 1MB를 넘을 수 없습니다'
		});
		$("#attach3").val("");
		return false;
	}
	var reader = new FileReader();
	   reader.onload = function(e) {
	      $("#show_profile").attr("src", e.target.result);
	   }
	reader.readAsDataURL(file);
	return true;
}

$(function() {
	var idx = 0;
	$("#add").on("click", function(){
		if(idx>3) {
			alert("첨부파일은 5개 업로드 가능합니다");
			return false;
		}
		var $input = $("<input>").attr("type","file").attr("class", "form-control-file attach")
		.attr("name","attachments[" + idx + "]").attr("id","attach"+idx).attr("accept",".jpg,.jpeg,.png,.gif,.bmp");
		idx++;
		$input.appendTo($("#attachment_div"))
	});
	$("#update").on("click", function() {
		alert("수정되었습니다");
		});

});

$(document).ready(function(){
	$("#dal_profile").on("click",function() {
		$("#dProfileSajin").css("display","inline-block");
	})
	$("#dProfileSajin").on("change",loadAttach5);
	
	$("#sajin").on("change",loadAttach);
	$("#inp").on("change","#attach0",loadAttach1);
	$("#inp").on("change","#attach1",loadAttach2);
	$("#inp").on("change","#attach2",loadAttach3);
	$("#inp").on("change","#attach3",loadAttach4);
	$("#update").on("click",function() {
		var formData = new FormData();
		formData.append("dIntro", $("#dIntro").val());
		formData.append("dMainService",$("#dMainService").val());
		formData.append("dArea",$("#dArea").val());
		formData.append("dDetailService",$("#dDetailService").val());
		formData.append("dPaymentMethod",$("#dPaymentMethod").val());
		formData.append("dMno",$("#dMno").val());
		formData.append("inp",$("#inp").val());
		formData.append("q1",$("#q1").val());
		formData.append("q2",$("#q2").val());
		formData.append("q3",$("#q3").val());
		formData.append("q4",$("#q4").val());
		formData.append("_csrf","${_csrf.token}");
		//formData.append("_method","put");
		if($("#sajin")[0].files[0]!=undefined){
			formData.append("sajin", $("#sajin")[0].files[0]);
		}
		/*
		if($("#attach0")[0].files[0]!=undefined){
			formData.append("inp", $("#attach0")[0].files[0]);
		}
		if($("#attach1")[0].files[0]!=undefined){
			formData.append("inp", $("#attach1")[0].files[0]);
		}
		if($("#attach2")[0].files[0]!=undefined){
			formData.append("inp", $("#attach2")[0].files[0]);
		}
		if($("#attach3")[0].files[0]!=undefined){
			formData.append("inp", $("#attach3")[0].files[0]);
		}
		*/
		$.ajax({
			url:"/dal/dalin/profile_update",
			data:formData,
			method:"post",
			processData:false,
			contentType:false
		}).done(()=>{toastr.info("변경 성공");}).fail(()=>{toastr.info("변경 실패");})
		//.ajax("/dal/dalin/profile_update?dEmail="+$("#dMno").val())
	})
})


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

body {
	overflow: scroll;
}
</style>
</head>
<body>

	${dalin }
	<form id="profileReadFrm" action="dalin/info_update" method="get" enctype="multipart/form-data"></form>
	<div id="dalinUpdate">
		<div id="dProfile">
				<p id="dName">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dalin.DName}</p>
			<div>
				<img id="show_profile" src="${dalin.DProfile }" style="border-radius: 50%; height: 200px; width: 200px;">
			</div>
			<div style="margin-left: 160px;">
			<input type="file" name="dProfile" id="dProfileSajin" style="display:none; width: 430px;" accept=".jpg,.jpeg,.png,.gif,.bmp">
				<button type="button" style="border: 0px white; background-color: white;" id="dal_profile"><i class="fas fa-camera fa-2x"></i> 프로필 변경</button>
			</div>
		</div>
		<input type="hidden" name="dMno" id="dMno" value="${dalin.DMno}">
		<div>
			<button id="update" class="btn btn-info">수&nbsp;정</button>
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
					<input type="text" id="dIntro" name="dIntro" value="${dalin.DIntro}" placeholder="간단한 한줄 소개를 적어주세요!">
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
					<input type="text" id="dMainService" name="dMainService" value="${dalin.DMainService}" placeholder="자신의 대표서비스를 적어주세요!">
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
					<input type="text" id="dArea" name="dArea" value="${dalin.DArea}" placeholder="자신의 활동가능한 지역을 적어주세요!">
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
					<input type="text" id="dDetailService" name="dDetailService" value="${dalin.DDetailService}" placeholder="제공할 서비스의 상세한 설명을 적어주세요!">
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
					<input type="text" id="dPaymentMethod" name="dPaymentMethod" value="${dalin.DPaymentMethod}" placeholder="사용가능한 결제수단을 적어주세요!">
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
					<div>
						<ul id="attachment">
						</ul>			
					</div>
				</div>
				<div id="inp">
					<input type="file" name="sajin" id="sajin" style="display: inline-block; width: 430px;" accept=".jpg,.jpeg,.png,.gif,.bmp" > 
					<input type="hidden" name="_csrf" value="${_csrf.token}">
					<button type="button" id="add">첨부파일 추가</button>
					<div id="attachment_div"></div>

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
								<input type="text" name="q1" id="q1" value="${dalin.rep[0].DQcontent}" placeholder="답변을 적어주세요!">
							</div>
						</div><br>
						<div>
							<div>
								<h4>
									Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?
								</h4>
							</div>
							<div>
								<input type="text" name="q2" id="q2" value="${dalin.rep[1].DQcontent}" placeholder="답변을 적어주세요!">
							</div>
						</div><br>
						<div>
							<div>
								<h4>
									Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?
								</h4>
							</div>
							<div>
								<input type="text" name="q3" id="q3" value="${dalin.rep[2].DQcontent}" placeholder="답변을 적어주세요!">
							</div>
						</div><br>
						<div>
							<div>
								<h4>
									Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?
								</h4>
							</div>
							<div>
								<input type="text" name="q4" id="q4" value="${dalin.rep[3].DQcontent}" placeholder="답변을 적어주세요!">
							</div>
						</div><br>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>