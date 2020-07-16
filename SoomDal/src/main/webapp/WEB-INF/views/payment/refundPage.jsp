<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="refund">
			<table class="table table-hover"
			style="width: 700px; padding: 100px 0; float: left; text-align: center;">
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