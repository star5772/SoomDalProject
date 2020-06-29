<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>
function inputTel() {
	var tel1 = $("#tel-one").val();
	var tel2 = $("#tel-two").val();
	var tel3 = $("#tel-three").val();
	var $tel = tel1 + tel2 + tel3;
	$("#dTel").val($tel);
}
$(function(){
	$("#tel-one").on("change",inputTel)
	$("#tel-two").on("blur",inputTel)
	$("#tel-three").on("blur",inputTel);

	$("#find").on("click",function(){
		var formData = $("#findIdFrm").serialize();
		$.ajax({
			url: "/dal/member/dalin/find_id",
			data: formData,
			method: "post",
			success: function(result) {
				$("#div").css("display","none");
				$("#FindId_msg").text("회원님의 아이디는" + result + "입니다");
			}
		})
	})
})
</script>
<style type="text/css">
#tel-one {
	display: inline-block;
	width:140px;
	height: 40px;
	font-size: medium; 
}
#tel-two {
	display: inline-block;
	width:125px;
	height: 40px;
	font-size: large; 
}
#tel-three {
	display: inline-block;
	width:125px;
	height: 40px;
	font-size: large; 
}
</style>
</head>
<body>
<div style="width: 800px; height: 500px;">
	<img alt="" src="/image/MainLogo.png">
	<h2 style="text-align: center;">달인 아이디찾기</h2>
	<span id="FindId_msg"></span>
	<div id="div" style="margin-left:190px;">
		<form id="findIdFrm">
			<label for="dTel" style="font-size: medium;">연락처</label><br>
			<select id="tel-one" class="form-control">
				<option value="010">휴대폰 - 010</option>
				<option value="011">휴대폰 - 011</option>
			</select>
			<input type="text" id="tel-two" class="form-control" maxlength="4"> - 
			<input type="text" id="tel-three" class="form-control" maxlength="4">
			<input type="hidden" id="dTel"name="dTel" value="">
			<br>
			<label for="dName" style="font-size: medium;">이름</label>
			<input type="text" name="dName" placeholder="가입시 입력했던 이름을 입력해주세요" class="form-control" style="width: 407px;font-size: medium;">
			<br><br>
			<button type="button" id="find" class="btn btn-success">찾기</button>
		</form>
	</div>
</div>
	
</body>
</html>