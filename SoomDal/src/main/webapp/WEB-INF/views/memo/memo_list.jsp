<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memo_list</title>
<style>
h2 {
	margin-top: 50px;
	margin-left: 80px;
	margin-bottom: 80px;
	font-size: 25px;
	font-weight: bold;
	font-size: 25px;
}

button {
	width: 50px;
	height: 18px;
	text-align: center;
	background-color: #BDBDBD;
	color: white;
	border: 0;
	outline: 0;
	border-radius: 4px;
	font-weight: normal;
	margin-left: 400px;
}
</style>
<body>
	<div style="margin-top: 100px;">
		<h2>받은쪽지</h2>
	</div>
	<div style="margin-top: 50px; margin-left: 200px; width: 600px;">
		<div class="nav-item">
			<!--<c:forEach items="${Memolist.list}" var="list"> -->
				<div style="display: inline-block;"  class="nav-link actice" >
					<img style="border-radius: 50%; width: 60px; height: 60px;">
				</div>
				<div style="display: inline-block; height: 80px;">
					<div>
						<p style="font-size: 12px; font-weight: bold; margin-left: 30px;">김희은 달인님의 견적서가 도착했습니다.</p>
						<p style="font-size: 10px; margin-left: 30px; display: inline-block;">2020.05.03</p>
						<button>삭&nbsp;제</button>
					</div>
				</div>
				<hr>
			<!--</c:forEach> -->
		</div>
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

</body>
</html>