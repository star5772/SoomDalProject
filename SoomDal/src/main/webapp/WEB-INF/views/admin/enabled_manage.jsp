<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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
<script>
$(document).ready(function() {
	$("#jIsBlock").on("change", function() {
		var params = {
			_csrf:"${_csrf.token}",
			jIsBlock:$("#jIsBlock").val(),
			jEmail:$("#jEmail").val()
		}
		$.ajax({
			url:"/dal/member/admin/member_manage",
			method:"post",
			data:params,
			success: function() {
				window.location.reload();
				toastr.info("변경성공");
			},error: function() {
				toastr.info("변경 실패")
			}
		})
	})
})
</script>
</head>
<body>
<div id="manage_wrap">
	<div id="menu_wrap" style="width: 200px; display: inline-block; text-align: center; padding: 150px 20px; float: left;">
		<div class="list-group" style="border:#CFCFCF;">
    		<a href="/dal/member/admin/member_manage" class="list-group-item" id="user">회원 관리</a>
    		<a href="/dal/member/admin/review_manage" class="list-group-item" id="review">게시물 관리</a>
    		<a href="/dal/member/admin/jeja_manage" class="list-group-item" id="report">신고회원 관리</a>
    		<a href="/dal/member/admin/enabled_manage" class="list-group-item" id="enabled">블락회원 관리</a>
    		<a href="#" class="list-group-item">환불 관리</a>
  		</div>
	</div>
</div>
<div id="table_enabled_wrap" >
				<div id="manage_title4" style="display: inline-block; position: absolute; left: 28%">
					<h1>블락회원 관리</h1>
				</div>
			<table class="table table-hover" style="width: 700px; padding: 100px 0; float: left; text-align: center;">
			<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
				<tr class="active">
					<th>아이디</th>
					<th>정지당한시간</th>
					<th>회원상태</th>
					<th>블락여부</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${enabled.list }" var="e">
					<tr>	
						<td>${e.JName}</td>
						<td>${e.JJoinDate }</td>
						<c:choose>
						<c:when test="${e.enabled == true}">
						<td>활성화</td>
						</c:when>
						<c:otherwise>
						<td>비활성화</td>
						</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${e.JIsBlock == true }">
								<td>
								<select name="jIsBlock" id="jIsBlock" >
									<option value="1" selected="selected">정지</option>
									<option value="0">활성화</option>
								</select>
								</td>
							</c:when>
							<c:otherwise>
								<td>
								<select name="jIsBlock" id="jIsBlock">
									<option value="1" >정지</option>
									<option value="0" selected="selected">활성화</option>
								</select>
								</td>
							</c:otherwise>
							
						</c:choose>
					</tr>
					<input type="hidden" name="jEmail" id="jEmail" value="${e.JEmail}">
				</c:forEach>
				</tbody>	
			</table>
				<div style="text-align: center; display: inline-block; margin-left: 35%">
				<ul class="pagination">
					<c:if test="${enabled.prev==true }">
						<li><a href="/dal/admin/member_manage?pageno=${enabled.startPage-1 }">이전</a></li>
					</c:if>
					<c:forEach begin="${enabled.startPage }" end="${enabled.endPage }" var="i">
						<c:choose>
							<c:when test="${enabled.pageno eq i }">
								<li class="active">
									<a href="/dal/admin/member_manage?pageno=${i }">${i }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="/dal/admin/member_manage?pageno=${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${enabled.next==true }">
						<li><a href="/dal/admin/member_manage?pageno=${enabled.endPage+1 }">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
</body>
</html>