<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
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
		margin-left: 60px;
	}
	#text {
		text-align: center;
		margin-top: 20px;
	}
	.card img {
		width: 270px;
		height: 300px;
	}
	.btn {
		font-size: medium;
	}
button {
  width: 150px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: small;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border-radius : 40px;
  border: none;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }
button:hover {
  background-color: #FFC459;
  box-shadow: 0px 15px 20px rgba(255, 196, 89, 0.4);
  color: #fff;
  transform: translateY(-7px);
}
</style>
</head>
<body>
<h2 id="text">악기 서비스 </h2>
<h3 id="text">악기 서비스에 오신걸 환영합니다 ! 하고싶은 Instrument를 배우세요 !</h3>
	<div class="service">
		<div class="card">
  			<img class="card-img-top" src="/dal/image/피아노.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=piano&name=피아노'" style="margin-left: 45px; font-weight: bold;" >피아노 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/일렉기타.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=elecguitar&name=일렉기타'" style="margin-left: 45px; font-weight: bold;" >일렉기타 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/드럼.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=drum&name=드럼'" style="margin-left: 45px; font-weight: bold;" >드럼 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/베이스.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=baseguitar&name=베이스기타'" style="margin-left: 45px; font-weight: bold;" >베이스기타 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/바이올린.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=violinn&name=바이올린'" style="margin-left: 45px; font-weight: bold;" >바이올린 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/색소폰.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=saxophone&name=색소폰'" style="margin-left: 45px; font-weight: bold;" >색소폰 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/트럼펫.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=trumpet&name=트럼펫'" style="margin-left: 45px; font-weight: bold;" >트럼펫 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/플룻.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=flute&name=플루트'" style="margin-left: 45px; font-weight: bold;" >플루트 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/첼로.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=cello&name=첼로'" style="margin-left: 45px; font-weight: bold;" >첼로 레슨</button>
  			</div>
		</div>
	</div>
</body>
</html>