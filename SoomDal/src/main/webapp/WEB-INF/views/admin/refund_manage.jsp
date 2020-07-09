<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>refund_manage</title>
<title>Insert title here</title>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<sec:authorize
	access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<script>
$(function() {
	$(".refundAccess").click(function() {
		var code = $(this).data("code");
		
		var params = {
				pCode:code,
				_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "/dal/member/admin/confirmRefund",
			method: "post",
			data: params,
			success: function() {
				alert("처리완료");
				window.location.reload();
			}
		})
	});
});
</script>
<style>
h1 {
	font-weight: bolder;
	margin-top: 65px;
	text-align: left;
	font-size: 28px;
}

table {
	margin-top: 150px;
}

#manage_wrap a {
	font-size: 14px;
	font-weight: bold;
}

th {
	font-size: 14px;
	font-weight: bold;
}

td {
	font-size: 12px;
}

.list-group-item {
	margin-bottom: 1px;
}
</style>
</head>
<body>
	<div id="manage_wrap">
		<div id="menu_wrap"
			style="width: 200px; display: inline-block; text-align: center; padding: 150px 20px; float: left;">
			<div class="list-group" style="border: #CFCFCF;">
    		<a href="/dal/admin/member_manage" class="list-group-item" id="user">회원 관리</a>
    		<a href="/dal/admin/review_manage" class="list-group-item" id="review">게시물 관리</a>
    		<a href="/dal/admin/jeja_manage" class="list-group-item" id="report">신고회원 관리</a>
    		<a href="/dal/admin/enabled_manage" class="list-group-item" id="enabled">블락회원 관리</a>
    		<a href="/dal/admin/refund_manage" class="list-group-item">환불 관리</a>
			</div>
		</div>
	</div>
	<div id="table_enabled_wrap">
		<div id="manage_title4"
			style="display: inline-block; position: absolute; left: 28%">
			<h1>환불 관리</h1>
		</div>
		<table class="table table-hover"
			style="width: 700px; padding: 100px 0; float: left; text-align: center;">
			<colgroup>
				<col width="15%">
				<col width="20%">
				<col width="20%">
				<col width="15%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr class="active">
					<th>아이디</th>
					<th>신청 날짜</th>
					<th>요청금액</th>
					<th>여부</th>
					<th>수락</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${refund.list }" var="r">
					<tr>
						<td>${r.DEmail}</td>
						<td>${r.PReqRefundDate }</td>
						<td>${r.PMoney }</td>
						<c:choose>
							<c:when test="${r.PRefundIsOk ==true}">
								<td>환불</td>
								<td>환불처리완료</td>
							</c:when>
							<c:otherwise>
								<td>미환불</td>
								<td>
									<button type="button" data-code="${r.PCode }" class="btn btn-secondary refundAccess" style="width: 50px;">수락</button>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<input type="hidden" name="dEmail" id="dEmail" value="${r.DEmail}">
				</c:forEach>
			</tbody>
		</table>
		<div
			style="text-align: center; display: inline-block; margin-left: 35%">
			<ul class="pagination">
				<c:if test="${refund.prev==true }">
					<li><a
						href="/dal/admin/refund_manage?pageno=${refund.startPage-1 }">이전</a></li>
				</c:if>
				<c:forEach begin="${refund.startPage }" end="${refund.endPage }"
					var="i">
					<c:choose>
						<c:when test="${refund.pageno eq i }">
							<li class="active"><a
								href="/dal/admin/refund_manage?pageno=${i }">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/dal/admin/refund_manage?pageno=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${refund.next==true }">
					<li><a
						href="/dal/admin/refund_manage?pageno=${refund.endPage+1 }">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>