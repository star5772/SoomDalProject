<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
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
function inputTel1() {
	var tel1 = $("#jtel-one").val();
	var tel2 = $("#jtel-two").val();
	var tel3 = $("#jtel-three").val();
	var $tel = tel1 + tel2 + tel3;
	$("#jTel").val($tel);
}
$(function(){
	$("#tel-one").on("change",inputTel)
	$("#tel-two").on("blur",inputTel)
	$("#tel-three").on("blur",inputTel);
	$("#jtel-one").on("change",inputTel1)
	$("#jtel-two").on("blur",inputTel1)
	$("#jtel-three").on("blur",inputTel1);

	$("#findDalin").on("click",function(){
		var formData = $("#findDalinFrm").serialize();
		$.ajax({
			url: "/dal/member/dalin/find_id",
			data: formData,
			method: "post",
			success: function(result) {
				$("#div").css("display","none");
				$("#FindDalinId_msg").text("회원님의 아이디는" + result + "입니다");
			}
		})
	})
	$("#findJeja").on("click",function() {
		var formData = $("#findJejaFrm").serialize();
		$.ajax({
			url: "/dal/member/jeja/find_id",
			data: formData,
			method: "post",
			success: function(result) {
				$("#div").css("display","none");
				$("#div2").css("display","none");
				$("#FindJejaId_msg").text("회원님의 아이디는" + result + "입니다");
			}
		})
	})
})
</script>
<style type="text/css">
#tel-one,#jtel-one {
	display: inline-block;
	width:80px;
	height: 30px;
	font-size: small; 
}
#tel-two,#jtel-two {
	display: inline-block;
	width:80px;
	height: 30px;
	font-size: small; 
}
#tel-three,#jtel-three {
	display: inline-block;
	width:80px;
	height: 30px;
	font-size: small; 
}
</style>
</head>
<body>
<div>
	<img alt="" src="/image/MainLogo.png">
		<div style="width: 300px; height: 300px; float:left; display: inline-block; margin-left: 20px;">
			<h3 style="text-align: center; font-weight: bold; ">DALIN 아이디 찾기</h3>
			<span id="FindDalinId_msg"></span>
			<div id="div" style="border: 1px solid #DDDDDD; padding: 5px 5px 5px 5px; margin-top: 30px;">
				<form id="findDalinFrm" style="margin-left: 10px;">
					<label for="dTel" style="font-size: medium;">연락처</label><br>
					<select id="tel-one" class="form-control">
						<option value="010">010</option>
						<option value="011">011</option>
					</select> - 
					<input type="text" id="tel-two" class="form-control" maxlength="4"> - 
					<input type="text" id="tel-three" class="form-control" maxlength="4">
					<input type="hidden" id="dTel"name="dTel" value="">
					<br>
					<label for="dName" style="font-size: medium; margin-top: 10px;">이름</label>
					<input type="text" name="dName" placeholder="가입시 입력했던 이름을 입력해주세요" class="form-control" style="width: 150px;font-size: small;">
					<br><br>
					<button type="button" id="findDalin" class="btn btn-success" style=" margin-left:120px; margin-top: 20px;">찾기</button>
				</form>
			</div>
		</div>
		<div style="width: 300px; height: 300px; margin-right:20px; float:right; display: inline-block; ">
			<h3 style="text-align: center; font-weight: bold;">JEJA 아이디 찾기</h3>
			<span id="FindJejaId_msg" style="margin-left: 20px;"></span>
			<div id="div2"style="border: 1px solid #DDDDDD; padding: 5px 5px 5px 5px;">
				<form id="findJejaFrm" style="margin-left: 10px;">
					<label for="jTel" style="font-size: medium;">연락처</label><br>
					<select id="jtel-one" class="form-control">
						<option value="010">010</option>
						<option value="011">011</option>
					</select> - 
					<input type="text" id="jtel-two" class="form-control" maxlength="4"> - 
					<input type="text" id="jtel-three" class="form-control" maxlength="4">
					<input type="hidden" id="jTel"name="jTel" value="">
					<br>
					<label for="jName" style="font-size: medium; margin-top: 10px;">이름</label>
					<input type="text" name="jName" placeholder="가입시 입력했던 이름을 입력해주세요" class="form-control" style="width: 150px;font-size: small;">
					<br><br>
					<button type="button" id="findJeja" class="btn btn-success" style=" margin-left:120px; margin-top: 20px;">찾기</button>
				</form>
			</div>
		</div>
</div>	
</body>
</html>