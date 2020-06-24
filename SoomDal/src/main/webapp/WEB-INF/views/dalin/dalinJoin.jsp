<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* 다음 주소 API */
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
/*                     if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    } */
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    /* document.getElementById("sample6_extraAddress").value = extraAddr; */
                
                } else {
                   /*  document.getElementById("sample6_extraAddress").value = ''; */
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("dArea").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detail-address").focus();
            }
        }).open();
    }
</script>
<script>

function check(value, pattern, area, fail_msg) {
	area.text("");
	if(value.length==0) { 
		area.text("필수입력입니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	} else if(pattern.test(value)==false) { 
		area.text(fail_msg).css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true
}

// 아이디 확인
function checkUsername() {
	var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	return check($("#dEmail").val(), pattern, $("#dEmail_msg"), "아이디(이메일)은 최대50자입니다 형식을 확인해주세요")
}

// 이름 확인
function checkIrum() {
	var pattern = /^[가-힣]{2,5}$/;
	return check($("#dName").val(), pattern, $("#dName_msg"), "이름은 한글 2~6자입니다");
}

// 비밀번호 확인
function checkPassword() {
	// 전방탐색 ()는 하나의 조건
	var pattern = /(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$/;
	return check($("#dPassword").val(), pattern, $("#dPassword_msg"), "비밀번호는 영숫자와 특수문자 8~10자입니다")
}

// 비밀번호 일치
function checkPassword2() {
	$("#dPassword2_msg").text("");
	var pwd1 = $("#dPassword").val();
	var pwd2 = $("#dPassword2").val();
	if(pwd1!==pwd2) {
		$("#dPassword2_msg").text("비밀번호가 일치하지 않습니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true;
}

// 전화번호 확인
function checkTel() {
	var tel1 = $("#tel-one").val();
	var tel2 = $("#tel-two").val();
	var tel3 = $("#tel-three").val();
	var $tel = tel1 + tel2 + tel3;
	$("#dTel").val($tel);
	// 전화번호에 -가 있을 수도 없을 수도 있다
	// -를 찾아서 빈문자열로 변경(삭제)
	// 010-1111-2222 -> 01011112222
	// 옵션 g: 정규식은 찾으면 종료. 끝까지 찾아라
	tel = $("#dTel").val();
	var pattern =  /^[0-9]{9,11}$/;
	return check(tel, pattern, $("#dTel_msg"), "휴대폰(전화번호)를 확인해주세요")
}

// ajax로 아이디 사용여부 확인
function ajaxCheckId() {
	$.ajax({
		url: "/dal/dalin/check_email",
		method: "get",
		data : "dEmail=" + $("#dEmail").val(),
		success: function() {
			$.ajax({
				url: "/dal/jeja/check_email",
				method: "get",
				data: "jEmail=" + $("#dEmail").val(),
				success: function() {
					$("#dEmail_msg").text("사용가능한 이메일입니다").css({"color":"green", "font-size":"0.75em"});
				},error: function() {
					$("#dEmail_msg").text("사용중인 이메일입니다").css({"color":"red", "font-size":"0.75em"});
				}
			})
		},error: function() {
			$("#dEmail_msg").text("사용중인 이메일입니다").css({"color":"red", "font-size":"0.75em"});
		}
	});
}


$(function(){
	$("#dEmail").on("blur", function() {
		var result = checkUsername();
		if(result==true)
			ajaxCheckId();
	});

	$("#dName").on("blur", checkIrum);
	$("#dPassword").on("blur", checkPassword);
	$("#dPassword2").on("blur", checkPassword2);
	$("#tel-three").on("blur", checkTel);
	
	$("#complete-step-one").on("click",function(){
		var r1 = checkUsername();
		var r2 = checkPassword();
		var r3 = checkPassword2();
		var r4 = checkTel();
		var r5 = checkIrum();
		var result = r1 && r2 && r3 && r4 && r5;
		if(result===true) {
		$.ajax({
			url: "/dal/dalin/check_id",
			method: "get",
			data : "dEmail=" + $("#dEmail").val(),
			success: function() {
				$.ajax({
					url: "/dal/jeja/check_email",
					method: "get",
					data: "jEmail=" + $("#dEmail").val(),
					success: function() {
						$("#step-one").attr("style","display:none;");
						$("#step-two").removeAttr("style");
					}
				})				
			}
		})
	}
})
	$("#back-to-step-one").on("click",function() {
		$("#step-two").attr("style","display:none;");
		$("#step-one").removeAttr("style");
	})
	
	$("#complete-step-two").on("click",function(){
		if( $("input:radio[name=fNo]:checked").val() === "sport" ) {
			$("#step-two").attr("style","display:none;");
			$("#step-three-sport").removeAttr("style");
		}else if( $("input:radio[name=fNo]:checked").val() === "instrument" ) {
			$("#step-two").attr("style","display:none;");
			$("#step-three-instruement").removeAttr("style");
		}else {
			$("#step-two").attr("style","display:none;");
			$("#step-three-art").removeAttr("style");
		}
	})
	$(".back-to-step-two").on("click",function(){
		$(".step-three").attr("style","display:none;");
		$("#step-two").removeAttr("style");
	})
	$(".complete-step-three").on("click",function() {
		$("#dalinJoinFrm").submit();
	})
})
</script>
<script>
$(function() {
	
  	$("#main-sport").on("click",function(){
  		$(".border").attr("checked",false);
		$("#sport1").attr("checked",true);
		$("#fNo").val("sport");
	})
	$("#main-art").on("click",function(){
		$(".border").attr("checked",false);
		$("#art1").attr("checked",true);
		$("#fNo").val("art");
	})
	$("#main-instrument").on("click",function(){
		$(".border").attr("checked",false);
		$("#instrument1").attr("checked",true);
		$("#fNo").val("instrument");
	})
})
</script>

<style>
#step-one {
	position:absolute;
	width: 700px;
	height: 500px;
	margin: auto 0;
	top:50%;
	left: 50%;
	margin-left: -250px;
	margin-top: -250px;
	font-size: large; 
}
#step-one .input {
	width: 400px;
	height: 40px;	
	font-size: large; 
	margin-bottom: 10px;
}
.addr {
	width: 200px;
	height: 40px;
	font-size: large; 
}
#detail-address {
	width: 400px;
	height: 40px;
	font-size: large; 
}
#step-two {
	position:absolute;
	width: 700px;
	height: 500px;
	margin: auto 0;
	top:50%;
	left: 50%;
	margin-left: -350px;
	margin-top: -250px;
	font-size: large; 
}
#tel-one {
	display: inline-block;
	width:140px;
	height: 40px;
	font-size: large; 
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
#step-three-sport {
	position:absolute;
	width: 700px;
	height: 500px;
	margin: auto 0;
	top:50%;
	left: 50%;
	margin-left: -250px;
	margin-top: -250px;
	font-size: large; 
}
#step-three-instrument {
	position:absolute;
	width: 700px;
	height: 500px;
	margin: auto 0;
	top:50%;
	left: 50%;
	margin-left: -250px;
	margin-top: -250px;
	font-size: large; 
}
#step-three-art {
	position:absolute;
	width: 700px;
	height: 500px;
	margin: auto 0;
	top:50%;
	left: 50%;
	margin-left: -250px;
	margin-top: -250px;
	font-size: large; 
}
#sample6_postcode {
	margin-bottom: 5px;
}
#dArea {
	margin-bottom: 5px;
}
#detail-address {
	margin-bottom: 5px;
}
#area-span {
	margin-top: 10px;
}
.btn {
	width: 80px;
	height: 30px;
	font-size: medium;
	font-weight: bold;
	font-style:oblique;
	text-align: center;
	line-height: 50%;
}
.divService {
	display: inline-block;
	width: 32%;
}

</style>
</head>
<body>
<form id="dalinJoinFrm" action="/dal/dalin/join" method="post">
<div id="step-one" >	
	<div>
		<label for="dEmail" style="font-size: medium;">아이디(이메일) 입력</label>
		<input type="text" name="dEmail" id="dEmail" placeholder="사용하실 이메일을 입력해주세요" maxlength="50" class="form-control input">
		<span id="dEmail_msg"></span>
	</div>
	<div>
		<label for="dPassword" style="font-size: medium;">비밀번호 입력</label>
		<input type="password" name="dPassword" id="dPassword" placeholder="사용하실 비밀번호를 입력하세요" maxlength="10" class="form-control input">
		<span id="dPassword_msg"></span>
	</div>
	<div>
		<label for="dPassword2" style="font-size: medium;">비밀번호 확인</label>
		<input type="password" id="dPassword2" placeholder="비밀번호를 확인해주세요" maxlength="10" class="form-control input">
		<span id="dPassword2_msg"></span>
	</div>	
	<div>
		<label for="dName" style="font-size: medium;">이름 입력</label>
		<input type="text" name="dName" id="dName" placeholder="이름을 입력해주세요" maxlength="6" class="form-control input">
		<span id="dName_msg"></span>
	</div>
	<div>
		<label for="tel" style="font-size: medium;">연락처</label><br>
		<select id="tel-one" class="form-control">
			<option value="02">서울 - 02 </option>
			<option value="031">경기 - 031</option>
			<option value="032">인천 - 032</option>
			<option value="033">강원 - 033</option>
			<option value="041">충남 - 041</option>
			<option value="042">대전 - 042</option>
			<option value="043">충북 - 043</option>
			<option value="044">세종 - 044</option>
			<option value="051">부산 - 051</option>
			<option value="052">울산 - 052</option>
			<option value="053">대구 - 053</option>
			<option value="054">경북 - 054</option>
			<option value="055">경남 - 055</option>
			<option value="061">전남 - 061</option>
			<option value="062">광주 - 062</option>
			<option value="063">전북 - 063</option>
			<option value="064">제주 - 064</option>
			<option value="010">휴대폰 - 010</option>
		</select>
		<input type="text" id="tel-two" class="form-control" maxlength="4">
		<input type="text" id="tel-three" class="form-control" maxlength="4">
		<input type="hidden" id="dTel"name="dTel" value="">
	</div>
	<div>
		<label for="Area" style="font-size: medium;" id="area-span">레슨지역</label><br>
		<input type="text" id="sample6_postcode" placeholder="우편번호" class="addr">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="dArea" id="dArea" placeholder="주소" class="addr"><br>
		<input type="text" id="detail-address" placeholder="상세주소" class="addr">
	</div>
	<button id="complete-step-one" type="button" class="btn btn-warning" style="margin-left:320px;">다음</button>
</div>	

<div id="step-two" style="display: none;">
	<p style="text-align: center;">달인님의 전문 분야를 선택해주세요</p><br><br><br><br>
	<div id="main-service-sport" class="divService">
		<label style="display: inline; margin-left: 72px;" >스포츠</label><br>
		<a href="#" id="main-sport"><img src="/image/sport.jpg" id="sport"style="width:200px; height: 200px"></a><br>
		<input type="radio" name="radio1" id="sport1"  class="border" style="margin-left: 100px;">
		<input type="hidden" name="fNo" id="fNo"value="">
	</div>
	<div id="main-service-instrument"class="divService">
		<label style="display: inline;margin-left: 80px;">악기</label><br>
		<a href="#" id="main-art"><img src="/image/music.jpg" id="instrument"style="width:200px; height: 200px" ></a><br>
		<input type="radio" name="radio1" id="art1"class="border" style="margin-left: 100px;">
	</div>
	<div id="main-service-art"class="divService">
		<label style="display: inline;margin-left: 80px;">미술</label><br>
		<a href="#" id="main-instrument"><img src="/image/art.jpg" id="art"style="width:200px; height: 200px" ></a><br>
		<input type="radio" name="radio1" id="instrument1"class="border" style="margin-left: 100px;">
	</div>
	<div style="height: 100px; width: 630px; margin-top: 100px;">
		<button id="back-to-step-one" type="button" class="btn btn-danger btn-one" style="margin-left: 50px;">이전</button>
		<button id="complete-step-two" type="button" class="btn btn-warning btn-one" style="float: right; ">다음</button>
	</div>
</div>
	
<div id="step-three-sport" style="display: none;"class="step-three">
	<p>달인님이 가장 자신있는 스포츠 종목을 선택해주세요</p>
	<div id="service-sport">
		종목1<input type="radio" name="dMainService" value="스포츠1" id="dMainService">
		종목1<input type="radio" name="dMainService" value="스포츠2"	id="dMainService">
		종목1<input type="radio" name="dMainService" value="스포츠3"	id="dMainService"><br>
		종목1<input type="radio" name="dMainService" value="스포츠4"	id="dMainService">
		종목1<input type="radio" name="dMainService" value="스포츠5"	id="dMainService">
		종목1<input type="radio" name="dMainService" value="스포츠6"	id="dMainService"><br>
		종목1<input type="radio" name="dMainService" value="스포츠7"	id="dMainService">
		종목1<input type="radio" name="dMainService" value="스포츠8"	id="dMainService">
		종목1<input type="radio" name="dMainService" value="스포츠9"	id="dMainService">
	</div>
	<button id="back-to-step-two" class="back-to-step-two btn btn-danger" type="button">이전</button>
	<button class="complete-step-three btn btn-warning" type="button" >가입하기</button>
</div>	

<div id="step-three-instruement" style="display: none;"class="step-three">
	<p>달인님이 가장 자신있는 악기를 선택해주세요</p>
	<div id="service-instruement">
		종목1<input type="radio" name="dMainService" value="악기1"id="dMainService">
		종목1<input type="radio" name="dMainService" value="악기2"id="dMainService">
		종목1<input type="radio" name="dMainService" value="악기3"id="dMainService"><br>
		종목1<input type="radio" name="dMainService" value="악기4"id="dMainService">
		종목1<input type="radio" name="dMainService" value="악기5"id="dMainService">
		종목1<input type="radio" name="dMainService" value="악기6"id="dMainService"><br>
		종목1<input type="radio" name="dMainService" value="악기7"id="dMainService">
		종목1<input type="radio" name="dMainService" value="악기8"id="dMainService">
		종목1<input type="radio" name="dMainService" value="악기9"id="dMainService">
	</div>
	<button id="back-to-step-two" class="back-to-step-two btn btn-danger" type="button">이전</button>
	<button class="complete-step-three btn btn-warning" type="button">가입하기</button>
</div>	

<div id="step-three-art" style="display: none;" class="step-three">
	<p>달인님이 가장 자신있는 장르를 선택해주세요</p>
	<div id="service-art">
		종목1<input type="radio" name="dMainService" value="미술1"id="dMainService">
		종목1<input type="radio" name="dMainService" value="미술2"id="dMainService">
		종목1<input type="radio" name="dMainService" value="미술3"id="dMainService"><br>
		종목1<input type="radio" name="dMainService" value="미술4"id="dMainService">
		종목1<input type="radio" name="dMainService" value="미술5"id="dMainService">
		종목1<input type="radio" name="dMainService" value="미술6"id="dMainService"><br>
		종목1<input type="radio" name="dMainService" value="미술7"id="dMainService">
		종목1<input type="radio" name="dMainService" value="미술8"id="dMainService">
		종목1<input type="radio" name="dMainService" value="미술9"id="dMainService">
	</div>
	<button id="back-to-step-two" class="back-to-step-two btn btn-danger" type="button">이전</button>
	<button class="complete-step-three btn btn-warning" type="button">가입하기</button>
</div>	
</form>	
</body>
</html>