<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	padding-top: 76px;
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
				 <div><h5>${estimate.RSubject }</h5></div>
				<div><p>${estimate.EWriteTimeStr }</p></div>
			</div>
			<div class="card-body">
				<div>${estimate.DName } 달인</div>			
			</div>	
			<div class="card-bottom" id="button">
				<div><hr></div>
				<button onclick="location.href='/dal/member/estimate/readToReceiveEstimate?eNo=${estimate.ENo}'" class="btn btn-warning">견적서 보기</button>
			</div>
		</div>
	</c:forEach>
	</div>
	<div id="page_wrap" style="text-align:center;">
		<div id="inner">
		<ul class="pagination">
			<c:if test="${receiveEstimate.prev==true}">
				<li><a style="color: black;" href="/dal/member/estimate/receiveEstimateList?pageno=${receiveEstimate.startPage-1}&jMno=${jMno}">이전</a></li>
			</c:if>
			<c:forEach begin="${receiveEstimate.startPage}" end="${receiveEstimate.endPage}" var="i">
				<c:choose>
					<c:when test="${receiveEstimate.pageno eq i }">
						<li>
							<a style="background-color: orange; color: white;" href="/dal/member/estimate/receiveEstimateList?pageno=${i}&jMno=${jMno}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a style="color: black;" href="/dal/member/estimate/receiveEstimateList?pageno=${i}&jMno=${jMno}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${receiveEstimate.next==true}">
				<li><a style="color: black;" href="/dal/member/estimate/receiveEstimateList?pageno=${receiveEstimate.endPage+1}&jMno=${jMno}">다음</a></li>
			</c:if>
		</ul>
		</div>
	</div>
</sec:authorize>










<sec:authorize access="hasRole('ROLE_DALIN')">
	<div class="request">
		<div style="padding-bottom: 30px; padding-left: 10px;">
			<h2>보낸 견적서</h2>
		</div>
	<c:forEach items="${sendEstimate.list }" var="estimatee">
		<div class="card">
			<div class="card-top">
				<br>
				<div><h5>${estimatee.RSubject }</h5></div>
				<div><p>${estimatee.EWriteTimeStr }</p></div>
			</div>
			<div class="card-body">
				<div>${estimatee.JName } 제자</div>			
			</div>	
			<div class="card-bottom" id="button">
				<div><hr></div>
				<button onclick="location.href='/dal/member/estimate/readToSendEstimate?eNo=${estimatee.ENo}'" class="btn btn-warning">견적서 보기</button>
			</div>
		</div>
	</c:forEach>
	</div>
	<div id="page_wrap" style="text-align:center;">
		<div id="inner">
		<ul class="pagination">
			<c:if test="${sendEstimate.prev==true}">
				<li><a style="color: black;" href="/dal/member/estimate/sendEstimateList?pageno=${sendEstimate.startPage-1}&dMno=${dMno}">이전</a></li>
			</c:if>
			<c:forEach begin="${sendEstimate.startPage}" end="${sendEstimate.endPage}" var="i">
				<c:choose>
					<c:when test="${sendEstimate.pageno eq i }">
						<li>
							<a style="background-color: orange; color: white;" href="/dal/member/estimate/sendEstimateList?pageno=${i}&dMno=${dMno}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a style="color: black;" href="/dal/member/estimate/sendEstimateList?pageno=${i}&dMno=${dMno}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${sendEstimate.next==true}">
				<li><a style="color: black;" href="/dal/member/estimate/sendEstimateList?pageno=${sendEstimate.endPage+1}&dMno=${dMno}">다음</a></li>
			</c:if>
		</ul>
		</div>
	</div>
</sec:authorize>
</body>
</html>