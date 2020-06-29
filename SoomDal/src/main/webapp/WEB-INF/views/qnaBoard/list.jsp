<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna게시판 list</title>
<style> 
#center{margin-left: 20px; display: inline-block; }
.num{
margin-left: 20px; display: inline-block; 
}
.subject{
  margin-left: 20px; display: inline-block; 
}
.wrtier{
margin-left: 20px; display: inline-block;
}
.date{
 margin-left: 20px; display: inline-block; margin-right: 20px;
}
</style>
</head>
<body>
	<div id="center">
		<div style="font-size: 43px; font-weight: bold; color: rgb(243, 156, 18); ">Q&A</div>
		<div style="font-size: 19px;">궁금한것 무엇이든! 물어보세요!</div>
	</div>

	<table style="height: 30px; margin-left: 20px; width: 700px;  text-align: center;
				border-top: 1px solid black; border-bottom:1px solid #dcdcdc; " class="table table-hover">
		<colgroup style="outline-color: blck;">
			<col width="10%">
			<col width="50%">
			<col width="20%">
			<col width="20%"> 
		</colgroup>
		<thead>
			<tr class="waring">
				<th>번호</th>
				<th style="border-right: 1px solid #dcdcdc;">제목</th>
				<th style="border-right: 1px solid #dcdcdc;">작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<tr style="text-align: center; ">
				<td class="num" >공지</td>
				<td class="subject">공지 알려드립니다. 공지 알려드려</td>
				<td class="writer">관리자</td>
				<td class="date">2020-06-26</td>
			</tr>
			
			<tr style="text-align: center; ">
				<td class="num">${list.qNo}</td>
				<td class="subject">수학 보조선생님 구합니다. 연락주세요.</td>
				<td class="writer">이은지</td>
				<td class="date">2020-06-26</td>
			</tr>
			
			<tr style="text-align: center; ">
				<td class="num">99</td>
				<td class="subject">수학 보조선생님 구합니다. 연락주세요.</td>
				<td class="writer">이은지</td>
				<td class="date">2020-06-26</td>
			</tr>
			
			<tr style="text-align: center; ">
				<td class="num">98</td>
				<td class="subject">수학 보조선생님 구합니다. 연락주세요.</td>
				<td class="writer">이은지</td>
				<td class="date">2020-06-26</td>
			</tr>
			
			<tr style="text-align: center; ">
				<td class="num">97</td>
				<td class="subject">수학 보조선생님 구합니다. 연락주세요.</td>
				<td class="writer">이은지</td>
				<td class="date">2020-06-26</td>
			</tr>
		</tbody>
	</table>
</body>
</html>