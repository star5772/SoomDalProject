<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
</head>
<body>

	<div style="display: inline-block; width: 80px; position: absolute; left: 69.7%; top: 220px; border: 0; outline: 0;">
		<select style="border-style: none;" onchange="location.href=this.value">
			<option value="/dal/member/admin/member_manage">제자회원</option>
			<option value="/dal/member/admin/member_manage_d" selected="selected">달인회원</option>
		</select>
	</div>
<div id="manage_wrap">
	<div id="menu_wrap" style="width: 200px; display: inline-block; text-align: center; padding: 150px 20px; float: left;">
		<div class="list-group" style="border:#CFCFCF;">
    		<a href="/dal/member/admin/member_manage" class="list-group-item" id="user">회원 관리</a>
    		<a href="/dal/member/admin/review_manage" class="list-group-item" id="review">게시물 관리</a>
    		<a href="/dal/member/admin/jeja_manage" class="list-group-item" id="report">신고회원 관리</a>
    		<a href="/dal/member/admin/enabled_manage" class="list-group-item" id="enabled">블락회원 관리</a>
    		<a href="/dal/member/admin/refund_manage" class="list-group-item">환불 관리</a>
  		</div>
	</div>
</div>

	<div id="DalinTable_wrap" >
	<div id="DalinManage_title" style="display: inline-block; position: absolute; left: 28%">
		<h1>회원 관리</h1>
	</div>
		<table class="table table-hover" style="width: 700px; padding: 100px 0; float: left; text-align: center;">
			<colgroup>
				<col width="10%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			<thead>
			<tr class="active">
				<th>이름</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>전문분야</th>
				<th>회원 상태</th>
				<th>회원 등급</th>
			</tr>
			</thead>
			<tbody>
 			 <c:forEach items="${dalin.list }" var="dal">
				<tr>
					<td>${dal.DName}</td>
					<td>${dal.DEmail }</td>
					<td>${dal.DTel }</td>
					<td>${dal.detailFName}</td>
					<c:choose>
						<c:when test="${list.enabled == 'true'}">
							<td>활성화</td>
						</c:when>
						<c:otherwise>
							<td>비활성화</td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${dal.DLevelStr == 'NORMAL'}">
							<td>일반 회원</td>
						</c:when>
						<c:when test="${dal.DLevelStr == 'SILVER'}">
							<td style="color: silver;">실버 회원</td>
						</c:when>
						<c:when test="${dal.DLevelStr == 'GOLD'}">
							<td style="color: yellow;">골드 회원</td>
						</c:when>
						<c:when test="${dal.DLevelStr == 'PLATINUM'}">
							<td style="color: aqua;">플래티넘 회원</td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach> 
			</tbody>
		</table>	
		
			<div style="text-align: center; display: inline-block; margin-left: 35%">
				<ul class="pagination">
					<c:if test="${dalin.prev==true }">
						<li><a href="/dal/member/admin/member_manage_d?pagene=${dalin.startPage-1 }">이전</a></li>
					</c:if>
					<c:forEach begin="${dalin.startPage }" end="${dalin.endPage }" var="i">
						<c:choose>
							<c:when test="${dalin.pagene eq i }">
								<li class="active">
									<a href="/dal/member/admin/member_manage_d?pagene=${i }">${i }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="/dal/member/admin/member_manage_d?pagene=${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${dalin.next==true }">
						<li><a href="/dal/member/admin/member_manage_d?pagene=${dalin.endPage+1 }">다음</a></li>
					</c:if>
				</ul>
			</div>
	</div>		


</body>
</html>