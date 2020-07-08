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
<script>




</script>
</head>
<body>

	<div style="display: inline-block; width: 80px; position: absolute; left: 69.7%; top: 220px; border: 0; outline: 0;">
		<select style="border-style: none;" onchange="location.href=this.value">
			<option value="/dal/admin/member_manage">제자회원</option>
			<option value="/dal/admin/member_manage_d" >달인회원</option>
		</select>
	</div>
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

<div id="JejaTable_wrap" >
	<div id="JejaManage_title" style="display: inline-block; position: absolute; left: 28%">
		<h1>회원 관리</h1>
	</div>
		<table class="table table-hover" style="width: 700px; padding: 100px 0; float: left; text-align: center;">
			<colgroup>
				<col width="15%">
				<col width="30%">
				<col width="20%">
				<col width="20%">
				<col width="15%">
			</colgroup>
			<thead>
			<tr class="active">
				<th>이름</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>신고당한 횟수</th>
				<th>블락 여부</th>
			</tr>
			</thead>
			<tbody>
 			 <c:forEach items="${jeja.list }" var="list">
				<tr>
					<td>${list.JName}</td>
					<td>${list.JEmail }</td>
					<td>${list.JTel }</td>
					<td>${list.JAccusationCnt }</td>
					<c:choose>
						<c:when test="${list.JIsBlock == 'false'}">
							<td>활성화</td>
						</c:when>
						<c:otherwise>
							<td>비활성화</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach> 
			</tbody>
		</table>
		
			<div style="text-align: center; display: inline-block; margin-left: 35%">
				<ul class="pagination">
					<c:if test="${jeja.prev==true }">
						<li><a href="/dal/admin/member_manage?pageno=${jeja.startPage-1 }">이전</a></li>
					</c:if>
					<c:forEach begin="${jeja.startPage }" end="${jeja.endPage }" var="i">
						<c:choose>
							<c:when test="${jeja.pageno eq i }">
								<li class="active">
									<a href="/dal/admin/member_manage?pageno=${i }">${i }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="/dal/admin/member_manage?pageno=${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${jeja.next==true }">
						<li><a href="/dal/admin/member_manage?pageno=${jeja.endPage+1 }">다음</a></li>
					</c:if>
				</ul>
			</div>
	</div>	
	



</body>
</html>