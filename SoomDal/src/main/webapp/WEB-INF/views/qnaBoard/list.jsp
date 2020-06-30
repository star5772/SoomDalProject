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
      border:1px solid #00FF40;
      border-bottom:0;
      color: white;
      font-weight: 900;
      font-size: 16px;
      background: #00FF40;
      cursor:pointer;
      position:relative;
   }
   input[id*="d"] + label + div {
      max-height: 0;
      overflow: hidden;
      background: #FF00FF;
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
      border:1px solid aqua;
      border-bottom:0;
      color: white;
      font-weight: 900;
      font-size: 16px;
      background: aqua;
      cursor:pointer;
      position:relative;
   }
   input[id*="j"] + label + div {
      max-height: 0;
      overflow: hidden;
      background: #DDDDDD;
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
      border:1px solid orange;
      border-bottom:0;
      color: white;
      font-weight: 900;
      font-size: 16px;
      background: orange;
      cursor:pointer;
      position:relative;
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
      max-height: 100px;
   }
   
   .radio:checked +label{  
  /* selected styled */
  background-color: #FE0200;
  color: white;
  text-shadow: 1px 1px 3px #8e8e8e;
}
   
   
</style>
</head>
<body id="g">


	<div id="QNAtop">
		<div style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">Q&A</div>
		<div style="font-size: 19px;">궁금한것 무엇이든! 물어보세요!</div>
	</div>
	<div id="FAQtop" style="display:none;">
		<div style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">자주묻는질문</div>
		<div style="font-size: 19px;">궁금한것 무엇이든! 물어보세요!</div>
	</div>
	<div id="dGUIDEtop" style="display:none;">
		<div style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">달인 가이드</div>
		<div style="font-size: 19px;">궁금한것 무엇이든! 물어보세요!</div>
	</div>
	<div id="jGUIDEtop" style="display:none;">
		<div style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">제자 가이드</div>
		<div style="font-size: 19px;">궁금한것 무엇이든! 물어보세요!</div>
	</div>	
	<br>
<div style="width: 170px; height: 60px; border: 1px solid gray; margin-top: 50px; display: inline-block;">
	<input type="radio" class="radio" id="AQNA" name="radio" style="display:none;"><label for="AQNA">QNA</label>
</div>
<div style="width: 170px; height: 60px; border: 1px solid gray; margin-top: 50px; margin-left:-5px; display: inline-block;">
	<input type="radio" class="radio" id="FAQ" name="radio" style="display:none;"><label for="FAQ">FAQ</label>
</div>
<div style="width: 170px; height: 60px; border: 1px solid gray; margin-top: 50px; margin-left:-5px; display: inline-block;">
	<input type="radio" class="radio" id="dGUIDE" name="radio" style="display:none;"><label for="dGUIDE">DALIN</label>
</div>
<div style="width: 170px; height: 60px; border: 1px solid gray; margin-top: 50px; margin-left:-5px; display: inline-block;">
	<input type="radio" class="radio" id="jGUIDE" name="radio" style="display:none;"><label for="jGUIDE">JEJA</label>
</div>

<div id="QNAboard">		
	<div>
		<table style="height: 30px; margin-left: 20px; width: 1024px;  text-align: center;" class="table table-hover" id="ta">
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
      <label for="Q1">1.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="faq" id="Q2">
      <label for="Q2">2.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="faq" id="Q3">
      <label for="Q3">3.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="faq" id="Q4">
      <label for="Q4">4.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="faq" id="Q5">
      <label for="Q5">5.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
   </div>
</div>
<div id="dGUIDEboard" style="display:none;">
   <div style="margin-top: 30px;">
      <input type="radio" name="dGUIDE" id="d1">
      <label for="d1">1.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="dGUIDE" id="d2">
      <label for="d2">2.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="dGUIDE" id="d3">
      <label for="d3">3.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="dGUIDE" id="d4">
      <label for="d4">4.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="dGUIDE" id="d5">
      <label for="d5">5.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
   </div>
</div>
<div id="jGUIDEboard" style="display:none;">
   <div style="margin-top: 30px;">
      <input type="radio" name="jGUIDE" id="j1">
      <label for="j1">1.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="jGUIDE" id="j2">
      <label for="j2">2.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="jGUIDE" id="j3">
      <label for="j3">3.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="jGUIDE" id="j4">
      <label for="j4">4.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
      <input type="radio" name="jGUIDE" id="j5">
      <label for="j5">5.자주묻는 질문<em></em></label>
      <div><p>
         아이디와 비밀번호를 잃어버렸어요!
      </p>
      </div>
   </div>
</div>		
		
</body>
</html>