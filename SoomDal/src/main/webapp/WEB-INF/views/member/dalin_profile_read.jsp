<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DalinRead</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
$(function() {
	$("#1star").on("click",function(){
		$("#star1").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star2").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg");
		$("#star3").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg");
		$("#star4").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg");
		$("#star5").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg");
		$("#rScore2").val(1);
	})
	$("#2star").on("click",function(){
		$("#star1").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star2").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star3").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg");
		$("#star4").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg");
		$("#star5").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg");
		$("#rScore2").val(2);
	})
	$("#3star").on("click",function(){
		$("#star1").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star2").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star3").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star4").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg");
		$("#star5").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg");
		$("#rScore2").val(3);
	})
	$("#4star").on("click",function(){
		$("#star1").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star2").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star3").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star4").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star5").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg");
		$("#rScore2").val(4);
	})
	$("#5star").on("click",function(){
		$("#star1").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star2").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star3").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star4").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#star5").attr("src","https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg");
		$("#rScore2").val(5);
	})
})


	$(function() {
		$("#reviewWrite").on("click", function() {
			var formData = $("#rvFrm").serialize();
			console.log(formData);
			$.ajax({
				url : "/dal/jeja/reviewWrite",
				data : formData,
				method : "post",
				success : function() {
					alert("리뷰작성완료 !");
					window.location.reload();
				}
			})
		})
		$("#deleteReview").on("click",function(){
			var params = {
					rNo : $("#rNo").val(),
					dMno: $("#dMno").val(),
					_csrf : "${_csrf.token}",
					_method : "delete"
				}
			$.ajax({
				url : "/dal/jeja/review_delete" ,
				data: params,
				method: "post",
				success: function() {
					alert("삭제완료")
					window.location.reload();
				}		
			})
		})
	})
</script>
<style>
#rWrite {
	font-size: 15px;
}

h2 {
	font-weight: bold;
}

h4 {
	font-weight: bold;
}

#dalinRead p {
	font-weight: lighter;
	font-size: 14px;
}

hr {
	border: solid 1px;
	color: #F3F3F3;
}

#dalinRead {
	height: 600px;
	width: 800px;
	margin: 0 auto;
}

#dalinRead #review #rWriter p {
	font-size: 15px;
	font-weight: bold;
	display: inline-block;
}

#dalinRead #review #rWriter {
	display: inline-block;
}

#rScore {
	display: inline-block;
	margin-left: 20px;
}

#rDate {
	display: inline-block;
	padding-left: 20px;
}

#dProfile {
	display: inline-block;
	margin-top: 100px;
}

#dalinRead #dProfile p {
	margin-left: 200px;
	font-size: 28px;
	font-weight: bold;
	width: 200px;
	height: 40px;
}

#update {
	margin-left: 400px;
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

#buttonDiv #writeRequest {
	margin-left: 50px;
	display: inline-block;
	background-color: gray;
	color: white;
	outline: 0;
	border: 0;
	border-radius: 4px;
	text-align: center;
	width: 80px;
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

#buttonDiv {
	margin-left: 650px;
}
</style>
</head>
<body>
	<sec:authentication property="principal.username" var="username" />
	<div id="dalinRead">
		<div id="dProfile">
			<p id="dName" style="margin-left: 380px; ">${readProfile.DName}</p>
			<div>
				<c:choose>
					<c:when test="${readProfile.DProfile ne null }">
						<img src="${readProfile.DProfile }" style="border-radius: 50%; height: 200px; width: 200px;">
					</c:when>
					<c:otherwise>
						<img  src="/dal/image/anony.jpg" style="border-radius: 50%; height: 200px; width: 200px;">
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		<sec:authorize access="hasRole('ROLE_JEJA')">
						<div id="buttonDiv">
							<button id="writeRequest"
								onclick="location.href='/dal/jeja/request/sendRequest?dMno=${readProfile.DMno}'">요청서작성</button>
						</div>
		</sec:authorize>
		<div id="dName-bottom">
			<div>
				<hr>
			</div>
			<div>
				<div>
					<h2>한줄소개</h2>
					<br>
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
					<h2>대표서비스</h2>
					<br>
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
					<h2>활동지역</h2>
					<br>
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
					<h2>서비스 상세설명</h2>
					<br>
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
					<h2>결제수단</h2>
					<br>
				</div>
				<div>
					<p>${readProfile.DPaymentMethod}</p>
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
					<br>
					<br>
				</div>
				<div>
				<c:choose>
					<c:when test="${empty readProfile.profileAttachments[0].PSaveFileName == 'false'}">
						<div id="dAttachment1">
							<img src="${readProfile.profileAttachments[0].PSaveFileName }">
						</div>
					</c:when>
					<c:otherwise>
						<div id="dAttachment1">
						</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty readProfile.profileAttachments[1].PSaveFileName == 'false'}">
						<div id="dAttachment2">
							<img src="${readProfile.profileAttachments[1].PSaveFileName }">
						</div>
					</c:when>
					<c:otherwise>
						<div id="dAttachment2">
						</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty readProfile.profileAttachments[2].PSaveFileName == 'false'}">
						<div id="dAttachment3">
							<img src="${readProfile.profileAttachments[2].PSaveFileName }">
						</div>
					</c:when>
					<c:otherwise>
						<div id="dAttachment3">
						</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty readProfile.profileAttachments[3].PSaveFileName == 'false'}">
						<div id="dAttachment4">
							<img src="${readProfile.profileAttachments[3].PSaveFileName }">
						</div>
					</c:when>
					<c:otherwise>
						<div id="dAttachment4">
						</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty readProfile.profileAttachments[4].PSaveFileName == 'false'}">
						<div id="dAttachment5">
							<img src="${readProfile.profileAttachments[4].PSaveFileName }">
						</div>
					</c:when>
					<c:otherwise>
						<div id="dAttachment5">
						</div>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
		<div>
			<div>
				<hr>
			</div>
			<div>
				<div style="display: inline-block;">
					<h2>리뷰</h2>
				</div>
				<c:choose>
					<c:when test="${empty readProfile.RScoreAverage == 'false'}">
						<div style="display: inline-block; margin-left: 20px;">
							<h1 style="font-size: 30px; font-weight: bold;">${readProfile.RScoreAverage}</h1>
						</div>
					</c:when>
					<c:otherwise>
						<div style="display: inline-block; margin-left: 20px;">
							<h1 style="font-size: 30px; font-weight: bold;">0.0</h1>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div>
			<div>
				<hr style="margin-bottom: 30px; margin-top: 30px;">
			</div>
			<div>
			<c:choose>
				<c:when test="${empty readProfile.reviews =='false'}">
					<c:forEach items="${readProfile.reviews}" var="rv">
						<div id="review">
							<div id="rWriter">
								<p>${rv.RWriter}</p>
							</div>
							<input type="hidden" id="rNo" value="${rv.RNo}">
							<input type="hidden" id="dMno" value="${rv.DMno}">
							<div id="rScore">
								<span>
									<c:forEach begin="1" end="${rv.RScore}">
										<img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg">
									</c:forEach>
									<c:forEach begin="${rv.RScore+1}" end="5">
										<img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg">
									</c:forEach>
								</span>
							<c:choose>	
								<c:when test="${rv.RWriter == username}">
									<button type="button" id="deleteReview">리뷰삭제</button>
								</c:when>
							</c:choose>	
							</div>
							<div id="rDate">
								<p>${rv.RDate}</p>
							</div>
						</div>
						<div id="rContent">
							<p>${rv.RContent}</p>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div style="margin-bottom: 50px; margin-top: 20px;">
						<p style="font-size: 16px;">작성된 리뷰가 없습니다.</p>
					</div>
				</c:otherwise>
			</c:choose>	
				<div id="rWrite">
					<c:choose>
						<c:when test="${rvAuth == 'true'}">
							<form id="rvFrm">
								<input type="hidden" name="dMno" id="dMno"
									value="${readProfile.DMno}"> <input type="hidden"
									name="_csrf" value="${_csrf.token}">
								<div>
									<input type="hidden" name="rScore" id="rScore2" value="">
									<a id="1star"><img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg" id="star1"></a>
									<a id="2star"><img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg" id="star2"></a>
									<a id="3star"><img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg" id="star3"></a>
									<a id="4star"><img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg" id="star4"></a>
									<a id="5star"><img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg" id="star5"></a>
									<textarea rows="3" cols="70" name="rContent" id="rContent" style="width: 800px; resize: none; height: 100px; margin-top: 5px;"
										placeholder=" 내용을 입력해주세요."></textarea>
								</div>
								<div>
									<button type="button" id="reviewWrite" class="btn btn-info"
										style="margin-top: 10px; margin-left: 740px;">리뷰 작성</button>
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
					<h2>질문&amp;답변</h2>
					<br>
				</div>
				<div>
					<div>
						<div>
							<h4>Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</h4>
						</div>
						<div>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readProfile.rep.firstQ}</p>
							<br>
						</div>
					</div>
					<div>
						<div>
							<h4>Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</h4>
						</div>
						<div>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readProfile.rep.secoendQ}</p>
							<br>
						</div>
					</div>
					<div>
						<div>
							<h4>Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</h4>
						</div>
						<div>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readProfile.rep.thirdQ}</p>
							<br>
						</div>
					</div>
					<div>
						<div>
							<h4>Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</h4>
						</div>
						<div>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${readProfile.rep.fourthQ}</p>
							<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>