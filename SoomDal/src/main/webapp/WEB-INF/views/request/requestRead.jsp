<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>readRequestRead</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<sec:authorize
	access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<script>
$(document).ready(function(){
	$("#no").on("click",function(){
		var param = {
				_csrf : "${_csrf.token}",
				jMno: $("#jMno").val(),
				rNo : $("#rNo").val()
			}
		$.ajax({
			url:"/dal/jeja/request/no",
			data: param,
			method: "post",
			success: function() {
				alert("거절되었습니다");
				location.href = "/dal/jeja/request/receiveRequest?dMno=${readRequest.DMno}";
			}
		})
	})
})
</script>
<style>
#imgdiv {
	margin: 0 auto;
	display: inline-block;
}

#profile {
	display: inline-block;
	padding-left: 15px;
}

#readRequestRead {
	width: 60%;
	margin: 0 auto;
}

#date {
	display: inline-block;
	margin-left: 310px;
	padding-top: 50px;
	font-size: 11px;
}

h2 {
	margin-top: 50px;
	margin-left: 80px;
	margin-bottom: 80px;
	font-size: 25px;
	font-weight: bold;
}

.readRequest {
	padding-bottom: 5px;
	font-weight: bolder;
}

h4 {
	font-weight: bold;
}

.dap {
	padding-bottom: 30px;
	font-size: 13px;
}

#btn {
	display: inline-block;
	padding-left: 500px;
	padding-bottom: 30px;
	padding-top: 40px;
}

#rreadRequest {
	padding-left: 10px;
}

hr {
	margin-top: 20px;
	padding-bottom: 20px;
}
</style>
</head>
<body>
	<sec:authorize access="hasRole('ROLE_DALIN')">
		<h2>상세 요청서</h2>
		<div id="readRequestRead"
			style="border: 2px solid #F6F6F6; width: 700px; padding-left: 45px; margin-left: 200px;">
			<div id="modu" style="padding: 30px 30px 30px 30px; margin: 0 auto;">
				<div id="imgdiv">
					<img src="/dal/image/anony.jpg" style="width: 80px; height: 80px;">
				</div>
				<input type="hidden" id="rNo" value="${readRequest.RNo}">
				<input type="hidden" id="jMno" value="${readRequest.JMno}">
				<div id="profile">
					<span style="font-weight: bold; font-size: 15px;">${readRequest.JName }제자</span><br>
					<span style="font-size: 13px;">${readRequest.JEmail }</span>
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
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p style="white-space: pre-line;">${readRequest.RLessonPurpose }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>2. 본인의 수준은 어느정도인가요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RYourLevel }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>3. 레슨하려는 장비를 가지고 있으신가요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RItemExists }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>4. 그룹,개인 중 어떤 레슨형태를 원하시나요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RLessonType }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>5. 원하는 날짜를 선택해주세요!</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RWantDateStr }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>6. 원하는 수업시간이 있으신가요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RWantTime }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>7. 당신의 나이는 어떻게 되시나요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RAge }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>8. 당신의 성별을 선택해 주세요!</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<c:choose>
								<c:when test="${readRequest.RGender == false }">
									<p>남자</p>
								</c:when>
								<c:otherwise>
									<p>여자</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>9. 문의 및 희망사항이 있으신가요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RWannable }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>10. 레슨을 원하는 희망지역이 있으신가요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RWantArea }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:choose>
			<c:when test="${readRequest.RDalinIsOk == false }">
			<div id="btn">
				<button id="no" class="btn btn-secondary" style="width: 50px;">거절</button>
				&nbsp;&nbsp;
				<button class="btn btn-warning" style="width: 50px;" id="ok"
					onclick="location.href='/dal/dalin/estimate/sendEstimate?rNo=${readRequest.RNo}'">수락</button>
				<input type="hidden" name="rDalinIsOk" id="dalinIsOk" value="">
			</div>
			</c:when>
			<c:otherwise>
				<button class="btn btn-secondary" style="width: 50px; margin-left: 530px; margin-top: 50px;"
				onclick="location.href='/dal/jeja/request/receiveRequest?dMno=${readRequest.DMno}'">목록</button>
			</c:otherwise>
		</c:choose>
	</sec:authorize>














	<sec:authorize access="hasRole('ROLE_JEJA')">
		<h2>상세 요청서</h2>
		<div id="readRequestRead"
			style="border: 2px solid #F6F6F6; width: 700px; padding-left: 45px; margin-left: 200px;">
			<div id="modu" style="padding: 45px 30px 30px 30px; margin: 0 auto;">
				<div id="rreadRequest">
					<div>
						<div class="readRequest">
							<h4>1. 레슨하는 목적이 무엇인가요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p style="white-space: pre-line;">${readRequest.RLessonPurpose }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>2. 본인의 수준은 어느정도인가요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RYourLevel }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>3. 레슨하려는 장비를 가지고 있으신가요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RItemExists }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>4. 그룹,개인 중 어떤 레슨형태를 원하시나요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RLessonType }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>5. 원하는 날짜를 선택해주세요!</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RWantDateStr }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>6. 원하는 수업시간이 있으신가요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RWantTime }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>7. 당신의 나이는 어떻게 되시나요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RAge }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>8. 당신의 성별을 선택해 주세요!</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<c:choose>
								<c:when test="${readRequest.RGender == false }">
									<p>남자</p>
								</c:when>
								<c:otherwise>
									<p>여자</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>9. 문의 및 희망사항이 있으신가요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RWannable }</p>
						</div>
					</div>
					<div>
						<div class="readRequest">
							<h4>10. 레슨을 원하는 희망지역이 있으신가요?</h4>
						</div>
						<div class="dap"
							style="width: 700px; height: 70px; margin-left: 20px; font-size: 13px;">
							<p>${readRequest.RWantArea }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="btn">
			<button class="btn btn-secondary" style="width: 50px;"
				onclick="location.href='/dal/jeja/request/sendRequestList?jMno=${readRequest.JMno}'">목
				록</button>
		</div>
	</sec:authorize>

</body>
</html>