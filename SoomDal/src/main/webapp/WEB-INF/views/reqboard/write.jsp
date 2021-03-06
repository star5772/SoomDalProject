<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<script>
$(document).ready(function(){
	$("#write").on("click",function(){
		console.log($("#writeForm").serialize())
		$("#writeForm").submit();
	})
})
$(document).ready(function(){
	$("#write").on("click",function(){
		$("#fieldOrHobby option:checked").text()
		$("#lesson option:checked").text()
		$("#Level option:checked").text()
		$("#Tools option:checked").text()
		$("#LessonTime option:checked").text()
		$("#Age option:checked").text()
		$("#Gender option:checked").text()
		$("#Zone option:checked").text()
		$("#writeForm").submit();
	})
})

</script>
</head>
<body>
	<div id="report">
		<h1 style="font-size: 30px; font-weight: bold; line-height: 1.5em; margin-top: 20px;">요청서</h1>
	</div>
<br>
	<form action="/dal/jeja/reqboard/write" method="post" id="writeForm">
<div >
	<div style="height: 45px;">
		<hr>
			<label for="rbTitle" style="background-color: #d3d3d3; display: inline-block; width: 130px; text-align: center; font-size: 17px;">제목</label>
			<input type="text" id="rbTitle" name="rbTitle" placeholder="제목을 입력해주세요." style="color: rgb(94, 94, 94); width: 920px;font-size: 17px;" ><br><br><br>
	</div>
	<hr>
	<!-- 출력.... -->
	<a style="font-size: 17px;">종목 :</a>
	<select name="fieldOrHobby"  style="width: 150px; height: 30px; font-size: 17px;">
     <option value="">선택</option>
     <optgroup label="스포츠">
        <option value="skateboard">스케이트 보드</option>
        <option value="climming">클라이밍</option>
        <option value="golf">골프</option>
        <option value="bowling">볼링</option>
        <option value="tabletennis">탁구</option>
        <option value="billiards">당구</option>
        <option value="pilates">필라테스</option>
        <option value="squash">스쿼시</option>
        <option value="defense">호신술</option>
     </optgroup>
     <optgroup label="악기">
        <option value="elecguitar">일렉기타</option>
        <option value="piano">피아노</option>
        <option value="drum">드럼</option>
        <option value="baseguitar">베이스</option>
        <option value="violinn">바이올린</option>
        <option value="saxophone">색소폰</option>
        <option value="trumpet">트럼펫</option>
        <option value="flute">플룻</option>
        <option value="cello">첼로</option>
     </optgroup>
       <optgroup label="미술">
        <option value="painting">회화</option>
        <option value="toonart">만화,웹툰,애니</option>
        <option value="childart">아동미술</option>
        <option value="sandart">샌드아트</option>
        <option value="popart">팝아트</option>
        <option value="woodworking">가구,목공예</option>
        <option value="pottery">도예</option>
        <option value="drawing">소묘</option>
        <option value="kelligrapy">켈리그라피</option>
     </optgroup>
</select>
	<br>
	<br>
	<a style="font-size: 17px;">레슨목적 :</a>	
	<select name="lessonPurpose" style="width: 100px; height: 30px; font-size: 17px;"> 
    	<option value="">선택</option>
    	<option value="취미생활">취미생활</option>
    	<option value="자기계발">자기계발</option>
    	<option value="취업목적">취업목적</option>
    	<option value="입시준비">입시준비</option>
    	<option value="지인의 소개">지인의 소개</option>
    	<option value="그냥배우고싶어서">그냥배우고싶어서</option>
	</select>
	<br>
	<br>
	<a style="font-size: 17px;">작성자 수준 : </a>
	<select name="myLevel" style="width: 150px; height: 30px; font-size: 17px;"> 
    	<option value="">선택</option>
    	<option value="난생처음">난생처음</option>
    	<option value="1~2번 해봤다">1~2번 해봤다</option>
    	<option value="5~10번 해봤다">5~10번 해봤다</option>
    	<option value="중간이상은 한다">중간이상은 한다</option>
    	<option value="이것좀 한다는 소리 여러번 들어봤다">이것좀 한다는 소리 여러번 들어봤다</option>
    	<option value="달인만큼해서 도장깨기하러왔다">달인만큼해서 도장깨기하러왔다</option>
	</select>
	<br>
	<br>
	<a style="font-size: 17px;">도구의 유무 : </a>
	<select name="Tools" style="width: 150px; height: 30px; font-size: 17px;"> 
    	<option value="">선택</option>
    	<option value="없음">없음</option>
    	<option value="없지만 구매예정">없지만 구매예정</option>
    	<option value="대여 예정">대여 예정</option>
    	<option value="있음">있음</option>
	</select>
	<br>
	<br>
	<a style="font-size: 17px;">레슨 형태(개인, 그룹) : </a>
	<select name="Lesson" style="width: 150px; height: 30px; font-size: 17px;"> 
    	<option value="">선택</option>
    	<option value="1대1 개인레슨">1대1 개인레슨</option>
    	<option value="2~3인 그룹 레슨">2~3인 그룹 레슨</option>
    	<option value="4~5인 그룹 레슨">4~5인 그룹 레슨</option>
    	<option value="5~10인 그룹 레슨">5~10인 그룹 레슨</option>
    	<option value="20명이상 단체 레슨">20명이상 단체 레슨</option>
	</select>
	<br>
	<br>
	<a style="font-size: 17px;">레슨 시간 : </a>
	<select name="LessonTime" style="width: 150px; height: 30px; font-size: 17px;"> 
    	<option value="">선택</option>
    	<option value="주1회 2~3시간">주1회 2~3시간</option>
    	<option value="주2회 1~2시간">주2회 1~2시간</option>
    	<option value="주3회 1~2시간">주3회 1~2시간</option>
    	<option value="주4회 1~2시간">주4회 1~2시간</option>
    	<option value="시간 협의">시간 협의</option>
	</select>
	<br>
	<br>
	<a style="font-size: 17px;">연령 : </a>
	<select name="Age" style="width: 100px; height: 30px; font-size: 17px;"> 
    	<option value="">선택</option>
    	<option value="10대">10대</option>
    	<option value="20대">20대</option>
    	<option value="30대">30대</option>
    	<option value="40대">40대</option>
    	<option value="50대">50대</option>
    	<option value="60대">60대</option>
	</select>
	<br>
	<br>
	<a style="font-size: 17px;">성별 : </a>
	<select name="Gender" style="width: 100px; height: 30px; font-size: 17px;"> 
    	<option value="">선택</option>
    	<option value="남">남</option>
    	<option value="여">여</option>
	</select>
	<br>
	<br>
	<a style="font-size: 17px;">원하는 지역 : </a>
	<select name="Zone" style="width: 100px; height: 30px; font-size: 17px;"> 
    	<option value="">선택</option>
    	<option value="남동구">남동구</option>
    	<option value="미추홀구">미추홀구</option>
    	<option value="서구">서구</option>
    	<option value="동구">동구</option>
    	<option value="계양구">계양구</option>
    	<option value="연수구">연수구</option>
    	<option value="부평구">부평구</option>
	</select>
	<br>
	<br>
	<a style="font-size: 17px;">기타 문의 및 희망사항 </a>
	<br>
	<br>
	<textarea name="etc"rows="8" cols="100" style="font-size: 17px;" ></textarea>
	</div>
	<hr>
	<input type="hidden" name="_csrf" value="${_csrf.token}">
	<button type="button" id="write" class="btn btn-warning" style="text-align: center; font-size: 15px;border-radius: 4px; font-weight: bold; color: white; float: right; width: 77px;margin-bottom: 20px; margin-top: 10px;" >작성</button>
	<button onclick="location.href='list'" type="button" id="list" class="btn btn-secondary" style="border-radius: 4px; text-align: center; font-size: 15px; font-weight: bold; color: white; float: left; margin-bottom: 20px; margin-top: 10px;" >목록으로</button>
	</form>
</body>

</html>