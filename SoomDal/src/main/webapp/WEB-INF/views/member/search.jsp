<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function() {
	var pageno = ${list.paging.pageno};
	console.log(pageno);
	$("#search_btn").on("click", function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/board/list";
		url = url + "?pageno=" + pageno;
		url = url + "&searchType=" + $('#search').val();
		url = url + "&keyword=" + $('#keyword').val();
		console.log(url);
		location.href = url;
	});
});
</script>
<style>
	#search_div div {
		display: inline-block;
	}

	#search_wrap {
		position: absolute;
		top: 18%;
		left: 30%;
		width: 800px;
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
	#dal_profile {
		display: inline-block;
	}
	#dal_content {
		display:inline-block;
		margin:0 0 0 24px;
	}
</style>
</head>
<body>
	<div id="search_wrap">
		<div id="head">
			<div id="title" style="padding: 20px 0;">
				<h1>달인 찾기</h1>
			</div>
			<div id="search_div">
				<div style="padding-right: 10px" class="form-group">
					<select id="search" class="form-control" name="searchType">
						<option value="DNAME">달인</option>
						<option value="DAREA">지역</option>
						<option value="DETAILFNAME">종목</option>
					</select>
				</div>
				<div style="padding-right: 10px" class="form-group">
					<input type="text" id="keyword" name='keyword' class="form-control"
						style="width: 180px;" placeholder="달인, 지역, 서비스를 검색해보세요">
				</div>
				<div>
					<button type="button" id="search_btn" class="btn btn-info">검색</button>
				</div>
			</div>
		</div>
		<div id="dal_list">
			<!-- 아래 c:forEach 로 list 개수만큼 div 반복 -->
			<c:forEach items="${search.list }" var="list">
				<div style="padding: 24px 0; clear: both;">
					<div id="dal_profile">${list.DProfile }</div>
					<div id="dal_content">
						<h5>
							<a href="#">${list.DName }</a>
						</h5>
						<p>${list.DIntro }</p>
						<div>별점</div>
					</div>
				</div>
				<hr>
			</c:forEach>
			<div id="page_wrap">
				<div id="inner">
					<ul class="pagination">
						<c:if test="${search.prev==true}">
							<li><a
								href="/dal/field/list?pageno=${search.startPage-1}&detailFName=skateboard">이전</a></li>
						</c:if>
						<c:forEach begin="${search.startPage}" end="${search.endPage}"
							var="i">
							<c:choose>
								<c:when test="${search.pageno eq i }">
									<li class="active"><a
										href="/dal/field/list?pageno=${i}&detailFName=skateboard">${i}</a>
									</li>
								</c:when>
								<c:otherwise>
									<li><a href="/dal/field/list?pageno=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${search.next==true}">
							<li><a href="/dal/field/list?pageno=${dalin.endPage+1}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>