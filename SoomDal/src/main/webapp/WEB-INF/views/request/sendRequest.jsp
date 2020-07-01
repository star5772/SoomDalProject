<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$("#next1").on("click",function(){
		$("#step-one").css("display","none");
		$("#step-two").removeAttr("style");
	})
	$("#next2").on("click",function(){
		$("#step-two").css("display","none");
		$("#step-three").removeAttr("style");
	})
	$("#next3").on("click",function(){
		$("#step-three").css("display","none");
		$("#step-four").removeAttr("style");
	})
	$("#next4").on("click",function(){
		$("#step-four").css("display","none");
		$("#step-five").removeAttr("style");
	})
	$("#next5").on("click",function(){
		$("#step-five").css("display","none");
		$("#step-six").removeAttr("style");
	})
	$("#next6").on("click",function(){
		$("#step-six").css("display","none");
		$("#step-seven").removeAttr("style");
	})
	$("#next7").on("click",function(){
		$("#step-seven").css("display","none");
		$("#step-eight").removeAttr("style");
	})
	$("#next8").on("click",function(){
		$("#step-eight").css("display","none");
		$("#step-nine").removeAttr("style");
	})
	$("#next9").on("click",function(){
		$("#step-nine").css("display","none");
		$("#step-ten").removeAttr("style");
	})
	$("#next10").on("click",function(){
		$("#reqFrm").submit();
	})	
	$("#prev1").on("click",function(){
		$("#step-two").css("display","none");
		$("#step-one").removeAttr("style");
	})
	$("#prev2").on("click",function(){
		$("#step-three").css("display","none");
		$("#step-two").removeAttr("style");
	})								
	$("#prev3").on("click",function(){
		$("#step-four").css("display","none");
		$("#step-three").removeAttr("style");
	})								
	$("#prev4").on("click",function(){
		$("#step-five").css("display","none");
		$("#step-four").removeAttr("style");
	})								
	$("#prev5").on("click",function(){
		$("#step-six").css("display","none");
		$("#step-five").removeAttr("style");
	})								
	$("#prev6").on("click",function(){
		$("#step-seven").css("display","none");
		$("#step-six").removeAttr("style");
	})								
	$("#prev7").on("click",function(){
		$("#step-eight").css("display","none");
		$("#step-seven").removeAttr("style");
	})								
	$("#prev8").on("click",function(){
		$("#step-nine").css("display","none");
		$("#step-eight").removeAttr("style");
	})								
	$("#prev9").on("click",function(){
		$("#step-ten").css("display","none");
		$("#step-nine").removeAttr("style");
	})								
									
})	
</script>
<style>
.request {
	width: 700px;
	height: 600px;
	padding: 50px 50px 50px 60px;
}
.request .req {
	width:500px;
	margin-left:90px;
	height:60px;
	font-size: large;
	padding-top: 15px;
	margin-top: 5px;
}
#date {
	width: 300px;
	height: 60px;
	font-size: medium;
	margin: 150px 180px 150px 180px;
	background-color: #DDDDDD;
}
#totalDiv {
	width: 800px;
	height: 700px;
	border: 1px solid #DDDDDD;
	margin: 150px 150px 150px 130px;
}
.com {
	margin-top: 100px;
	width :100px;
	height: 40px;
	font-size: medium;
	float: right;
}
.back {
	margin-top: 100px;
	margin-left: 90px; 
	width :100px;
	height: 40px;
	font-size: medium;
	float: left;
}
</style>
</head>
<body>

	<div id="totalDiv">
		<div>
			<h1 style="text-align: center; margin-top: 15px;">요청서</h1>
		</div>
	
	<form id="reqFrm" action="/dal/member/request/sendRequest" method="post">
		<div id="step-one"  style="" class="request">
			<p style="text-align: center; margin-left: 80px; font-size: 30px;">1단계: 레슨의 목적</p>
			<div id="step-one-rLessonPurpose">
				<input type="radio" name="rLessonPurpose" value="취미생활" class="radio" id="a1" style="display:none;"><label for="a1" class="req request-step-one btn btn-success">취미생활</label>
				<input type="radio" name="rLessonPurpose" value="자기계발" class="radio" id="a2" style="display:none;"><label for="a2" class="req request-step-one btn btn-success">자기계발</label>
				<input type="radio" name="rLessonPurpose" value="취업목적" class="radio" id="a3" style="display:none;"><label for="a3" class="req request-step-one btn btn-success">취업목적</label>
				<input type="radio" name="rLessonPurpose" value="입시준비" class="radio" id="a4" style="display:none;"><label for="a4" class="req request-step-one btn btn-success">입시준비</label>
				<input type="radio" name="rLessonPurpose" value="지인의소개" class="radio" id="a5" style="display:none;"><label for="a5" class="req request-step-one btn btn-success">지인의소개</label>
				<input type="radio" name="rLessonPurpose" value="그냥배우고싶어서" class="radio" id="a6" style="display:none;"><label for="a6" class="req request-step-one btn btn-success">그냥배우고싶어서</label>
			</div>
			<button class="com complete-step-one btn btn-warning" id="next1" type="button" >다음 단계</button>
		</div>
		
		<div id="step-two"  style="display:none;" class="request">
			<p style="text-align: center; margin-left: 80px; font-size: 30px;">2단계: 본인의 수준</p>
			<div id="step-two-rYourLevel">
				<input type="radio" name="rYourLevel" value="난생처음" class="radio" id="b1" style="display:none;"><label for="b1" 					class="req request-step-two btn btn-success">난생처음</label>
				<input type="radio" name="rYourLevel" value="1~2번 해봤다" class="radio" id="b2" style="display:none;"><label for="b2" 					class="req request-step-two btn btn-success">1~2번 해봤다</label>
				<input type="radio" name="rYourLevel" value="5~10번 해봤다" class="radio" id="b3" style="display:none;"><label for="b3" 				class="req request-step-two btn btn-success">5~10번 해봤다</label>
				<input type="radio" name="rYourLevel" value="중간이상은 한다" class="radio" id="b4" style="display:none;"><label for="b4" 				class="req request-step-two btn btn-success">중간이상은 한다</label>
				<input type="radio" name="rYourLevel" value="이것좀 한다는 소리 여러번 들어봤다" class="radio" id="b5" style="display:none;"><label for="b5" 	class="req request-step-two btn btn-success">이것좀 한다는 소리 여러번 들어봤다</label>
				<input type="radio" name="rYourLevel" value="달인만큼해서 도장깨기하러왔다" class="radio" id="b6" style="display:none;"><label for="b6" 		class="req request-step-two btn btn-success">달인만큼해서 도장깨기하러왔다</label>
			</div>
			<button class="back back-to-one btn btn-danger" id="prev1"type="button">이전 단계</button>
			<button class="com complete-step-two btn btn-warning" id="next2" type="button" >다음 단계</button>
		</div>		
		
		<div id="step-three"  style="display:none" class="request">
			<p style="text-align: center; margin-left: 80px; font-size: 30px;">3단계: 레슨 형태</p>
			<div id="step-three-rLessonType">
				<input type="radio" name="rLessonType" value="1대1 개인레슨" class="radio" id="c1" style="display:none;"><label for="c1" 		class="req request-step-two btn btn-success">1대1 개인레슨</label>
				<input type="radio" name="rLessonType" value="2~3인 그룹 레슨" class="radio" id="c2" style="display:none;"><label for="c2" 		class="req request-step-two btn btn-success">2~3인 그룹 레슨</label>
				<input type="radio" name="rLessonType" value="4~5인 그룹 레슨" class="radio" id="c3" style="display:none;"><label for="c3" 		class="req request-step-two btn btn-success">4~5인 그룹 레슨</label>
				<input type="radio" name="rLessonType" value="5~10인 그룹 레슨" class="radio" id="c4" style="display:none;"><label for="c4" 		class="req request-step-two btn btn-success">5~10인 그룹 레슨</label>
				<input type="radio" name="rLessonType" value="20명이상 단체 레슨" class="radio" id="c5" style="display:none;"><label for="c5" 	class="req request-step-two btn btn-success">20명이상 단체 레슨</label>
			</div>
			<button class="back back-to-prev-page btn btn-danger"id="prev2" type="button">이전 단계</button>
			<button class="com complete-step-one btn btn-warning"id="next3" type="button" >다음 단계</button>
		</div>	
		
		<div id="step-four"  style="display:none" class="request">
			<p style="text-align: center; margin-left: 80px; font-size: 30px;">4단계: 레슨 시작일</p>
			<div id="step-four-rWantDate">
				<input type="date" name="rWantDate" id="date">
			</div>
			<button class="back back-to-prev-page btn btn-danger"id="prev3" type="button">이전 단계</button>
			<button class="com complete-step-one btn btn-warning"id="next4" type="button" >다음 단계</button>
		</div>
		
		<div id="step-five"  style="display:none" class="request">
			<p style="text-align: center; margin-left: 80px; font-size: 30px;">5단계: 레슨 시간</p>
			<div id="step-five-rWantTime">
				<input type="radio" name="rWantTime" value="주1회 2~3시간" class="radio" id="e1" style="display:none;"><label for="e1" 		class="req request-step-two btn btn-success">주1회 2~3시간</label>
				<input type="radio" name="rWantTime" value="주2회 1~2시간" class="radio" id="e2" style="display:none;"><label for="e2" 		class="req request-step-two btn btn-success">주2회 1~2시간</label>
				<input type="radio" name="rWantTime" value="주3회 1~2시간" class="radio" id="e3" style="display:none;"><label for="e3" 		class="req request-step-two btn btn-success">주3회 1~2시간</label>
				<input type="radio" name="rWantTime" value="주4회 1~2시간" class="radio" id="e4" style="display:none;"><label for="e4" 		class="req request-step-two btn btn-success">주4회 1~2시간</label>
				<input type="radio" name="rWantTime" value="시간 협의" class="radio" id="e5" style="display:none;"><label for="e5" 			class="req request-step-two btn btn-success">시간 협의</label>
			</div>
			<button class="back back-to-prev-page btn btn-danger"id="prev4" type="button">이전 단계</button>
			<button class="com complete-step-one btn btn-warning"id="next5" type="button" >다음 단계</button>
		</div>	
								
		<div id="step-six"  style="display: none;" class="request">
			<p style="text-align: center; margin-left: 80px; font-size: 30px;">6단계: 장비 유무</p>
			<div id="step-six-rItemExists">
				<input type="radio" name="rItemExists" value="없음" class="radio" id="f1" style="display:none;"><label for="f1" 		class="req request-step-two btn btn-success">없음</label>
				<input type="radio" name="rItemExists" value="없지만 구매예정" class="radio" id="f2" style="display:none;"><label for="f2" 		class="req request-step-two btn btn-success">없지만 구매예정</label>
				<input type="radio" name="rItemExists" value="대여 예정" class="radio" id="f3" style="display:none;"><label for="f3" 		class="req request-step-two btn btn-success">대여 예정</label>
				<input type="radio" name="rItemExists" value="있음" class="radio" id="f4" style="display:none;"><label for="f4" 		class="req request-step-two btn btn-success">있음</label>
			</div>
			<button class="back back-to-prev-page btn btn-danger"id="prev5" type="button">이전 단계</button>
			<button class="com complete-step-one btn btn-warning"id="next6" type="button" >다음 단계</button>
		</div>
		
		<div id="step-seven"  style="display: none;" class="request">
			<p style="text-align: center; margin-left: 80px; font-size: 30px;">7단계: 연령대</p>
			<div id="step-seven-rAge">
				<input type="radio" name="rAge" value="10대" class="radio" id="g1" style="display:none;"><label for="g1" class="req request-step-two btn btn-success">10대</label>
				<input type="radio" name="rAge" value="20대" class="radio" id="g2" style="display:none;"><label for="g2" class="req request-step-two btn btn-success">20대</label>
				<input type="radio" name="rAge" value="30대" class="radio" id="g3" style="display:none;"><label for="g3" class="req request-step-two btn btn-success">30대</label>
				<input type="radio" name="rAge" value="40대" class="radio" id="g4" style="display:none;"><label for="g4" class="req request-step-two btn btn-success">40대</label>
				<input type="radio" name="rAge" value="50대" class="radio" id="g4" style="display:none;"><label for="g4" class="req request-step-two btn btn-success">50대</label>
				<input type="radio" name="rAge" value="60대" class="radio" id="g4" style="display:none;"><label for="g4" class="req request-step-two btn btn-success">60대</label>
			</div>
			<button class="back back-to-prev-page btn btn-danger"id="prev6" type="button">이전 단계</button>
			<button class="com complete-step-one btn btn-warning"id="next7" type="button" >다음 단계</button>
		</div>

		<div id="step-eight"  style="display: none;" class="request">
			<p style="text-align: center; margin-left: 80px; font-size: 30px;">8단계: 성별</p>
			<div id="step-eight-rGender">
				<input type="radio" name="rGender" value="10대" class="radio" id="h1" style="display:none;"><label for="h1" class="req request-step-two btn btn-success" style="margin-top:150px;">남자</label>
				<input type="radio" name="rGender" value="20대" class="radio" id="h2" style="display:none;"><label for="h2" class="req request-step-two btn btn-success" >여자</label>
			</div>
			<button class="back back-to-prev-page btn btn-danger"id="prev7" type="button" >이전 단계</button>
			<button class="com complete-step-one btn btn-warning"id="next8" type="button" >다음 단계</button>
		</div>
		
		<div id="step-nine"  style="display:none;" class="request">
			<p style="text-align: center; margin-left: 80px; font-size: 30px;">9단계: 원하는점</p>
			<div id="step-nine-rWannable">
				<textarea rows="15" cols="80" name="rWannable" style="margin-left:40px;margin-top: 50px; overflow: " class="form-control"></textarea>
			</div>
			<button class="back back-to-prev-page btn btn-danger"id="prev8" type="button" >이전 단계</button>
			<button class="com complete-step-one btn btn-warning"id="next9" type="button" >다음 단계</button>
		</div>						

		<div id="step-ten"  style="display: none" class="request">
			<p style="text-align: center; margin-left: 80px; font-size: 30px;">10단계: 레슨지역</p>
			<div id="step-ten-rWantArea">
				<input type="radio" name="rWantArea" value="남동구" class="radio" id="i1" style="display:none;"><label for="i1" class="req request-step-two btn btn-success" >남동구</label>
				<input type="radio" name="rWantArea" value="미추홀구" class="radio" id="i3" style="display:none;"><label for="i3" class="req request-step-two btn btn-success" >미추홀구</label>
				<input type="radio" name="rWantArea" value="서구" class="radio" id="i4" style="display:none;"><label for="i4" class="req request-step-two btn btn-success" >서구</label>
				<input type="radio" name="rWantArea" value="동구" class="radio" id="i5" style="display:none;"><label for="i5" class="req request-step-two btn btn-success" >동구</label>
				<input type="radio" name="rWantArea" value="계양구" class="radio" id="i6" style="display:none;"><label for="i6" class="req request-step-two btn btn-success" >계양구</label>
				<input type="radio" name="rWantArea" value="연수구" class="radio" id="i7" style="display:none;"><label for="i7" class="req request-step-two btn btn-success" >연수구</label>
				<input type="radio" name="rWantArea" value="부평구" class="radio" id="i8" style="display:none;"><label for="i8" class="req request-step-two btn btn-success" >부평구</label>
			</div>
			<button class="back back-to-prev-page btn btn-danger"id="prev9" type="button" >이전 단계</button>
			<button class="com complete-step-one btn btn-warning"id="next10" type="button" >다음 단계</button>
		</div>
	</form>							
</div>
	
</body>
</html>