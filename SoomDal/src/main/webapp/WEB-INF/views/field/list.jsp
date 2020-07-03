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
<div id="title_image" style="height: 300px; padding: 3.75rem; background-image: url('https://dmmj3ljielax6.cloudfront.net/upload/service-bg/service_13f0815c-8d41-4656-a7a7-291a817b2d0a.jpg'); background-size: cover; position: ">
	<div id="title_wrap">
		<h1 style="padding: 20px 0px; font-weight: bold; font-size: 40px; color: white;">${name }</h1>
		<div id="field_statistics" style="height: 45px;">
			<div style="border-right: 1px solid black; display: inline-block; padding: 0 10px; color: white; font-weight: bold;"><span style="font-size: 22px;">${dalin.count }</span><p style="font-size: 14px;">활동 고수</p></div>
			<div style="display: inline-block; padding: 0 10px; color: white; font-weight: bold;"><span>별</span><p style="font-size: 14px;">평점</p></div>
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
		<div id="search_div">
				<div style="padding-right: 2px;" class="form-group">
					<select id="search" class="form-control" name="searchType" style="height: 30px;">
						<option value="DNAME">달인</option>
						<option value="DAREA">지역</option>
					</select>
				</div>
				<div style="padding-right: 2px" class="form-group">
					<input type="text" id="keyword" name='keyword' class="form-control"
						style="width: 240px; height: 30px;" placeholder="달인, 지역을  검색해보세요">
				</div>
				<div>
					<button type="button" id="search_btn" class="btn btn-info" style="height: 28px; width: 40px; background-color: #999999; color: white; border: 0; outline: 0;">검색</button>
				</div>
				<div>
					<button type="button" style="margin-left: 335px; background-color: white; color: #999999; width: 100px; height: 30px; border: 1px solid #999999; border-radius: 5px; font-size: 14px;"  data-toggle="modal" data-target="#myModal"><i class="fas fa-th-large"></i>  카테고리</button>
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