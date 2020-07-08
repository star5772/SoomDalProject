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
	$(function() {
		var pageno = ${dalin.pageno};
		if(pageno==0) 
			pageno=1;
		$("#search_btn").on("click", function(e) {
			e.preventDefault();
			var url = "${pageContext.request.contextPath}/member/field/list";
			url = url + "?pageno=" + pageno;
			url = url + "&searchType=" + $('#search').val();
			url = url + "&keyword=" + $('#keyword').val();
			location.href = url;
		});
	})
</script>
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
	#search_div div {
	display: inline-block;
	margin-top: 30px;
	}
	a:link { color: black;}
	a:visited { color: black;}
	a:active { color: black;}
	a:hover { text-decoration: none;}
</style>
</head>
<body>
<div id="title_image" style="height: 300px; padding: 3.75rem; background-image: url('${detail.detailFSajin}'); background-size: cover; position: ">
	<div id="title_wrap">
		<h1 style="padding: 20px 0px; font-weight: bold; font-size: 40px; color: white;">${name }</h1>
		<div id="field_statistics" style="height: 45px;">
			<div style="display: inline-block; padding: 0 10px; color: white; font-weight: bold;"><span style="font-size: 22px;">${dalin.count }</span><p style="font-size: 14px;">활동 고수</p></div>
		</div>
	</div>
</div>
${dalin }
<div id="field_list">
	<div id="search_div">
		<div style="padding-right: 2px;" class="form-group">
			<select id="search" class="form-control" name="searchType" style="height: 30px;">
				<option value="DNAME">달인</option>
				<option value="DAREA">지역</option>
			</select>
			</div>
				<div style="padding-right: 2px" class="form-group">
					<input type="text" id="keyword" name='keyword' class="form-control" style="width: 240px; height: 30px;" placeholder="달인, 지역을  검색해보세요">
				</div>
				<div>
					<button type="button" id="search_btn" class="btn btn-info" style="height: 28px; width: 40px; background-color: #999999; color: white; border: 0; outline: 0;">검색</button>
				</div>
	</div>
	<!-- 아래 c:forEach 로 list 개수만큼 div 반복 -->
			<c:forEach items="${dalin.list }" var="list">
				<div style="padding: 24px 0;">
					<c:choose>
						<c:when test="${empty list.DProfile == 'false' }">
							<div id="dal_profile"><img style="border-radius: 10px;" src="${list.DProfile }" width="100px" height="100px"></div>
						</c:when>
						<c:otherwise>
							<div id="dal_profile"><img style="border-radius: 10px;" src="/dal/image/anony.jpg" width="100px" height="100px"></div>
						</c:otherwise>
					</c:choose>
					<div id="dal_content">
						<h5>
							<a href="/dal/member/dalin_profile?dMno=${list.DMno }"><h5 style="font-weight: bold; font-size: 18px;">${list.DName }</h5></a>
						</h5>
						<p style="font-size: 14px;">${list.DIntro }</p>
						<div>
							<span>
								<c:forEach begin="1" end="${list.avgScore }">
									<img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg">
								</c:forEach>
								<c:forEach begin="${list.avgScore+1 }" end="5">
									<img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg">
								</c:forEach>
							</span>
							<span style="font-size: 16px; font-weight: bold;">${list.avgScore }</span>
						</div>
					</div>
				</div>
				<hr>
			</c:forEach>
	<div id="page_wrap">
		<div id="inner">
		<ul class="pagination">
			<c:choose>
				<c:when test="${dalin.prev==true && search.keyword eq null}">
					<li><a href="/dal/member/field/list?pageno=${dalin.startPage-1}&detailFName=${detail.detailFName}">이전</a></li>
				</c:when>
				<c:when test="${dalin.prev==true && search.keyword ne null}">
					<li><a href="/dal/member/field/list?pageno=${dalin.startPage-1}&detailFName=${detail.detailFName}&searchType=${dalin.searchType}&keyword=${dalin.keyword}">이전</a></li>
				</c:when>
			</c:choose>
			<c:forEach begin="${dalin.startPage}" end="${dalin.endPage}" var="i">
				<c:choose>
					<c:when test="${dalin.pageno eq i && search.keyword eq null}">
						<li class="active">
							<a href="/dal/member/field/list?pageno=${i}&detailFName=${detail.detailFName}">${i}</a>
						</li>
					</c:when>
					<c:when test="${dalin.pageno eq i && search.keyword ne null}">
						<li class="active">
							<a href="/dal/member/field/list?pageno=${i}&detailFName=${detail.detailFName}&searchType=${dalin.searchType}&keyword=${dalin.keyword}">${i}</a>
						</li>
					</c:when>
					<c:when test="${dalin.pageno ne i && search.keyword eq null}">
						<li><a href="/dal/member/field/list?pageno=${i}&detailFName=${detail.detailFName}">${i}</a></li>
					</c:when>
					<c:when test="${dalin.pageno ne i && search.keyword ne null}">
						<li><a href="/dal/member/field/list?pageno=${i}&detailFName=${detail.detailFName}&searchType=${dalin.searchType}&keyword=${dalin.keyword}">${i}</a></li>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${dalin.next==true && search.keyword eq null}">
					<li><a href="/dal/member/field/list?pageno=${dalin.endPage+1}&detailFName=${detail.detailFName}">다음</a></li>
				</c:when>
				<c:when test="${dalin.next==true && search.keyword ne null}">
					<li><a href="/dal/member/field/list?pageno=${dalin.endPage+1}&detailFName=${detail.detailFName}&searchType=${dalin.searchType}&keyword=${dalin.keyword}">다음</a></li>
				</c:when>
			</c:choose>
		</ul>
		</div>
	</div>
</div>
</body>
</html>