<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숨달 스토어</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<script>

$(function(){
	$("#RequestPayment").on("click",function(){
		var formData = $("#paymentFrm").serialize();
		$.ajax({
			url: "/dal/member/payment/store",
			method: "post" , 
			data: formData,
			success: function(){
				$("#pmDiv").css("display","none");
				$("#pnInput").removeAttr("style");
				$("#pnInput").css("height","800px");
			},error: function() {

			}
		})
	})
	$("#nextPage").on("click",function(){
		var params = {
				dTel : $("#dTel").val(),
				_csrf: "${_csrf.token}"
			}
		$.ajax({
			url: "/dal/member/sendSMS",
			method:"post" ,
			data: params,
			success: function() {
				$("#pnInput").css("display","none");
				$("#AuthDiv").removeAttr("style");
				$("AuthDiv").css("height","800px");
			},error: function() {

			}
		})		
	})
	$("#AddCashToDalin").on("click",function() {
		var params = {
				AuthCode:  $("#AuthCode").val(),
				_csrf: "${_csrf.token}"
			}
		$.ajax({
			url: "/dal/member/payment/contrast",
			method: "post",
			data: params,
			success: function() {
				alert("충전이 완료되었습니다")
				location.href = "/dal/member/payment/store"
			}
		})
	})

	
})	
</script>

</head>
<body>





<div style="width:1000px; height: 800px;" id="pmDiv">
	<div style="margin-left: 235px;margin-top: 70px;" >
		<div>
			<h2 style="font-weight: bold; font-size: 30px;">스토어</h2><br><br>
		</div>
		<div style="background-color: #DDDDDD;, border: 1px solid #DDDDDD; border-radius: 3px; width: 550px; height: 50px;">
			<h4 style="float: left;margin-top: 13px; height: 50px; font-weight: bold;">보유캐쉬</h4><h4 style="float: right;margin-right:20px; margin-top: 13px; height: 50px; font-weight: bold;">${cash}원</h4>
		</div>
		<div style="height: 70px;"></div>
		<hr style="width: 550px;">
		<form id="paymentFrm" action="/dal/member/payment/store" method="post">
		<div style="width: 550px; margin-bottom: 20px;">
			<div><label style="margin-bottom:7px; font-size: large;">10,000</label><div style="float:right;"class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-warning" style=" height: 35px; width: 100px; text-align:center; font-size: medium;color:white;border:1px solid white; border-radius: 10px">10,000원<input type="radio" name="pMoney" value=10000 autocomplete="on" ></label></div></div>
		</div>
		<hr style="width: 550px;">
		<div style="width: 550px;margin-bottom: 20px;">
			<div><label style="margin-bottom:7px; font-size: large;">20,000</label><div style="float:right;"class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-warning" style=" height: 35px; width: 100px; text-align:center; font-size: medium;color:white;border:1px solid white; border-radius: 10px">20,000원<input type="radio" name="pMoney" value=20000 autocomplete="on" ></label></div></div>
		</div>
		<hr style="width: 550px;">
		<div style="width: 550px;margin-bottom: 20px;">
			<div><label style="margin-bottom:7px; font-size: large;">30,000</label><div style="float:right;"class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-warning" style=" height: 35px; width: 100px; text-align:center; font-size: medium;color:white;border:1px solid white; border-radius: 10px">30,000원<input type="radio" name="pMoney" value=30000 autocomplete="on" ></label></div></div>
		</div>
		<hr style="width: 550px;">
		<div style="width: 550px;margin-bottom: 20px;">
			<div><label style="margin-bottom:7px; font-size: large;">50,000</label><div style="float:right;"class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-warning" style=" height: 35px; width: 100px; text-align:center; font-size: medium;color:white;border:1px solid white; border-radius: 10px">50,000원<input type="radio" name="pMoney" value=50000 autocomplete="on" ></label></div></div>
		</div>
		<hr style="width: 550px;">
		<div style="width: 550px;margin-bottom: 20px;">
			<div><label style="margin-bottom:7px; font-size: large;">100,000</label><div style="float:right;"class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-warning" style=" height: 35px; width: 100px; text-align:center; font-size: medium;color:white;border:1px solid white; border-radius: 10px">100,000원<input type="radio" name="pMoney" value=100000 autocomplete="on" ></label></div></div>
		</div>
		<hr style="width: 550px;">
		<div style="width: 550px;margin-bottom: 20px;">
			<div><label style="margin-bottom:7px; font-size: large;">300,000</label><div style="float:right;"class="btn-group btn-group-toggle" data-toggle="buttons"><label class="btn btn-warning" style=" height: 35px; width: 100px; text-align:center; font-size: medium;color:white;border:1px solid white; border-radius: 10px">300,000원<input type="radio" name="pMoney" value=300000 autocomplete="on" ></label></div></div>
		</div>
		<hr style="width: 550px;">
		<div style="margin-left: 225px;">		
			<button type="button" class="btn btn-info" style="width: 100px; height: 50px; font-size: medium;" id="RequestPayment">충전하기</button>
		</div>
		</form>
	</div>
 	<div style="margin-left:235px; margin-top: 30px;">
		<table class="table table-hover" style="width:550px;height: 150px; font-size: medium;">
		<thead>
			<tr>
				<th>충전코드</th>
				<th>충전시간</th>
				<th>환불가능일</th>
				<th>충전금액</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${nowPayment.list}" var="nplist">
			<tr>
				<td>${nplist.PCode}</td>
				<td>${nplist.PDateStr}</td>
				<td>${nplist.PRefundDate}</td>
				<td>${nplist.PMoney}</td>
			</tr>			
		</c:forEach>			
		</tbody>	
		</table>
	<div style="text-align:center;">
		<ul class="pagination">
			<c:if test="${nowPayment.prev==true}">
				<li><a href="/dal/member/payment/store?pageno=${nowPayment.startPage-1}">이전</a></li>
			</c:if>
			<c:forEach begin="${nowPayment.startPage}" end="${nowPayment.endPage}" var="i">
				<c:choose>
					<c:when test="${nowPayment.pageno eq i }">
						<li class="active">
							<a href="/dal/member/payment/store?pageno=${i}">${i}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li><a href="/dal/member/payment/store?pageno=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>
			<c:if test="${nowPayment.next==true}">
				<li><a href="/dal/member/payment/store?pageno=${nowPayment.endPage+1}">다음</a></li>
			</c:if>
		</ul>
	</div>
		
	</div>
</div>

<div id="pnInput" style="display: none;">
	<div style="margin-left: 230px; margin-top: 300px;">
		<div  style="width: 550px;margin-bottom: 20px;">
			<div><label style="margin-bottom:7px; font-size: large;">휴대폰 번호를 입력하세요</label><input type="text" name="dTel" id="dTel" placeholder="휴대폰 번호를 입력하세요" maxlength="11" class="form-control" style="height: 50px; font-size: large;"></div>
		<div style="margin-left: 225px; margin-top: 50px;">		
			<button type="button" class="btn btn-info" style="width: 100px; height: 50px; font-size: medium;" id="nextPage">충전하기</button>
		</div>
		</div>		
	</div>
</div>

	<div id="AuthDiv" style="display: none;">
		<div style="margin-left: 400px; margin-top: 300px;">
			<label style="font-size: large; margin-left: 40px;">인증번호 입력</label>
			<input type="text" id="AuthCode"name="AuthCode" maxlength="6" class="form-control" style="width:200px; height:40px; font-size: medium;" placeholder="인증번호를 입력하세요">
			<button type="button" id="AddCashToDalin" style="width: 70px; height: 40px;font-size:small; margin-left: 65px; margin-top: 30px;" class="btn btn-info">확인</button>
		</div>
	</div>

		
</body>
</html>