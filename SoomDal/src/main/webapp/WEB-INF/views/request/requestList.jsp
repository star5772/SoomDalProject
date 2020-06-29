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
.request{
	height: 600px;
	width: 90%;
	margin: 0 auto;
}
p{
	font-size: 12px;
}

h2{
	font-size: 25px;
	font-weight: bold;
}
#page_wrap {
    position: relative;
      width: 1075px;
      height: 60px;
}
#inner {
    position: absolute;
    left: 50%;
    margin: auto;
}
a {
	color: white;
}

</style>
</head>
<body>
<sec:authorize access="hasRole('ROLE_DALIN')">
	<div class="request">
		<div style="padding-bottom: 30px; padding-left: 10px;">
			<h2>받은 요청서</h2>
		</div>
	<c:forEach items="${receiveRequest.list }" var="request">
		<div class="card">
			<div class="card-top">
				<br>
				<div><h5>${request.RSubject }</h5></div>
				<div><p>${request.RWriteDateStr }</p></div>
			</div>
			<div class="card-body">
				<div>${request.JName } 제자</div>			
			</div>	
			<div class="card-bottom" id="button">
				<div><hr></div>
				<button onclick="location.href='/dal/member/request/readToRequestForReceive?rNo=${request.RNo}'" class="btn btn-warning">요청서 보기</button>
			</div>
		</div>
	</c:forEach>
	</div>
	<div id="page_wrap" style="text-align:center;">
		<div id="inner">
		<ul class="pagination">
			<c:if test="${receiveRequest.prev==true}">
				<li><a style="color: black;" href="/dal/member/request/receiveRequest?pageno=${receiveRequest.startPage-1}&dMno=${dMno}">이전</a></li>
			</c:if>
			<c:forEach begin="${receiveRequest.startPage}" end="${receiveRequest.endPage}" var="i">
				<c:choose>
					<c:when test="${receiveRequest.pageno eq i }">
						<li>
							<a style="background-color: orange; color: white;" href="/dal/member/request/receiveRequest?pageno=${i}&dMno=${dMno}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a style="color: black;" href="/dal/member/request/receiveRequest?pageno=${i}&dMno=${dMno}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${receiveRequest.next==true}">
				<li><a style="color: black;" href="/dal/member/request/receiveRequest?pageno=${receiveRequest.endPage+1}&dMno=${dMno}">다음</a></li>
			</c:if>
		</ul>
		</div>
	</div>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_JEJA')">
	<div class="request">
		<div style="padding-bottom: 30px; padding-left: 10px;">
			<h2>보낸 요청서</h2>
		</div>
	<c:forEach items="${sendRequest.list }" var="request">
		<div class="card">
			<div class="card-top">
				<br>
				<div><h5>${request.RSubject }</h5></div>
				<div><p>${request.RWriteDateStr }</p></div>
			</div>
			<div class="card-body">
				<div>${request.JName } 제자</div>			
			</div>	
			<div class="card-bottom" id="button">
				<div><hr></div>
				<button onclick="location.href='/dal/member/request/readToRequestForSend?rNo=${request.RNo}'" class="btn btn-warning">요청서 보기</button>
			</div>
		</div>
	</c:forEach>
	</div>
	<div id="page_wrap" style="text-align:center;">
		<div id="inner">
		<ul class="pagination">
			<c:if test="${sendRequest.prev==true}">
				<li><a style="color: black;" href="/dal/member/request/sendRequest?pageno=${sendRequest.startPage-1}&jMno=${jMno}">이전</a></li>
			</c:if>
			<c:forEach begin="${sendRequest.startPage}" end="${sendRequest.endPage}" var="i">
				<c:choose>
					<c:when test="${sendRequest.pageno eq i }">
						<li>
							<a style="background-color: orange; color: white;" href="/dal/member/request/sendRequest?pageno=${i}&jMno=${jMno}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a style="color: black;" href="/dal/member/request/sendRequest?pageno=${i}&jMno=${jMno}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${sendRequest.next==true}">
				<li><a style="color: black;" href="/dal/member/request/sendRequest?pageno=${sendRequest.endPage+1}&jMno=${jMno}">다음</a></li>
			</c:if>
		</ul>
		</div>
	</div>
</sec:authorize>

	
</body>
</html>