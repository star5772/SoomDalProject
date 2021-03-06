<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캐쉬 사용내역</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<style>
th {
	text-align: center;
}
</style>
</head>
<body>
<div style="font-size: medium;width: 700px; text-align: center; margin-left: 178px; margin-top: 100px;">
	<table class="table table-hover" >
		<colgroup>
			<col width="30%">
			<col width="30%">
			<col width="40%">
		</colgroup>	
		<tr>
			<th>견적서 번호</th>
			<th>결제 금액</th>
			<th>사용 날짜</th>
		</tr>
		<c:forEach items="${uc.list}" var="uc">
			<tr>
				<td>${uc.ENo}</td>
				<td>${uc.caEstimateCash}</td>
				<td>${uc.caUseDateStr}</td>
			</tr>
		</c:forEach>
	</table>
	<div style="text-align:center; margin-top:300px;">
		<ul class="pagination">
			<c:if test="${uc.prev==true}">
				<li><a href="/dal/dalin/usedCashList?pageno=${uc.startPage-1}&dMno=${dMno}">이전</a></li>
			</c:if>
			<c:forEach begin="${uc.startPage}" end="${uc.endPage}" var="i">
				<c:choose>
					<c:when test="${uc.pageno eq i }">
						<li class="active">
							<a href="/dal/dalin/usedCashList?pageno=${i}&dMno=${dMno}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/dal/dalin/usedCashList?pageno=${i}&dMno=${dMno}">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			<c:if test="${uc.next==true}">
				<li><a href="/dal/dalin/usedCashList?pageno=${uc.endPage+1}&dMno=${dMno}">다음</a></li>
			</c:if>
		</ul>
	</div>
<div style="margin-top: 150px;" >		
	<input type="button" class="btn btn-danger" value="창닫기" onclick="window.close()">
</div>	
</div>	
</body>
</html>