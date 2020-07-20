<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">  
<style>
	th {
		text-align: center;
	}
</style>
</head>
<body>
	<div id="refund">
		<span style="font-size: 30px; font-weight: bold; float: left; margin-left: 60px; margin-top: 60px;">환불 내역</span>
			<table class="table table-hover"
			style="width: 700px; margin-top: 190px; float: left; text-align: center;">
			<colgroup>
				<col width="25%">
				<col width="30%">
				<col width="25%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr class="active">
					<th>환불 코드</th>
					<th>신청 날짜</th>
					<th>요청금액</th>
					<th>여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${nowRefund.list }" var="r">
					<tr>
						<td>${r.PRefundCode}</td>
						<td>${r.PReqRefundDate }</td>
						<td>${r.PMoney }</td>
						<c:choose>
							<c:when test="${r.PRefundIsOk ==true}">
								<td>환불처리완료</td>
							</c:when>
							<c:otherwise>
								<td>미환불</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>