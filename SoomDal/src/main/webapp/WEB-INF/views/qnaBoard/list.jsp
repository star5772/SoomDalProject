<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna게시판 list</title>
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
</style>
</head>
<body id="g">
	<div id="center">
		<div style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">Q&A</div>
		<div style="font-size: 19px;">궁금한것 무엇이든! 물어보세요!</div>
	</div>
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
				<td class="subject" >${q.QTitle}</td>
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
</body>
</html>