<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memo_list</title>
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
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
</style>
<body>
	<div style="margin-top: 100px;">
		<h2>받은쪽지</h2>
	</div>
	<div style="margin-top: 50px; margin-left: 200px; width: 600px;">
		<div>
			<c:forEach items="${memoList.list}" var="memolist">
				<div>
				<div style="display: inline-block; ">
					<img style="border-radius: 50%; width: 60px; height: 60px;">
				</div>
				<div style="display: inline-block; height: 50px; text-align: center; width: 300px; margin-top: 50px;">
					
						<p style="font-size: 12px; font-weight: bold; margin-left: 0px; display: inline-block; padding-left: 0px;">${memolist.title }김희은 달인님의 견적서가 도착했습니다.</p>
						<p style="font-size: 10px; font-weight: bold; margin-left: 30px; display: inline-block;">${memolist.writeTimeStr }2020.05.03</p>
				</div>
						<button>삭&nbsp;제</button>
					
				</div>
				<hr>
			</c:forEach>
		</div>
	</div>
	
	<div id="page_wrap" style="text-align:center;">
		<div id="inner">
		<ul class="pagination">
			<c:if test="${memoList.prev==true}">
				<li><a style="color: black;" href="/dal/member/memo/memo_receiveList?pageno=${memoList.startPage-1}&username=${username}">이전</a></li>
			</c:if>
			<c:forEach begin="${memoList.startPage}" end="${memoList.endPage}" var="i">
				<c:choose>
					<c:when test="${memoList.pageno eq i }">
						<li>
							<a style="background-color: orange; color: white;" href="/dal/member/memo/memo_receiveList?pageno=${i}&username=${username}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a style="color: black;" href="/dal/member/memo/memo_receiveList?pageno=${i}&username=${username}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${memoList.next==true}">
				<li><a style="color: black;" href="/dal/member/memo/memo_receiveList?pageno=${memoList.endPage+1}&username=${username}">다음</a></li>
			</c:if>
		</ul>
		</div>
	</div>

</body>
</html>