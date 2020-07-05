<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DalinRead</title>
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
$(function(){
	$("#reviewWrite").on("click",function(){
/* 		var params = {
				_csrf: "${_csrf.token}",
				rContent: $("#rContent").text(),
				rWriter: "${username}",
				rScore: $("#reviewScore").val(),
				dMno: $("#dMno").val()
			} */
		var formData = $("#rvFrm").serialize();	
		$.ajax({
			url: "/dal/member/reviewWrite",
			data: formData, 
			method: "post",
			success: function(){
					alert("리뷰작성완료 !")
					window.location.reload();
			}
		})
	})
})

</script>
<style>
#rWrite{
	font-size: 15px;
}
h2{
	font-weight: bold;
}
h4{
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
	margin-left: 50px;
}
	color : #878787;
#rDate{
	display: inline-block;
}
#dProfile{
	display: inline-block;
	margin-top: 100px;
}
#dalinRead #dProfile p{
	margin-left: 200px;
	font-size: 28px;
	font-weight: bold;
	width: 200px;
	height: 40px;
	
}
#update{
	margin-left:400px;
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
#buttonDiv #writeRequest{
	margin-left:-380px;
	display:inline-block;
	background-color: gray;
	color : white;
	outline: 0;
	border: 0;
	border-radius: 4px;
	text-align: center;
	width: 80px;
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
#buttonDiv {
	margin-left: 650px;
}

</style>
</head>
<body>
<sec:authentication property="principal.username" var="username"/>
	<div id="dalinRead">
		<div id="dProfile">
			<div style="border-radius: 50%; height: 200px; width: 200px; background-color: gray; ">
			<p id="dName">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readProfile.DName}</p></div>
		</div>
		<div>
			<div id="buttonDiv">
				<button id="writeRequest" onclick="location.href='/dal/member/request/sendRequest?dMno=${readProfile.DMno}'">요청서작성</button><button id="update" onclick="location.href='/dal/dalin/profile_update'">수&nbsp;정</button>
			</div>
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
					<p>${readProfile.DIntro}</p>
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
					<p>${readProfile.DMainService}</p>
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
					<p>${readProfile.DArea}</p>
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
					<p>${readProfile.DDetailService}</p>
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
					<p>${readProfile.DPaymentMethod}결제수단</p>
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
					<h2>별점평균</h2><h3>${readProfile.RScoreAverage}</h3>
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
			<c:forEach items="${readProfile.reviews}" var="rv">
				<div id="review" >
					<div id="rWriter">
						<p>${rv.RWriter}</p>
					</div>
					<div id="rScore">
						<p>${rv.RScore}</p>
					</div>
					<div id="rDate">
						<p>${rv.RDate}</p>
					</div>
				</div>
				<div id="rContent">
					<p>${rv.RContent}</p>
				</div>
				</c:forEach>
				<div id="rWrite">
					<c:choose>
						<c:when test="${rvAuth == 'true'}">
							<form id="rvFrm">
							<input type="hidden" name="dMno" id="dMno" value="${readProfile.DMno}">
							<input type="hidden" name="_csrf" value="${_csrf.token}">
							<div>
								<textarea rows="3" cols="70" name="rContent" id="rContent" style="width: 500px; height: 100px;"></textarea><input type="text" name="rScore" id="reviewScore">				
							</div>
							<div>
								<button type="button" id="reviewWrite" class="btn btn-info">리뷰 작성</button>
							</div>
							</form>
						</c:when>
					</c:choose>
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
							<h4>Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</h4>
						</div>
						<div>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;${reqQuestion.dQContent}답변</p>
						</div>
					</div>
					<div>
						<div>
							<h4>Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</h4>
						</div>
						<div>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;${reqQuestion.dQContent}답변</p>
						</div>
					</div>
					<div>
						<div>
							<h4>Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</h4>
						</div>
						<div>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;${reqQuestion.dQContent}답변</p>
						</div>
					</div>
					<div>
						<div>
							<h4>Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</h4>
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