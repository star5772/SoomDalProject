<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	th {
		font-size: 16px;
	}
	td {
		font-size: 12px;
	}
	.table {
		text-align: center;
	}
	#page_wrap {
      position: relative;
      width: 1075px;
      height: 60px;
   }
   #inner {
      position: absolute;
      left: 40%;
      top: 50%;
      margin: auto;
   }
</style>
</head>
<body>
	<div>
		<table class="table table-hover">
			<colgroup>
				<col width="10%">
				<col width="40%">
				<col width="10%">
				<col width="30%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody id="list">
			<c:forEach items="${reqPage.list}" var="RequestBoard">
				<tr>
					<td>${RequestBoard.rbNo }</td>
					<td><a href="/dal/member/reqboard/read?rbNo=${RequestBoard.rbNo}">${RequestBoard.rbTitle}</a></td>
					<td>${RequestBoard.rbWriter}</td>
					<td>${RequestBoard.rbWriteDateStr}</td>
					<td>${RequestBoard.rbReadCnt}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="page_wrap">
		<div id="inner">
		<ul class="pagination">
			<c:if test="${reqPage.prev==true }">
				<li><a href="/dal/member/reqboard/list?pageno=${reqPage.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${reqPage.startPage}" end="${reqPage.endPage}" var="i">
				<c:choose>
					<c:when test="${reqPage.pageno eq i}">
						<li class="active">
							<a href="/dal/member/reqboard/list?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/dal/member/reqboard/list?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${reqPage.next==true }">
				<li><a href="/dal/member/reqboard/list?pageno=${reqPage.endPage+1}">다음</a></li>
			</c:if>
		</ul>
		</div>
	</div>
	<div class="form-group">
		<a class="btn btn-info" href="/dal/member/reqboard/write">글쓰기</a>
	</div>
</body>
</html>