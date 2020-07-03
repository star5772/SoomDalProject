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
<h2 id="text">음악 서비스 </h2>
	<div class="service">
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=piano&name=피아노 레슨" class="btn btn-primary">피아노 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=elecguitar&name=일렉기타 레슨" class="btn btn-primary">일렉기타 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=drum&name=드럼 레슨" class="btn btn-primary">드럼 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=baseguitar&name=베이스기타 레슨" class="btn btn-primary">베이스기타 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=violinn&name=바이올린 레슨" class="btn btn-primary">바이올린 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=saxophone&name=색소폰 레슨" class="btn btn-primary">색소폰 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=trumpet&name=트럼펫 레슨" class="btn btn-primary">트럼펫 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=flute&name=플루트 레슨" class="btn btn-primary">플루트 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="#" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=cello&name=첼로 레슨" class="btn btn-primary">첼로 레슨</a>
  			</div>
		</div>
	</div>
</body>
</html>