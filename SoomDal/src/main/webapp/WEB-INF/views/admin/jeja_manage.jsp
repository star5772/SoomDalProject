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
$(function(){
	$("#jIsBlock").on("change",function(){
		var params = {
				jMno: $("#jMno").val(),
				jIsBlock : $("#jIsBlock").val(),
				_csrf: "${_csrf.token}"
			}
		console.log(params)
		$.ajax({
			url : "/dal/member/admin/AccusationMem",
			method : "post",
			data: params,
			success: function() {
				alert("변경되었습니다");
				window.location.reload();
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
    		<a href="/dal/admin/member_manage" class="list-group-item" id="user">회원 관리</a>
    		<a href="/dal/admin/review_manage" class="list-group-item" id="review">게시물 관리</a>
    		<a href="/dal/admin/jeja_manage" class="list-group-item" id="report">신고회원 관리</a>
    		<a href="/dal/admin/enabled_manage" class="list-group-item" id="enabled">블락회원 관리</a>
    		<a href="/dal/admin/refund_manage" class="list-group-item">환불 관리</a>
  		</div>
	</div>
</div>


<div id="table_report_wrap" >
			<div id="manage_title2" style="display: inline-block; position: absolute; left: 28%">
				<h1>신고회원 관리</h1>
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
					<th>가입일</th>
					<th>작성자</th>
					<th>회원이름</th>
					<th>신고횟수</th>
					<th>상태 변경</th>
				</tr>
				</thead>
				<tbody>
		 		<c:forEach items="${jeja.list}" var="j">
					<tr>
						<input type="hidden" id="jMno" value="${j.JMno}">
						<td>${j.JJoinDateStr}</td>
						<td>${j.JEmail }</td>
						<td>${j.JName }</td>
						<td>${j.JAccusationCnt }</td>
						<td>
							<select id="jIsBlock">
								<option selected="selected">선택하세요</option>
								<option value="warn">경고</option>
								<option value="block">정지</option>
							</select>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div style="text-align: center; display: inline-block; margin-left: 35%;">
				<ul class="pagination">
					<c:if test="${jeja.prev==true }">
						<li><a href="/dal/admin/jeja_manage?pageno=${jeja.startPage-1 }">이전</a></li>
					</c:if>
					<c:forEach begin="${jeja.startPage }" end="${jeja.endPage }" var="i">
						<c:choose>
							<c:when test="${jeja.pageno eq i }">
								<li class="active">
									<a href="/dal/admin/jeja_manage?pageno=${i }">${i }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="/dal/admin/jeja_manage?pageno=${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${jeja.next==true }">
						<li><a href="/dal/admin/jeja_manage?pageno=${jeja.endPage+1 }">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>		
</body>
</html>