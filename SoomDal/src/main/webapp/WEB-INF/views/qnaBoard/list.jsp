<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<script>
$(function(){
	$("#AQNA").on("click",function(){
		$("#QNAtop").removeAttr("style");
		$("#QNAboard").removeAttr("style");
		$("#FAQtop").css("display","none");
		$("#dGUIDEtop").css("display","none");
		$("#jGUIDEtop").css("display","none");
		$("#FAQboard").css("display","none");
		$("#dGUIDEboard").css("display","none");
		$("#jGUIDEboard").css("display","none");
	})
	$("#FAQ").on("click",function(){
		$("#FAQtop").removeAttr("style");
		$("#FAQboard").removeAttr("style");
		$("#QNAtop").css("display","none");
		$("#dGUIDEtop").css("display","none");
		$("#jGUIDEtop").css("display","none");
		$("#QNAboard").css("display","none");
		$("#dGUIDEboard").css("display","none");
		$("#jGUIDEboard").css("display","none");
	})
	$("#jGUIDE").on("click",function(){
		$("#jGUIDEtop").removeAttr("style");
		$("#jGUIDEboard").removeAttr("style");
		$("#QNAtop").css("display","none");
		$("#dGUIDEtop").css("display","none");
		$("#FAQtop").css("display","none");
		$("#QNAboard").css("display","none");
		$("#dGUIDEboard").css("display","none");
		$("#FAQboard").css("display","none");
	})
	$("#dGUIDE").on("click",function(){
		$("#dGUIDEtop").removeAttr("style");
		$("#dGUIDEboard").removeAttr("style");
		$("#QNAtop").css("display","none");
		$("#jGUIDEtop").css("display","none");
		$("#FAQtop").css("display","none");
		$("#QNAboard").css("display","none");
		$("#jGUIDEboard").css("display","none");
		$("#FAQboard").css("display","none");
	})
})
</script>
<style> 
#center{margin-left: 20px; display: inline-block; }
.num{
margin-left: 20px; 
}
.subject{
  margin-left: 20px; 
}
.wrtier{
margin-left: 20px; 
}
.date{
 margin-left: 20px; margin-right: 20px;
}
#list{
height: 30px; margin-left: 20px; width: 1024px;  text-align: center; 
}
	.table {
		text-align: center;
	}
	#page_wrap {
      position: relative;
      width: 1075px;
      height: 60px;
   }
   #inner {
      position: absolute;
      left: 40%;
      top: 50%;
      margin: auto;
   }
#g{
	font-size: 14px;	
}
   input[id*="d"] {
      display:none;
   }
   input[id*="d"] + label {
      display:block;
      padding:20px;
      border-bottom:0;
      color: BLACK;
      font-weight: 900;
      font-size: 17px;
      background: white;
      cursor:pointer;
      position:relative;
       border: 0;
	  border-radius: 5px;
	  
   }
   input[id*="d"] + label + div {
      max-height: 0;
      overflow: hidden;
      background: #F6F6F6;
      font-size: 11px;
   }
   input[id*="d"] + label + div p {
      display: inline-block;
      padding: 20px;
      font-size: 12px;
   }
   input[id*="d"]:checked + label + div {
      max-height: 100px;
   }
   
   input[id*="j"] {
      display:none;
   }
   input[id*="j"] + label {
      display:block;
      padding:20px;
      border-bottom:0;
      color: BLACK;
      font-weight: 900;
      font-size: 17px;
      background: WHITE;
      cursor:pointer;
      position:relative;
       border: 0;
	  border-radius: 5px;
   }
   input[id*="j"] + label + div {
      max-height: 0;
      overflow: hidden;
      background: #F6F6F6;
      font-size: 11px;
   }
   input[id*="j"] + label + div p {
      display: inline-block;
      padding: 20px;
      font-size: 12px;
   }
   input[id*="j"]:checked + label + div {
      max-height: 100px;
   }

   input[id*="Q"] {
      display:none;
   }
   input[id*="Q"] + label {
      display:block;
      padding:20px;
      border-bottom:0;
      color: black;
      font-weight: 900;
      font-size: 17px;
      background: white;
      cursor:pointer;
      position:relative;
      border: 0;
	  border-radius: 5px;
   }
   input[id*="Q"] + label + div {
      max-height: 0;
      overflow: hidden;
      background: #F6F6F6;
      font-size: 11px;
   }
   input[id*="Q"] + label + div p {
      display: inline-block;
      padding: 20px;
      font-size: 12px;
   }
   input[id*="Q"]:checked + label + div {
      max-height: 120px;
   }
   .radio:checked +label{  
  /* selected styled */
  background-color: #FFA500;
    color: white;
  text-shadow: 1px 1px 3px #8e8e8e;
}
   
   
</style>
</head>
<body id="g">


	<div id="QNAtop" >
		<div style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">Q&A</div>
		<div style="font-size: 19px;">궁금한것 무엇이든! 물어보세요!</div>
	</div>
	<div id="FAQtop" style="display:none;">
		<div style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">FAQ</div>
		<div style="font-size: 19px;">자주하는 질문들을 모아! 모아!</div>
	</div>
	
	<div id="dGUIDEtop" style="display:none;">
		<div style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">DALIN</div>
		<div style="font-size: 19px;">달인님이 궁금하신것들 모았습니다!</div>
	</div>
	
	<div id="jGUIDEtop" style="display:none;">
		<div style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">JEJA</div>
		<div style="font-size: 19px;">제자님이 궁금하신것들 모았습니다!</div>
	</div>	
	
	<br>
<div style="width: 150px;   display: inline-block; text-align: center;">
	<input type="radio" class="radio" id="AQNA" name="radio" style="display:none; margin-bottom: 20px; " ><label for="AQNA">Q&A게시판</label>
</div>

<div style="width: 150px; ;  margin-left:-5px; display: inline-block;text-align: center;">
	<input type="radio" class="radio" id="FAQ" name="radio" style="display:none;margin-bottom: 20px;"><label for="FAQ">FAQ게시판</label>
</div>

<div style="width: 150px;    margin-left:-5px; display: inline-block;text-align: center;">
	<input type="radio" class="radio" id="dGUIDE" name="radio" style="display:none;margin-bottom: 20px;"><label for="dGUIDE">DALIN가이드</label>
</div>

<div style="width: 150px;     margin-left:-5px; display: inline-block;text-align: center;">
	<input type="radio" class="radio" id="jGUIDE" name="radio" style="display:none;margin-bottom: 20px;"><label for="jGUIDE">JEJA가이드</label>
</div>

<div id="QNAboard">		
	<div>
		<table style="height: 30px; width: 1024px;  text-align: center;" class="table table-hover" id="ta">
			<colgroup >
				<col width="10%">
				<col width="50%">
				<col width="20%">
				<col width="20%"> 
			</colgroup>
			<thead>
				<tr class="waring">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody id="list">
			<c:forEach items="${qnaPage.list}" var="q">
				<tr>
					<td class="num">${q.QNo}</td>
					<td class="subject" ><a href="/dal/member/qnaBoard/read?qNo=${q.QNo}">${q.QTitle}</a></td>
					<td class="writer">${q.QWriter}</td>
					<td class="date">${q.QWriteDateStr}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
		<div id="page_wrap">
			<div id="inner">
			<ul class="pagination">
				<c:if test="${qnaPage.prev==true }">
					<li><a href="/dal/member/qnaBoard/list?pageno=${qnaPage.startPage-1}">이전</a></li>
				</c:if>
				<c:forEach begin="${qnaPage.startPage}" end="${qnaPage.endPage}" var="i">
					<c:choose>
						<c:when test="${qnaPage.pageno eq i}">
							<li class="active">
								<a href="/dal/member/qnaBoard/list?pageno=${i}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li><a href="/dal/member/qnaBoard/list?pageno=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${qnaPage.next==true }">
					<li><a href="/dal/member/qnaBoard/list?pageno=${qnaPage.endPage+1}">다음</a></li>
				</c:if>
			</ul>
			</div>
		</div>
		<div class="form-group" style="float: right; margin-right: 100px;">
			<a class="btn btn-info" href="/dal/member/qnaBoard/write" style="font-size: 14px;">글쓰기</a>
		</div>
</div>
<div id="FAQboard" style="display:none;">
   <div style="margin-top: 30px;">
      <input type="radio" name="faq" id="Q1">
      <label for="Q1" >1. 아이디와 비밀번호를 잊어버렸어요!<em></em></label>
      <div><p>
      	 숨달의 아이디는 이메일 주소입니다.
      	 <br>
      	 숨달의 요청서를 작성하셨었다면 요청서 작성 마지막 단계에서 입력하셨던 이메일 주소가 숨달의 아이디입니다.
      	 <br>
      	 기억이 나지 않으신다면, 숨달 고객센터 이메일을 통해 문의주시면 도와드리겠습니다.
      	 <br>
      	 비밀번호가 기억나지 않으신다면, 아래 경로를 통해 비밀번호 재설정을 하실 수 있습니다.
      	 <br>
      	 비밀번호 찾기 클릭 
      </p>
      </div>
      <input type="radio" name="faq" id="Q2">
      <label for="Q2">2. 인증번호 문자가 오지 않아요.<em></em></label>
      <div><p>
		휴대폰 본인 인증 문자가 오지 않는 경우, 아래 두 가지를 확인해주세요.
		<br>
		- 숨고의 고객센터 번호 1599-5319가 스팸 번호로 등록되어있어 숨고에서 전송한 문자가 스팸 문자로 분류된 경우
		<br>
	 	- 통신사 무료 부가서비스 중 스팸 필터링 부가서비스에 가입되어있는 경우
	 	<br>
	 	스팸 문자함을 살펴봐 주시고,  통신사에 해당 부가서비스에 가입되어있는지 확인 부탁드립니다.
	 	<br>
	 	위 두 가지에 해당하지 않을 때는 숨고 고객센터로 연락해 주시면 도와드리겠습니다. 
      </p>
      </div>
      <input type="radio" name="faq" id="Q3">
      <label for="Q3">3. 고수 카테고리 추가/삭제는 어떻게 하나요?<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="faq" id="Q4">
      <label for="Q4">4. 견적서 보내는 방법을 잘 모르겠어요.<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="faq" id="Q5">
      <label for="Q5">5. 저는 견적서를 보낸적이 없는데 보내졌어요!<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
          <input type="radio" name="faq" id="Q6">
      <label for="Q6" >6. 요청서 작성은 어떻게 하나요?<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
          <input type="radio" name="faq" id="Q7">
      <label for="Q7" >7. 요청서 내용을 수정하고 싶어요!<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
          <input type="radio" name="faq" id="Q8">
      <label for="Q8" >8. 견적서가 도착했아요. 견적서는 무엇인가요?<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
   </div>
</div>
<div id="dGUIDEboard" style="display:none;">
   <div style="margin-top: 30px;">
      <input type="radio" name="dGUIDE" id="d1">
      <label for="d1">1. 자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="dGUIDE" id="d2">
      <label for="d2">2. 자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="dGUIDE" id="d3">
      <label for="d3">3. 자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="dGUIDE" id="d4">
      <label for="d4">4. 자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="dGUIDE" id="d5">
      <label for="d5">5. 자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
   </div>
</div>
<div id="jGUIDEboard" style="display:none;">
   <div style="margin-top: 30px;">
      <input type="radio" name="jGUIDE" id="j1">
      <label for="j1">Q. 왜 NEW 숨고캐시로 바뀌나요 ?<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="jGUIDE" id="j2">
      <label for="j2">2. 자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="jGUIDE" id="j3">
      <label for="j3">3. 자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="jGUIDE" id="j4">
      <label for="j4">4. 자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="jGUIDE" id="j5">
      <label for="j5">5. 자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
   </div>
</div>		
		
</body>
</html>