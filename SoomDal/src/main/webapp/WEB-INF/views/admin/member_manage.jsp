<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
	$("#report").on("click",function() {
		$("#table_wrap").css("display","none");
		$("#table_review_wrap").css("display","none");
		$("#table_enabled_wrap").css("display","none");
		$("#table_report_wrap").removeAttr("style");
	})
})

 $(document).ready(function(){
	$("#user").on("click",function() {
		$("#table_report_wrap").css("display","none");
		$("#table_review_wrap").css("display","none");
		$("#table_enabled_wrap").css("display","none");
		$("#table_wrap").removeAttr("style");
	})
}) 

$(document).ready(function() {
	$("#review").on("click",function() {
		$("#table_wrap").css("display","none");
		$("#table_report_wrap").css("display","none");
		$("#table_enabled_wrap").css("display","none");
		$("#table_review_wrap").removeAttr("style");
	})
})

$(document).ready(function() {
	$("#enabled").on("click",function() {
		$("#table_wrap").css("display","none");
		$("#table_report_wrap").css("display","none");
		$("#table_review_wrap").css("display","none");
		$("#table_enabled_wrap").removeAttr("style");
	})
	
})
</script>
</head>
<body>


	
	<div style="display: inline-block; width: 80px; position: absolute; left: 69.7%; top: 220px; border: 0; outline: 0;">
		<select style="border-style: none;">
			<option>제자회원</option>
			<option>달인회원</option>
		</select>
	</div>
<div id="manage_wrap">
	<div id="menu_wrap" style="width: 200px; display: inline-block; text-align: center; padding: 150px 20px; float: left;">
		<div class="list-group" style="border:#CFCFCF;">
    		<a href="#" class="list-group-item" id="user">회원 관리</a>
    		<a href="#" class="list-group-item" id="review">게시물 관리</a>
    		<a href="#" class="list-group-item" id="report">신고회원 관리</a>
    		<a href="#" class="list-group-item" id="enabled">블락회원 관리</a>
    		<a href="#" class="list-group-item">환불 관리</a>
  		</div>
	</div>

	<div id="table_wrap" >
	<div id="manage_title1" style="display: inline-block; position: absolute; left: 28%">
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
					<td>${list.JJoinDate }</td>
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
		<div id="table_report_wrap" style="display:none;">
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
				</tr>
				</thead>
				<tbody>
		 		<c:forEach items="${jeja.list}" var="j">
					<tr>
						<td>${j.JJoinDate}</td>
						<td>${j.JEmail }</td>
						<td>${j.JName }</td>
						<td>${j.JAccusationCnt }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div style="text-align: center; display: inline-block; margin-left: 35%; display: none;">
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
		
		 <div id="table_review_wrap" style="display:none;">
		 	<div id="manage_title3" style="display: inline-block; position: absolute; left: 28%">
				<h1>게시물 관리</h1>
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
					<th>신고게시물</th>
					<th>신고당한 횟수</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${review.list }" var="v">
					<tr>
						<td>${v.RDate }</td>
						<td>${v.RWriter }</td>
						<td>${v.RScore }</td>
						<td>${v.RContent }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
				<div style="text-align: center; display: inline-block; margin-left: 35%">
				<ul class="pagination">
					<c:if test="${review.prev==true }">
						<li><a href="/dal/admin/member_manage?pageno=${review.startPage-1 }">이전</a></li>
					</c:if>
					<c:forEach begin="${review.startPage }" end="${review.endPage }" var="i">
						<c:choose>
							<c:when test="${review.pageno eq i }">
								<li class="active">
									<a href="/dal/admin/member_manage?pageno=${i }">${i }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="/dal/admin/member_manage?pageno=${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${review.next==true }">
						<li><a href="/dal/admin/member_manage?pageno=${review.endPage+1 }">다음</a></li>
					</c:if>
				</ul>
			</div>
		</div>
			
			<div id="table_enabled_wrap" style="display:none;">
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
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${enabled.list }" var="e">
					<tr>
						<td>${e.JName}</td>
						<td>${e.JJoinDate }</td>
					</tr>
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
</div>

</body>
</html>