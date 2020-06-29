<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin-top: 100px;">
<h1>레슨 내역</h1>
</div>
<div style="margin-top: 50px; margin-left:200px; width: 600px;">
	<div style="margin-top: 50px;">
		<c:forEach items="${LHlist.list}" var="list">
			<div style="display: inline-block;">
				<img src="/image/필라테스.jpg" style="border-radius:50%; width: 90px;height: 90px;">
			</div>
			<div style="display: inline-block; height:100px;">
				<div>
					<p style="font-size:large; font-weight:bold; margin-left:30px;">${list.DName} 달인</p>
					<p style="font-size:medium; margin-left:30px; display: inline-block;">${list.detailFName} 레슨</p>
					<a class="btn btn-info" style="width:80px;height: 30px; text-align: center; margin-left: 230px;" href="/dal/member/dalin_profile?dMno=${list.DMno}">리뷰 작성</a>
				</div>
			</div>
			<hr>
		</c:forEach>
	</div>
</div>

	<div style="text-align:center; margin-top:350px; margin-left: 450px;">
		<ul class="pagination">
			<c:if test="${LHlist.prev==true}">
				<li><a href="/dal/jeja/lessonList?pageno=${LHlist.startPage-1}&jMno=${jMno}">이전</a></li>
			</c:if>
			<c:forEach begin="${LHlist.startPage}" end="${LHlist.endPage}" var="i">
				<c:choose>
					<c:when test="${LHlist.pageno eq i }">
						<li class="active">
							<a href="/dal/jeja/lessonList?pageno=${i}&jMno=${jMno}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/dal/jeja/lessonList?pageno=${i}&jMno=${jMno}">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			<c:if test="${LHlist.next==true}">
				<li><a href="/dal/jeja/lessonList?pageno=${LHlist.endPage+1}&jMno=${jMno}">다음</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>