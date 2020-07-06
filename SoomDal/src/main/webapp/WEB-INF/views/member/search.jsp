<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		var pageno = ${search.pageno};
		if(pageno==0) 
			pageno=1;
		$("#search_btn").on("click", function(e) {
			e.preventDefault();
			var url = "${pageContext.request.contextPath}/member/search";
			url = url + "?pageno=" + pageno;
			url = url + "&searchType=" + $('#search').val();
			url = url + "&keyword=" + $('#keyword').val();
			location.href = url;
		});
	})
</script>
<style>
#search_div div {
	display: inline-block;
}

#search_wrap {
	width: 900px;
	display: inline-block;
	margin-right: 23px;
	margin-left: 76px;
}

#page_wrap {
	position: relative;
	width: 900px;
	height: 60px;
}

#inner {
	position: absolute;
	left: 48%;
	margin: auto;
}

#dal_profile {
	display: inline-block;
}

#dal_content {
	display: inline-block;
	margin: 0 0 0 24px;
}
	a:link { color: black;}
	a:visited { color: black;}
	a:active { color: black;}
	a:hover { text-decoration: none;}
.menu_span {
	font-size: 14px;
	padding: 0px 35px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="search_wrap">
		<div id="head">
			<div id="title" style="padding: 20px 0;">
				<h1 style="font-weight: bold; font-size: 34px;">달인 찾기</h1>
			</div>
			<div><p>숨달 > 지역, 카테고리</p></div>
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
					<button type="button" style="margin-left: 428px; background-color: white; color: #999999; width: 100px; height: 30px; border: 1px solid #999999; border-radius: 5px; font-size: 14px;"  data-toggle="modal" data-target="#myModal"><i class="fas fa-th-large"></i>  카테고리</button>
				</div>
			</div>
		</div>
		<div id="dal_list">
			<!-- 아래 c:forEach 로 list 개수만큼 div 반복 -->
			<c:forEach items="${search.list }" var="list">
				<div style="padding: 24px 0;">
					<div id="dal_profile"><img style="border-radius: 10px;" src="${list.DProfile }" width="100px" height="100px"></div>
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
					<ul class="pagination" id="pagination">
						<c:choose>
							<c:when test="${search.prev==true && search.keyword eq null}">
								<li class="previous"><a href="/dal/member/search?pageno=${search.startPage-1 }">이전</a></li>
							</c:when>
							<c:when test="${search.prev==true && search.keyword ne null}">
								<li class="previous"><a href="/dal/member/search?pageno=${search.startPage-1 }&searchType=${search.searchType}&keyword=${search.keyword}">이전</a></li>
							</c:when>
						</c:choose>
						<c:forEach begin="${search.startPage }" end="${search.endPage }" var="i">
							<c:choose>
								<c:when test="${search.pageno==i && search.keyword eq null}">
									<li class="active"><a href="/dal/member/search?pageno=${i }">${i }</a></li>
								</c:when>
								<c:when
									test="${search.pageno==i && search.keyword ne null}">
									<li class="active"><a href="/dal/member/search?pageno=${i }&searchType=${search.searchType}&keyword=${search.keyword}">${i }</a></li>
								</c:when>
								<c:when
									test="${search.pageno!=i && search.keyword eq null}">
									<li><a href="/dal/member/search?pageno=${i }">${i }</a></li>
								</c:when>
								<c:when
									test="${search.pageno!=i && search.keyword ne null}">
									<li><a href="/dal/member/search?pageno=${i }&searchType=${search.searchType}&keyword=${search.keyword}">${i }</a></li>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${search.next==true && search.keyword eq null}">
								<li class="previous"><a href="/dal/member/search?pageno=${search.endPage+1 }">다음</a></li>
							</c:when>
							<c:when test="${search.next==true && search.keyword ne null}">
								<li class="previous"><a href="/dal/member/search?pageno=${search.endPage+1 }&searchType=${search.searchType}&keyword=${search.keyword}">다음</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog" style="width: 450px;">
			<div class="modal-content">
				<div class="modal-header">
          			<h4 class="modal-title" style="font-weight: bold; font-size: 24px;">서비스 선택</h4>
        		</div>
				<div class="modal-body">
					<a href="#demo" data-toggle="collapse"><div style="font-size: 18px; padding: 20px 29px; font-weight: bold;">스포츠<i class="fas fa-angle-down" style="margin-left: 80%; color: #CFCFCF;"></i></div></a>
					<hr>
						<div id="demo" class="collapse">
       					  <ul class="nav flex-column">
          					  <li class="nav-item">
               					<a class="nav-link active" href="/dal/member/search?searchType=DETAILFNAME&keyword=skateboard"><span class="menu_span">스케이트보드</span></a>
              					 <hr>
           					 </li>
            					<li class="nav-item">
               						<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=climming"><span class="menu_span">클라이밍</span></a>
               					<hr>
            				</li>
            				<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=golf"><span class="menu_span">골프</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=bowling"><span class="menu_span">볼링</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=tabletennis"><span class="menu_span">탁구</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=billiards"><span class="menu_span">당구</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=pilates"><span class="menu_span">필라테스</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=squash"><span class="menu_span">스쿼시</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=defense"><span class="menu_span">호신술</span></a>
           					</li>
           				</ul>
						</div>
						<a href="#demo1" data-toggle="collapse"><div style="font-size: 18px; padding: 20px 29px; font-weight: bold;">미술<i class="fas fa-angle-down" style="margin-left: 85%; color: #CFCFCF;"></i></div></a>
						<hr>
						<div id="demo1" class="collapse">
       					  <ul class="nav flex-column">
          					  <li class="nav-item">
               					<a class="nav-link active" href="/dal/member/search?searchType=DETAILFNAME&keyword=painting"><span class="menu_span">회화</span></a>
              					 <hr>
           					 </li>
            					<li class="nav-item">
               						<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=toonart"><span class="menu_span">만화/웹툰/애니</span></a>
               					<hr>
            				</li>
            				<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=childart"><span class="menu_span">아동미술</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=sandart"><span class="menu_span">샌드아트</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=popart"><span class="menu_span">팝아트</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=woodworking"><span class="menu_span">가공/목공예</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=pottery"><span class="menu_span">도예</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=drawing"><span class="menu_span">소묘</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=kelligrapy"><span class="menu_span">켈리그라피</span></a>
           					</li>
           				</ul>
						</div>
						<a href="#demo2" data-toggle="collapse"><div style="font-size: 18px; padding: 20px 29px; font-weight: bold;">음악<i class="fas fa-angle-down" style="margin-left: 85%; color: #CFCFCF;"></i></div></a>
						<div id="demo2" class="collapse">
       					  <ul class="nav flex-column">
          					  <li class="nav-item">
               					<a class="nav-link active" href="/dal/member/search?searchType=DETAILFNAME&keyword=piano"><span class="menu_span">피아노</span></a>
              					 <hr>
           					 </li>
            					<li class="nav-item">
               						<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=elecguitar"><span class="menu_span">일렉기타</span></a>
               					<hr>
            				</li>
            				<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=drum"><span class="menu_span">드럼</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=baseguitar"><span class="menu_span">베이스기타</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=violinn"><span class="menu_span">바이올린</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=saxophone"><span class="menu_span">색소폰</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=trumpet"><span class="menu_span">트럼펫</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=flute"><span class="menu_span">플루트</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="/dal/member/search?searchType=DETAILFNAME&keyword=cello"><span class="menu_span">첼로</span></a>
           					</li>
           				</ul>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>