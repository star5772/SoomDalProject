<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<sec:authorize access="hasAnyRole('ROLE_JEJA','ROLE_DALIN','ROLE_ADMIN')">
	<script src="/dal/script/webS.js"></script>
</sec:authorize>
<style>
	.card {
		display: inline-block;
		width: 28%;
		padding:0 15px;
		margin: 15px;
	}
	.service {
		padding: 50px 0;
	}
	#text {
		text-align: center;
	}
	.card img {
		width: 270px;
		height: 300px;
	}
	.btn {
		font-size: medium;
	}
</style>
</head>
<body>
	<h2 id="text">스포츠 서비스 </h2>
	<div class="service">
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=skateboard" class="btn btn-primary">스케이트보드 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=climming" class="btn btn-primary">클라이밍 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=golf" class="btn btn-primary">골프 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=bowling" class="btn btn-primary">볼링 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=tabletennis" class="btn btn-primary">탁구 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=billiards" class="btn btn-primary">당구 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=pilates" class="btn btn-primary">필라테스 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=squash" class="btn btn-primary">스쿼시 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=defense" class="btn btn-primary">호신술 레슨</a>
  			</div>
		</div>
	</div>
</body>
</html>