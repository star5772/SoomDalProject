<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
$(function(){
	$(".deleteToJeja").on("click", function() {
		var e = $(this).data("jeja");
		var params = {
				jMno: ${jMno},
				eNo:e,
				_csrf:"${_csrf.token}"
			}
		$.ajax({
			url: "/dal/dalin/estimate/disableByJeja",
			method: "post",
			data: params,
			success: function() {
					alert("삭제 완료");
					window.location.reload();
				}
		})
	})		
})	
</script>
<style>
.card {
	display: inline-block;
	width: 28%;
	padding:0 15px;
	margin: 15px;
	text-align: center;
	height: 210px;
}

.request{
	padding: 50px 0;
	padding-left: 85px;
}
.btn{
	width: 205px;
	height: 25px;
	color: white;
	font-weight: bolder;
	font-size: 12px;
}
h5{
	font-weight: bold;
	font-size: 15px;
}
.card-body{
	padding-bottom: 5px;
	padding-top: 45px;
}
hr{
	padding-top: 5px;
	padding-bottom : 5px;
	margin: 0 auto; 
}
.estimate{
	height: 600px;
	width: 90%;
	margin-left: 100px;
}
p{
	font-size: 12px;
}

h2{
	font-size: 25px;
	font-weight: bold;
	padding-bottom: 30px;
	padding-left: 10px;
	padding-top: 50px;

}
#page_wrap {
    position: relative;
      width: 1075px;
      height: 60px;
}
#inner {
    position: absolute;
    left: 47%;
    margin: auto;
}
a {
	color: white;
}

</style>
</head>
<body>

<sec:authorize access="hasRole('ROLE_JEJA')">
	<div class="estimate">
		<div style="padding-bottom: 30px; padding-left: 10px;">
			<h2>받은 견적서</h2>
		</div>
	<c:forEach items="${receiveEstimate.list }" var="estimate">
		<div class="card">
			<div class="card-top">
				<br>
			
				<a href="#" class="deleteToJeja" data-jeja="${estimate.ENo }" data-dMno="${estimate.DMno}" data-jMno="${jMno }"><span style="float: right; display: inline-block; font-size: 15px; color: gray;">X</span></a><br>
				 <div><h5>${estimate.RSubject }</h5></div>
				<div><p>${estimate.EWriteTimeStr }</p></div>
					
			</div>
			<div class="card-body">
				<div>${estimate.DName } 달인</div>			
			</div>	
			<div class="card-bottom" id="button">
				<div><hr></div>
				<button onclick="location.href='/dal/dalin/estimate/readToReceiveEstimate?eNo=${estimate.ENo}'" class="btn btn-warning">견적서 보기</button>
			</div>
		</div>
	</c:forEach>
	</div>
	<div id="page_wrap" style="text-align:center;">
		<div id="inner">
		<ul class="pagination">
			<c:if test="${receiveEstimate.prev==true}">
				<li><a style="color: black;" href="/dal/dalin/estimate/receiveEstimateList?pageno=${receiveEstimate.startPage-1}&jMno=${jMno}">이전</a></li>
			</c:if>
			<c:forEach begin="${receiveEstimate.startPage}" end="${receiveEstimate.endPage}" var="i">
				<c:choose>
					<c:when test="${receiveEstimate.pageno eq i }">
						<li>
							<a style="background-color: orange; color: white;" href="/dal/dalin/estimate/receiveEstimateList?pageno=${i}&jMno=${jMno}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a style="color: black;" href="/dal/dalin/estimate/receiveEstimateList?pageno=${i}&jMno=${jMno}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${receiveEstimate.next==true}">
				<li><a style="color: black;" href="/dal/dalin/estimate/receiveEstimateList?pageno=${receiveEstimate.endPage+1}&jMno=${jMno}">다음</a></li>
			</c:if>
		</ul>
		</div>
	</div>
</sec:authorize>

</body>
</html>