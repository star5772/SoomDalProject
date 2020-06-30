<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		var pageno = ${search.pageno};
		$("#search_btn").on("click", function(e) {
			e.preventDefault();
			var url = "${pageContext.request.contextPath}/member/search";
			url = url + "?pageno=" + pageno;
			url = url + "&searchType=" + $('#search').val();
			url = url + "&keyword=" + $('#keyword').val();
			location.href = url;
		});
		
		$("#sport_area").hide();
		$("#sport_btn").on("click", function() {
			$("#sport_area").toggle();
	});
</script>
<style>
#search_div div {
	display: inline-block;
}

#search_wrap {
	width: 800px;
}

#page_wrap {
	position: relative;
	width: 1075px;
	height: 60px;
}

#inner {
	position: absolute;
	left: 40%;
	margin: auto;
}

#dal_profile {
	display: inline-block;
}

#dal_content {
	display: inline-block;
	margin: 0 0 0 24px;
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
					</select>
				</div>
				<div style="padding-right: 10px" class="form-group">
					<input type="text" id="keyword" name='keyword' class="form-control"
						style="width: 180px;" placeholder="달인, 지역을  검색해보세요">
				</div>
				<div>
					<button type="button" id="search_btn" class="btn btn-info">검색</button>
				</div>
				<div>
					<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">카테고리</button>
				</div>
			</div>
		</div>
		<div id="dal_list">
			<!-- 아래 c:forEach 로 list 개수만큼 div 반복 -->
			<c:forEach items="${search.list }" var="list">
				<div style="padding: 24px 0;">
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
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
          			<h4 class="modal-title">서비스 선택</h4>
        		</div>
				<div class="modal-body">
					<a href="#demo" data-toggle="collapse"><div>스포츠</div></a>
						<div id="demo" class="collapse">
       					  <ul class="nav flex-column">
          					  <li class="nav-item">
               					<a class="nav-link active" href="#"><span class="menu_span">스케이트보드</span></a>
              					 <hr>
           					 </li>
            					<li class="nav-item">
               						<a class="nav-link" href="#"><span class="menu_span">클라이밍</span></a>
               					<hr>
            				</li>
            				<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">골프</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">볼링</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">탁구</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">당구</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">필라테스</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">스쿼시</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">호신술</span></a>
           					</li>
           				</ul>
						</div>
						<a href="#demo1" data-toggle="collapse"><div>미술</div></a>
						<div id="demo1" class="collapse">
       					  <ul class="nav flex-column">
          					  <li class="nav-item">
               					<a class="nav-link active" href="#"><span class="menu_span">회화</span></a>
              					 <hr>
           					 </li>
            					<li class="nav-item">
               						<a class="nav-link" href="#"><span class="menu_span">만화/웹툰/애니</span></a>
               					<hr>
            				</li>
            				<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">아동미술</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">샌드아트</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">팝아트</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">가공/목공예</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">도예</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">소묘</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">켈리그라피</span></a>
           					</li>
           				</ul>
						</div>
						<a href="#demo2" data-toggle="collapse"><div>음악</div></a>
						<div id="demo2" class="collapse">
       					  <ul class="nav flex-column">
          					  <li class="nav-item">
               					<a class="nav-link active" href="#"><span class="menu_span">피아노</span></a>
              					 <hr>
           					 </li>
            					<li class="nav-item">
               						<a class="nav-link" href="#"><span class="menu_span">일렉기타</span></a>
               					<hr>
            				</li>
            				<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">드럼</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">베이스기타</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">바이올린</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">색소폰</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">트럼펫</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">플루트</span></a>
           						<hr>
           					</li>
           					<li class="nav-item">
               					<a class="nav-link" href="#"><span class="menu_span">첼로</span></a>
           					</li>
           				</ul>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>