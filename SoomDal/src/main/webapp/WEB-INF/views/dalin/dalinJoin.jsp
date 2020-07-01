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
			url: "/dal/dalin/check_email",
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
		if( $("#fNo").val() === "sport" ) {
			$("#step-two").attr("style","display:none;");
			$("#step-three-sport").removeAttr("style");
		}else if( $("#fNo").val() === "instrument" ) {
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
	width: 800px;
	height: 500px;
	margin: auto 0;
	top:50%;
	left: 50%;
	margin-left: -450px;
	margin-top: -250px;
	font-size: large; 
	
}
#step-three-instruement {
	position:absolute;
	width: 800px;
	height: 500px;
	margin: auto 0;
	top:50%;
	left: 50%;
	margin-left: -450px;
	margin-top: -250px;
	font-size: large; 
}
#step-three-art {
	position:absolute;
	width: 800px;
	height: 500px;
	margin: auto 0;
	top:50%;
	left: 50%;
	margin-left: -450px;
	margin-top: -250px;
	font-size: medium; 
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
	font-style:inherit;
	color: white;
	text-align: center;
	line-height: 50%;
}
.divService {
	display: inline-block;
	width: 32%;
}
.detail-service-sport {
	width:500px;
	height: 70px; 
	text-align: center; 
	padding-top: 24px;
	border:1px solid black;
	border-radius: 5px; 
	margin-left:150px;
	
}
.radio:checked +label{  
  /* selected styled */
  background-color: #ffc107;
  color: white;
  text-shadow: 1px 1px 3px #8e8e8e;
}
.complete-step-three {
	margin-left: 340px;
	margin-top: 50px;
}
.back-to-step-two {
	margin-left: 148px;
	margin-top: 50px;
}
#service-art{
	width: 600px;
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
			<option value="010">휴대폰 - 010</option>
			<option value="011">휴대폰 - 011</option>
		</select>
		<input type="text" id="tel-two" class="form-control" maxlength="4">
		<input type="text" id="tel-three" class="form-control" maxlength="4">
		<input type="hidden" id="dTel"name="dTel" value="">
	</div>
	<div>
		<label for="Area" style="font-size: medium;" id="area-span">레슨지역</label><br>
		<input type="text" id="sample6_postcode" placeholder="우편번호" class="addr" disabled="disabled">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name="dArea" id="dArea" placeholder="주소" class="addr" readonly="readonly"><br>
		<input type="text" id="detail-address" placeholder="상세주소" class="addr">
	</div>
	<button id="complete-step-one" type="button" class="btn btn-warning" style="margin-left:320px;">다음</button>
</div>	

<div id="step-two" style="display: none;">
	<p style="text-align: center;">달인님의 전문 분야를 선택해주세요</p><br><br><br><br>
	<div id="main-service-sport" class="divService">
		<label style="display: inline; margin-left: 72px;" >스포츠</label><br>
		<a href="#" id="main-sport"><img src="/image/sport.jpg" id="sport"style="width:200px; height: 200px"></a><br>
		<input type="radio" name="radio1" id="sport1"  class="border" value="sport" style="margin-left: 100px;">
		<input type="hidden" name="fNo" id="fNo"value="">
	</div>
	<div id="main-service-instrument"class="divService">
		<label style="display: inline;margin-left: 80px;">악기</label><br>
		<a href="#" id="main-instrument"><img src="/image/music.jpg" id="instrument"style="width:200px; height: 200px" ></a><br>
		<input type="radio" name="radio1" id="instrument1"class="border" value="instrument"style="margin-left: 100px;">
	</div>
	<div id="main-service-art"class="divService">
		<label style="display: inline;margin-left: 80px;">미술</label><br>
		<a href="#" id="main-art"><img src="/image/art.jpg" id="art"style="width:200px; height: 200px" ></a><br>
		<input type="radio" name="radio1" id="art1"class="border"value="art" style="margin-left: 100px;">
	</div>
	<div style="height: 100px; width: 630px; margin-top: 100px;">
		<button id="back-to-step-one" type="button" class="btn btn-warning btn-one" style="margin-left: 50px;">이전</button>
		<button id="complete-step-two" type="button" class="btn btn-warning btn-one" style="float: right; ">다음</button>
	</div>
</div>
	
<div id="step-three-sport"  style="display: none;" class="step-three">
	<p style="text-align: center; font-size: 30px; margin-bottom: 30px;">달인님이 가장 자신있는 스포츠 종목을 선택해주세요!</p>
	<hr>
	<div id="service-sport">
		<input type="radio" name="detailFName" value="골프"id="golf" class="radio" style="display:none;background-color:rgb(234,234,234);"><label for="golf" class="detail-service-sport">골프 레슨</label>
		<input type="radio" name="detailFName" value="당구" class="radio" id="Billiards" style="display:none;background-color:rgb(234,234,234);"><label for="Billiards" class="detail-service-sport ">당구 레슨</label>
		<input type="radio" name="detailFName" value="볼링" class="radio" id="Bowling" style="display:none;background-color:rgb(234,234,234);"><label for="Bowling" class="detail-service-sport ">볼링 레슨</label>
		<input type="radio" name="detailFName" value="스케이트보드" class="radio" id="Skateboard" style="display:none;background-color:rgb(234,234,234);"><label for="Skateboard" class="detail-service-sport">스케이트보드 레슨</label>
		<input type="radio" name="detailFName" value="스쿼시" class="radio" id="Squash" style="display:none;background-color:rgb(234,234,234);"><label for="Squash" class="detail-service-sport ">스쿼시 레슨</label>
		<input type="radio" name="detailFName" value="필라테스"  class="radio"	id="Pilates" style="display:none;background-color:rgb(234,234,234);"><label for="Pilates" class="detail-service-sport">필라테스 레슨</label>
		<input type="radio" name="detailFName" value="호신술" class="radio" id="self-defense" style="display:none;background-color:rgb(234,234,234);"><label for="self-defense" class="detail-service-sport">호신술 레슨</label>
		<input type="radio" name="detailFName" value="탁구"	class="radio" id="Table tennis" style="display:none;background-color:rgb(234,234,234);"><label for="Table tennis" class="detail-service-sport">탁구 레슨</label>
		<input type="radio" name="detailFName" value="클라이밍" class="radio" id="Climbing" style="display:none;background-color:rgb(234,234,234);"><label for="Climbing" class="detail-service-sport">클라이밍 레슨</label>
	</div>
	<button id="back-to-step-two" class="back-to-step-two btn btn-warning" type="button">이전</button>
	<button class="complete-step-three btn btn-warning" type="button" >가입하기</button>
</div>	

<div id="step-three-instruement" style="display: none;" class="step-three">
	<p style="text-align: center; font-size: 30px; margin-bottom: 30px;">달인님이 가장 자신있는 악기를 선택해주세요!</p>
	<hr>
	<div id="service-instruement">
		<input type="radio" name="detailFName" value="피아노" class="radio" id="piano" style="display:none;background-color:rgb(234,234,234);"><label for="piano" class="detail-service-sport">피아노 레슨</label>
		<input type="radio" name="detailFName" value="일렉기타" class="radio" id="ElectricGuitar" style="display:none;background-color:rgb(234,234,234);"><label for="ElectricGuitar" class="detail-service-sport">일렉기타 레슨</label>
		<input type="radio" name="detailFName" value="드럼" class="radio" id="drum" style="display:none;background-color:rgb(234,234,234);"><label for="drum" class="detail-service-sport  ">드럼 레슨</label>
		<input type="radio" name="detailFName" value="베이스" class="radio" id="base" style="display:none;background-color:rgb(234,234,234);"><label for="base" class="detail-service-sport  ">베이스 레슨</label>
		<input type="radio" name="detailFName" value="바이올린" class="radio" id="Violin" style="display:none;background-color:rgb(234,234,234);"><label for="Violin" class="detail-service-sport ">바이올린 레슨</label>
		<input type="radio" name="detailFName" value="색소폰"  class="radio"	id="Saxophone" style="display:none;background-color:rgb(234,234,234);"><label for="Saxophone" class="detail-service-sport ">색소폰 레슨</label>
		<input type="radio" name="detailFName" value="트럼펫" class="radio" id="Trumpet" style="display:none;background-color:rgb(234,234,234);"><label for="Trumpet" class="detail-service-sport ">트럼펫 레슨</label>
		<input type="radio" name="detailFName" value="플룻"	class="radio" id="Flute" style="display:none;background-color:rgb(234,234,234);"><label for="Flute" class="detail-service-sport">플룻 레슨</label>
		<input type="radio" name="detailFName" value="첼로" class="radio" id="Cello" style="display:none;background-color:rgb(234,234,234);"><label for="Cello" class="detail-service-sport">첼로 레슨</label>
	</div>
	<button id="back-to-step-two" class="back-to-step-two btn btn-warning" type="button">이전</button>
	<button class="complete-step-three btn btn-warning" type="button">가입하기</button>
</div>	

<div id="step-three-art"  style="display: none;" class="step-three">
	<p style="text-align: center; font-size: 30px; margin-bottom: 30px;">달인님이 가장 자신있는 장르를 선택해주세요!</p>
	<hr>
	<br>
	<div id="service-art">
		<input type="radio" name="detailFName" value="회화" class="radio" id="painting" style="display:none;  background-color:rgb(234,234,234);"><label for="painting" class="detail-service-sport">회화 레슨</label>
		<input type="radio" name="detailFName" value="만화" class="radio" id="comic" style="display:none; background-color:rgb(234,234,234); "><label for="comic" class="detail-service-sport">만화,웹툰,애니 레슨</label>
		<input type="radio" name="detailFName" value="아동미술" class="radio" id="children's art" style="display:none; background-color:rgb(234,234,234);"><label for="children's art" class="detail-service-sport">아동미술 레슨</label>
		<input type="radio" name="detailFName" value="샌드아트" class="radio" id="sandart" style="display:none;background-color:rgb(234,234,234);"><label for="sandart" class="detail-service-sport ">샌드아트 레슨</label>
		<input type="radio" name="detailFName" value="팝아트" class="radio" id="popart" style="display:none;background-color:rgb(234,234,234);"><label for="popart" class="detail-service-sport  ">팝아트 레슨</label>
		<input type="radio" name="detailFName" value="목공예"  class="radio"	id="woodworking" style="display:none;background-color:rgb(234,234,234);"><label for="woodworking" class="detail-service-sport ">가구,목공예 레슨</label>
		<input type="radio" name="detailFName" value="도예" class="radio" id="Pottery" style="display:none;background-color:rgb(234,234,234);"><label for="Pottery" class="detail-service-sport ">도예 레슨</label>
		<input type="radio" name="detailFName" value="소묘"	class="radio" id="drawingart" style="display:none;background-color:rgb(234,234,234);"><label for="drawingart" class="detail-service-sport ">소묘 레슨</label>
		<input type="radio" name="detailFName" value="켈리그라피" class="radio" id="kelligrapy" style="display:none;background-color:rgb(234,234,234);"><label for="kelligrapy" class="detail-service-sport ">켈리그라피 레슨</label>
	</div>
	<button id="back-to-step-two" class="back-to-step-two btn btn-warning" type="button">이전</button>
	<button class="complete-step-three btn btn-warning" type="button">가입하기</button>
</div>	
</form>	
</body>
</html>