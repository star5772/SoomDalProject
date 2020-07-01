<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<style>
	#dal_profile {
		display: inline-block;
	}
	#dal_content {
		display:inline-block;
		margin:0 0 0 24px;
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
</head>
<body>
<div id="title_image" style="height: 200px;">
	<div id="title_wrap">
		<h1 style="padding: 10px;">해당 필드 이름</h1>
		<div id="field_statistics" style="height: 45px;">
			<div style="border-right: 1px solid black; display: inline-block; padding: 0 10px;"><span>${dalin.count }</span><p>활동 고수</p></div>
			<div style="display: inline-block; padding: 0 10px;"><span>별</span><p>평점</p></div>
		</div>
	</div>
</div>
<div id="field_list">
	<!-- 아래 c:forEach 로 list 개수만큼 div 반복 -->
	<c:forEach items="${dalin.list }" var="list">
		<div style="padding: 24px 0; clear: both;">
			<div id="dal_profile">
				${list.DProfile }
			</div>
			<div id="dal_content">
				<h5><a href="/dal/member/dalin_profile?dMno=${list.DMno }">${list.DName }</a></h5>
				<p>${list.DIntro }</p>
				<div>별점</div>
			</div>
		</div>
		<hr>
	</c:forEach>
	<div id="page_wrap">
		<div id="inner">
		<ul class="pagination">
			<c:if test="${dalin.prev==true}">
				<li><a href="/dal/field/list?pageno=${dalin.startPage-1}&detailFName=skateboard">이전</a></li>
			</c:if>
			<c:forEach begin="${dalin.startPage}" end="${dalin.endPage}" var="i">
				<c:choose>
					<c:when test="${dalin.pageno eq i }">
						<li class="active">
							<a href="/dal/field/list?pageno=${i}&detailFName=skateboard">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/dal/field/list?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${dalin.next==true}">
				<li><a href="/dal/field/list?pageno=${dalin.endPage+1}">다음</a></li>
			</c:if>
		</ul>
		</div>
	</div>
</div>
</body>
</html>