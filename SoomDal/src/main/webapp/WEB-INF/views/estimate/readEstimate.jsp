<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>estimateRead</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<script>
$(document).ready(function(){
	$("#ok").on("click",function(){
		$("#jIsOk").val(1);
		var isOk = $("#jIsOk").val();
		

		var params={
			_csrf: "${_csrf.token}",
			jIsOk : isOk,
			jMno : $("#jMno").val(),
			eNo : $("#eNo").val(),
			dMno : $("#dMno").val()
		}
		$.ajax({
			data : params,
			url : "/dal/dalin/estimate/readToEstimate",
			method : "post",
			success : function(){
				$("#ok").css("display","none");
				$("#no").css("display","none");	
				window.location.reload();			
			}		
		})
	})
		$("#no").on("click",function(){
		var param = {
				_csrf : "${_csrf.token}",
				dMno: $("#dMno").val(),
				eNo : $("#eNo").val()
			}
		$.ajax({
			url:"/dal/dalin/estimate/no",
			data: param,
			method: "post",
			success: function() {
				alert("거절되었습니다");
				location.href = "/dal/dalin/estimate/receiveEstimateList?jMno=${readEstimate.JMno}";
			}
		})
	})
});
$(document).ready(function(){
	$("#ok").on("click",function(){
		
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
	padding-left: 495px;
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
hr{
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<sec:authorize access="hasRole('ROLE_JEJA')">
	<div>
		<h2>받은 견적서</h2>
		<div style="border: 2px solid #F6F6F6; width: 700px; padding-left: 45px; margin-left: 200px;">
		<div class='readEstimate' style="padding: 30px 30px 30px 30px; margin: 0 auto;">
			<div id="pppprofile"> 
				<div id="imgdiv">
					<img src="${readEstimate.DProfile}" style='width: 80px; height: 80px;'>
				</div>
				<input type="hidden" name="jMno" id="jMno" value="${readEstimate.JMno }">
				<input type="hidden" name="eNo"  id="eNo" value="${readEstimate.ENo }">
				<input type="hidden" name="dMno" id="dMno" value="${readEstimate.DMno }">
				<div id="profile">
					<span style="font-weight: bold; margin-top: 100px; font-size: 15px;">${readEstimate.DName }달인</span><br>
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
					<div class="dap" style="width: 510px; height: 80px; margin-left: 20px; font-size: 13px;">
						<p>${readEstimate.EMoney}</p>
					</div>
				</div>
				<div>
					<div class="request">
						<h4>2. 견적 내용</h4>
					</div>
					<div class="dap" style="width: 510px; height: 120px; margin-left: 20px;  font-size: 13px;">
						<p style="white-space: pre-line;">${readEstimate.EContent }</p>
					</div>
				</div>
				<c:if test="${readEstimate.JIsOk == 'true' }">
					<div id="eTelType" >
						<div class="request">
							<h4>3. 연락수단</h4>
						</div>
						<div class="dap" style="width: 510px; height: 100px; margin-left: 20px;  font-size: 13px;">
							<p style="white-space: pre-line;">${readEstimate.ETelType}</p>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		</div>
		<div id="btn">
			<c:choose>
				<c:when test="${readEstimate.JIsOk == false }">			
					<button class="btn btn-secondary" style="width: 50px;" id="no">거절</button>
					&nbsp;&nbsp;
					<button class="btn btn-warning" style="width: 50px;"  id="ok">수락</button>
					<input type="hidden" name="jIsOk" id="jIsOk" value="">
				</c:when>
				<c:otherwise>
					<button onclick="location.href='/dal/dalin/estimate/receiveEstimateList?jMno=${readEstimate.JMno}'" class="btn btn-warning" style="width: 80px;" id="list">목록</button>
				</c:otherwise>
			</c:choose>
					
				
		</div>
	</div>
	</sec:authorize>
	
	
	
	
	
	
	<sec:authorize access="hasRole('ROLE_DALIN')">
	<div>
		<h2>보낸 견적서</h2>
		<div style="border: 2px solid #F6F6F6; width: 700px; padding-left: 45px; margin-left: 200px;">
		<div class='readEstimate' style="padding: 30px 30px 30px 30px; margin: 0 auto;">
			<div id="pppprofile"> 
				<div id="imgdiv">
					<img src="/image/dalin.jpg" style='width: 80px; height: 80px;'>
				</div>

				<div id="profile">
					<span style="font-weight: bold; margin-top: 100px; font-size: 15px;">${readEstimate.DName }달인</span><br>
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
					<div class="dap" style="width: 510px; height: 80px; margin-left: 20px; font-size: 13px;">
						<p>${readEstimate.EMoney}</p>
					</div>
				</div>
				<div>
					<div class="request">
						<h4>2. 견적 내용</h4>
					</div>
					<div class="dap" style="width: 510px; height: 120px; margin-left: 20px;  font-size: 13px;">
						<p style="white-space: pre-line;">${readEstimate.EContent }</p>
					</div>
				</div>
				<div>
					<div class="request">
						<h4>3. 연락수단</h4>
					</div>
					<div class="dap" style="width: 510px; height: 100px; margin-left: 20px;  font-size: 13px;">
						<p style="white-space: pre-line;">${readEstimate.ETelType}</p>
					</div>
				</div>
			</div>			
		</div>
		</div>
			<div id="btn">
				<button class="btn btn-secondary" style="width: 50px; text-align: center;" onclick="location.href='/dal/dalin/estimate/sendEstimateList?dMno=${readEstimate.DMno}'">목 록</button>
			</div>
	</div>
	</sec:authorize>
	


</body>
</html>