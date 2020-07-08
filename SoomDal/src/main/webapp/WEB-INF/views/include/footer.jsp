<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
=======
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
>>>>>>> branch 'master' of https://github.com/star5772/SoomDalProject
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	
    
    <div class="container" id="top" >
<<<<<<< HEAD
    <sec:authorize access="isAnonymous()">
      <a href="/dal/admin/login" style="float:left; display: inline-block; font-size: medium;">관리자 로그인</a>
      </sec:authorize>
      <a style="font-size: medium; margin-left: 30px;"href="/dal/dalin/qnaBoard/list">고객 센터</a><p class="m-0 text-center text-black">Copyright &copy; SoomDal 2020</p>
=======
    	<sec:authorize access="isAnonymous()">
      <a href="/dal/admin/login" style="float:left; display: inline-block; font-size: medium;">관리자 로그인</a></sec:authorize><a style="font-size: medium; margin-left: 30px;"href="/dal/dalin/qnaBoard/list">고객 센터</a><p class="m-0 text-center text-black">Copyright &copy; SoomDal 2020</p>
>>>>>>> branch 'master' of https://github.com/star5772/SoomDalProject
    </div>
    
</body>
</html>