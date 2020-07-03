<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
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
	$("#sah").on("click",function() {
		var qName = $("#search").val();
		location.href="/dal/member/qnaBoard/list?qName="+qName;
	});
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
      font-size: 14px;
   }
   input[id*="d"]:checked + label + div {
      max-height: 180px;
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
      font-size: 14px;
   }
   input[id*="j"]:checked + label + div {
      max-height: 180px;
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
      font-size: 14px;
   }
   input[id*="Q"]:checked + label + div {
      max-height: 180px;
   }
   .radio:checked +label{  
  /* selected styled */
  background-color: #FFA500;
    color: white;
  text-shadow: 1px 1px 3px #8e8e8e;
}
.container-1 input#search{
  width: 200px;
  height: 30px;
  background: white;
  border: none;
  font-size: 10pt;
  float: left;
  color: #262626;
  -webkit-border-radius: 5px;
 
   
    -webkit-transition: background .55s ease;
  -moz-transition: background .55s ease;
  -ms-transition: background .55s ease;
  -o-transition: background .55s ease;
  transition: background .55s ease;
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
	<input checked="checked" type="radio" class="radio" id="AQNA" name="radio" style="display:none; margin-bottom: 20px; " ><label for="AQNA">Q&A게시판</label>
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

<div class="box" style="display: inline-block; margin-left: 200px; ">
  <div class="container-1">
      <input type="search" id="search" placeholder=" 작성자 검색" style="  border-bottom: solid 1px black; " />
      <button type="button" id="sah" style="border: none; background-color: white; margin-left: 5px; margin-top: 4px;"><i class="fa fa-search fa-lg"></i></button>
  </div>
</div>

<div id="QNAboard">
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="username"/>
</sec:authorize>	
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
					<c:choose>
						<c:when test="${q.QIsSecret eq true && q.QWriter ne username}">
							<td class="subject">비밀글 입니다 <i class="fas fa-lock"></i></td>
						</c:when>
						<c:when test="${username eq admin }">
							<td class="subject" ><a href="/dal/member/qnaBoard/read?qNo=${q.QNo}">${q.QTitle}</a></td>
						</c:when>
						<c:otherwise>
							<td class="subject" ><a href="/dal/member/qnaBoard/read?qNo=${q.QNo}">${q.QTitle}</a></td>
						</c:otherwise>
					</c:choose>
					<td class="writer">${q.QName}</td>
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
		<div class="form-group" style="float: right; margin-right: 100px; ">
			<a class="btn btn-info" href="/dal/member/qnaBoard/write" style="font-size: 14px; width: 73px;">글쓰기</a>
		</div>
		<div class="form-group" style="float: left; margin-left: 10px;">
			<a class="btn btn-info" href="/dal/member/qnaBoard/list" style="font-size: 14px;">전체목록</a>
		</div>
</div>
<div id="FAQboard" style="display:none;">
   <div style="margin-top: 30px;">
      <input type="radio" name="faq" id="Q1">
      <label for="Q1" >1. 아이디와 비밀번호를 잊어버렸어요!<em></em></label>
      <div style="margin-left: 40px;"><p>
      	 숨달의 아이디는 <strong>이메일 주소</strong>입니다.
      	 <br>
      	 숨달의 요청서를 작성하셨었다면 요청서 작성 마지막 단계에서 입력하셨던 이메일 주소가 숨달의 아이디입니다.
      	 <br>
      	 기억이 나지 않으신다면, 숨달 고객센터 이메일을 통해 문의주시면 도와드리겠습니다.
      	 <br>
      	 비밀번호가 기억나지 않으신다면, 아래 경로를 통해 비밀번호 재설정을 하실 수 있습니다.
      	 <br>
      	<strong>비밀번호 찾기 클릭</strong> 
      </p>
      </div>
      <input type="radio" name="faq" id="Q2">
      <label for="Q2">2. 인증번호 문자가 오지 않아요.<em></em></label>
      <div style="margin-left: 40px;"><p>
		휴대폰 본인 인증 문자가 오지 않는 경우, 아래 두 가지를 확인해주세요.
		<br>
		&nbsp;&nbsp;- 숨달의 고객센터 번호 1599-5319가 스팸 번호로 등록되어있어 숨달에서 전송한 문자가 <strong>스팸 문자로 분류된 경우</strong>
		<br>
	 	&nbsp;&nbsp;- 통신사 무료 부가서비스 중 <strong>스팸 필터링 부가서비스에 가입되어있는 경우</strong>
	 	<br>
	 	스팸 문자함을 살펴봐 주시고,  통신사에 해당 부가서비스에 가입되어있는지 확인 부탁드립니다.
	 	<br>
	 	위 두 가지에 해당하지 않을 때는 숨고 고객센터로 연락해 주시면 도와드리겠습니다. 
      </p>
      </div>
      <input type="radio" name="faq" id="Q3">
      <label for="Q3">3. 회원가입은 어떻게 하나요?<em></em></label>
      <div style="margin-left: 40px;"><p>
        숨달의 회원으로 가입하시기 위해서는  웹사이트를 이용해주셔야 합니다.
        <br>
	약관 변경, 공지사항, 요청서/견적서 알림 등 중요한 내용을 이메일로 전해드리고 있어서,
	<br> 
	숨달의 아이디는 <strong>주로 사용하시는 이메일 주소</strong>로 가입해주시기 바랍니다.
      </p>
      </div>
      <input type="radio" name="faq" id="Q4">
      <label for="Q4">4. 계정 정보를 변경하고 싶어요.<em></em></label>
      <div style="margin-left: 40px;"><p>
      등록해주신 <strong>이름, 이메일 주소, 전화번호, 비밀번호를 변경</strong>하고 싶으신 경우, 아래 경로를 통해 가능합니다.
	<br>
	전화번호를 변경하신 경우 다시 한 번 본인인증을 진행해주셔야 합니다.
	<br>
      </p>
      </div>
      <input type="radio" name="faq" id="Q5">
      <label for="Q5">5. 법인폰 사용자/외국 거주자도 숨달을 사용할 수 있나요?<em></em></label>
      <div style="margin-left: 40px;"><p>
      법인 휴대폰을 사용하시는 경우, 휴대폰 본인인증 절차가 통신사별로 다릅니다.
      <br>
	자세한 사항은 이용하시는 통신사에 문의 부탁드립니다.
	<br>
	외국에서 거주하고 계신 경우, 해외에서 SMS 수신이 가능한 휴대폰을 가지고 계신다면 휴대폰 본인인증
	<br>
	문자 수신이 가능하므로 숨고를 이용하실 수 있습니다.
      </p>
      </div>
          <input type="radio" name="faq" id="Q6">
      <label for="Q6" >6. 달인으로 활동 중인데 요청서를 보내고 싶어요. 제자로 가입했는데 달인으로 활동하고 싶어요.<em></em></label>
      <div style="margin-left: 40px;"><p>
      	<strong>숨달에 가입한 하나의 계정을 통해 달인/제자으로 모두 이용</strong>하실 수 있습니다.
      	<br>
      	<strong>서비스를 받고자 제자로 가입하셨으나 달인으로 활동하고 싶으신 경우</strong>, 달인으로 가입하기 버튼을 클릭하신
      	<br>
      	후 제공 서비스 및 주소지 등을 입력해주시면 됩니다.
      	<br>
      	이후에는 아래 경로에 따라 자유롭게 계정을 전환하셔서 사용하실 수 있습니다.
      	<br>
      	<strong>달인로 활동 중에 받고 싶은 서비스가 있어 요청서를 작성하고자 하실 경우</strong>, 제자으로 전환 버튼을 클릭하신
      	<br>
      	후 요청서 작성을 하실 수 있습니다.
		<br>
		다만, 달인님이 제공 서비스로 설정하신 서비스는 요청하실 수 없습니다.
      </p>
      </div>
          <input type="radio" name="faq" id="Q7">
      <label for="Q7" >7. 탈퇴(계정 삭제)를 하고 싶어요.<em></em></label>
      <div style=" margin-left: 40px;"><p>
      	더는 숨달 이용을 원치 않으신다면 아래 경로를 통해 탈퇴(계정 삭제)를 진행하실 수 있습니다.
      	<br>
      	1. <strong>마이페이지</strong>에 들어가기
      	<br>
      	2. 하단 <strong>계정 탈퇴</strong> 클릭
      </p>
      </div>
      <input type="radio" name="faq" id="Q8">
      <label for="Q8" >8. 상대방을 신고하고 싶어요!<em></em></label>
      <div style="margin-bottom: 20px; margin-left: 40px;"><p>
      	광고/홍보 등의 내용이나 부적절한 언어(욕설/성희롱 등)가 담긴 채팅 등을 받으셨을 때,
      	<br>
      	상대가 약속을 이행하지 않을 때, 또는 약속 후 일방적으로 연락이 끊어졌을 때 등
      	<br>
      	불편하거나 불쾌한 경험을 하셨을 경우 <strong>신고하기 기능</strong>을 통해 상대방을 신고해주세요.
      	<br>
      	숨고 내부에서 피신고 내역 확인 후 이용약관에 따라 적절한 조처를 하고 있습니다.
      </p>
      </div>
   </div>
</div>

<div id="dGUIDEboard" style="display:none;">
   <div style="margin-top: 30px;">
      <input type="radio" name="dGUIDE" id="d1">
      <label for="d1">Q. 제자의 답변을 받으면 무조건 캐시가 차감되는 건가요?<em></em></label>
      <div style="margin-left: 40px;"><p>
     	아닙니다. 결정권은 달인에게 있기에 요청서를 확인하여 <strong>거절 할 수도 있고 수락</strong>할 수도 있습니다.
      <br>
      	 결정하는 것이 무조건 서로의 요청서/견적서가 성립이 되는 순간을 말하는 것입니다.
      	<br>
      	하지만 캐시에 대한 <strong>결정권은 달인</strong>에게 있지요.
      </p>
      </div>
      <input type="radio" name="dGUIDE" id="d2">
      <label for="d2">Q. 견적서 내용을 작성하지 않으면, 견적금액이 더 중요해지는 건가요?<em></em></label>
      <div style="margin-left: 40px;"><p>
      이제 제자는 견적금액과 달인님의 프로필을 함께 받아보게 됩니다.
      <br> 
      그러므로 달인님의 전문성 있는 프로필 내용 및 제자의 요청서 내용에 맞는 적절한 견적금액을 기입하는 것이 중요해집니다. 
      <br>
      요청서의 세부 내용을 찬찬히 살펴보시고, 제자의 상황과 니즈에 맞는 서비스의 <strong>맞춤 가격</strong>을 보내시면, 제
      <br>
      제와 더 쉽게 상담을 진행할 수 있고 제자의 신뢰도 얻을 수 있습니다. 
      <br>
      고객의 상황에 따라 원하는 서비스 내용이 다를 수 있기 때문에, 제자의 의도를 파악한 후 제자가 신뢰할 수
      <br>
      있는 견적금액을 제안하는 것을 추천해 드립니다.
      </p>
      </div>
      <input type="radio" name="dGUIDE" id="d3">
      <label for="d3">Q. '자주 쓰는 견적서'가 없어지나요?<em></em></label>
      <div style="margin-left: 40px;"><p>
      	견적을 보내는 방식이 달라져도 고수님께서 작성해두신 ‘자주 쓰는 견적서’ 내용은 없어
      <br>
      지지 않습니다.
      <br>
      자주 쓰는 견적서를 새롭게 저장, 관리, 수정하는 것은 이후에도 마
      <br>
      이페이지 > 자주 쓰는 견적서 관리에서 진행하실 수 있습니다.
      </p>
      
      </div>
      <input type="radio" name="dGUIDE" id="d4">
      <label for="d4">Q. 숨달캐시, 환불받을 수 있나요?<em></em></label>
      <div style="margin-left: 40px;"><p>
      구매하신 <strong>충전캐시</strong>는 마이페이지 - 충전/사용 내역을 통해 직접 환불 신청이 가능하며, 구매일로부터 일주일간
      <br>
      환불 받으실 수 있습니다.
      <br>
      충전캐시를 2회 이상 구매하신 경우, 각각의 구매 건에 대한 환불 신청을 따로 따로 진행해주셔야 합니다.
      </p>
      </div>
      
      <input type="radio" name="dGUIDE" id="d5">
      <label for="d5">Q. 앞으로 숨달는 달인과 어떻게 소통할 계획인가요?<em></em></label>
      <div style="margin-left: 40px;"><p>
      숨고는 다양한 채널을 통해 남겨주시는 리뷰, 자체적으로 진행하는 설문조사, 고수 인터뷰, 전담 컨설턴트
      <br>
      등의 경로로 고수님들의 의견을 듣고 있습니다.
      <br>
      앞으로도 고수님들의 의견을 경청하기 위한 채널들을 더 확대하고 보강해나갈 계획입니다.
      <br>
      지금부터 론칭 후에도, 숨고캐시 개편에 대한 피드백을 적극적으로 듣겠습니다.
       <br>
       지속해서 고수님들의 피드백을 받아, 숨고캐시를 더 합리적으로 만들어가는 방법을 계속 찾아갈 예정입니다. 
        <br>
        고수님들의 많은 관심과 아낌없는 피드백을 기다리겠습니다.
      </p>
      </div>
      
   </div>
</div>

<div id="jGUIDEboard" style="display:none;">
   <div style="margin-top: 30px;">
      <input type="radio" name="jGUIDE" id="j1">
      <label for="j1">Q. 달인에게 리뷰를 남겼는데 삭제하고 싶어요.<em></em></label>
      <div style="margin-left: 40px;"><p>
      로그인 상태에서 작성하신 리뷰는 달인님 프로필을 클릭하여 <strong>확인 및 삭제</strong>가 가능합니다.
      <br>
      삭제하신 후에는 <strong>다시 작성이 가능</strong>합니다.
      <br>
      다만, <strong>비로그인 상태에서 작성하신 리뷰는 삭제가 불가능합니다.</strong>
      </p>
      </div>
      <input type="radio" name="jGUIDE" id="j2">
      <label for="j2">Q. 내가 원하는 달인에게 직접 서비스를 요청할 수 있나요?<em></em></label>
      <div style="margin-left: 40px;"><p>
      <strong>달인찾기 페이지</strong>를 통해 거주하는 지역, 서비스 카테고리 등에 맞춰서 고수를 검색한 다음, 프로필을 확인하고 
      <br>
      마음에 드는 달인를 직접 지정하여 요청서를 전송할 수 있습니다.
      <br>
      다만, 제자가 고용 의사를 가지고 지정 요청서를 보내더라도 일정이나 지역, 서비스 내용, 달인의 개인적인
      <br>
      사정에 의해 답변이 어려울 수 있습니다.
      <br>
      지정 요청서를 보내고 일정시간이 지나면 같은 서비스를 제공하는 다른 고수로부터 견적을 받을 수도 있습니다.
      </p>
      </div>
      <input type="radio" name="jGUIDE" id="j3">
      <label for="j3">Q. 요청서는 무엇인가요? 작성은 어떻게 하나요?<em></em></label>
      <div style="margin-left: 40px;"><p>
      <strong>쉽고 빠르게 원하는 조건의 전문가를 찾아보세요!</strong>
      <br>
      제자는 도움이 필요한 생활 서비스에 대해 요청서를 작성합니다.
      <br>
      달인는 요청서를 살펴본 후 나에게 잘 맞는 요청이라고 생각되면 견적서를 보내 금액 및 서비스 내용을 제안합니다.
      <br>
      달인 웺사이트에서 <strong>원하는 서비스를 선택</strong>하시거나 <strong>홈페이지 메인 화면 상단 검색창에 
   	<br>   
      원하는 서비스를 검색</strong>하시면 해당 서비스의 요청서를 작성하실 수 있습니다.
      <br>
    <strong>원하는 서비스 내용을 구체적으로 작성</strong>하시면 조건에 맞는 달인님들을 찾을 확률이 더 높아집니다.
      </p>
      </div>
      <input type="radio" name="jGUIDE" id="j4">
      <label for="j4">Q. 달인에게 리뷰는 어떻게 남기나요?<em></em></label>
      <div style="margin-left: 40px;"><p>
      달인에게 만족스러운 서비스를 받으셨다면 <strong>달인 프로필에 리뷰</strong>를 남겨주세요.
      <br>
      제자님이 남겨주신 한 마디가 달인님에게는 큰 힘이 될 수 있습니다.
      <br>
      리뷰는 달인과 레슨을 시작한 경우에만 작성할 수 있습니다.
      </p>
      </div>
      <input type="radio" name="jGUIDE" id="j5">
      <label for="j5">Q. 요청서를 수정/취소하고 싶어요.<em></em></label>
      <div style="margin-left: 40px;"><p>
      요청서는 발행됨과 동시에 조건에 맞는 많은 고수님들께 순차적으로 전달되기 때문에, 중도에 요청서를 수
      <br>
      정할 경우 고수님들께 혼란을 줄 수 있습니다.
      <br>
      이에 따라 <strong>이미 발행한 요청서는 수정할 수 없습니다.</strong>
      <br>
      중요한 내용을 잘못 선택 또는 입력하신 경우, 아래 경로에 따라 <strong>요청서를 취소하신 후, 새롭게 요청서 작성</strong>을 부탁드립니다.
      <br>
      다만, <strong>고수가 고객에게 견적을 보내고, 상담을 시작하는 것은 유료</strong>입니다.
      <br>
      고용 의사가 전혀 없는 상태에서 견적만을 알아보기 위해 요청서를 남발하는 것은 자제해 주세요.
      </p>
      </div>
   </div>
</div>		
</body>
</html>