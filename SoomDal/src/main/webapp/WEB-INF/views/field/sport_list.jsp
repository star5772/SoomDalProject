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
	<h2 id="text">스포츠 서비스 </h2>
	<h3 id="text">스포츠 서비스에 오신걸 환영합니다 ! 하고싶은 Sport를 배우세요 !</h3>
	<div class="service">
		<div class="card">
  			<img class="card-img-top" src="/dal/image/스케이트보드.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=skateboard&name=스케이트보드'" style="margin-left: 45px; font-weight: bold;" >스케이트보드 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/클라이밍.png" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=climming&name=클라이밍'" style="margin-left: 45px; font-weight: bold;" >클라이밍 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/골프.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=golf&name=골프'" style="margin-left: 45px; font-weight: bold;" >골프 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/볼링.jpg" alt="Card image cap">
 			<div class="card-body">
 			<button onclick="location.href='/dal/member/field/list?detailFName=bowling&name=볼링'" style="margin-left: 45px; font-weight: bold;" >볼링 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/탁구.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=tabletennis&name=탁구'" style="margin-left: 45px; font-weight: bold;" >탁구 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/당구.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=billiards&name=당구'" style="margin-left: 45px; font-weight: bold;" >당구 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/필라테스.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=pilates&name=필라테스'" style="margin-left: 45px; font-weight: bold;" >필라테스 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/dal/image/스쿼시.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=squash&name=스쿼시'" style="margin-left: 45px; font-weight: bold;" >스쿼시 레슨</button>
  			</div>
		</div>
		
		<div class="card">
  			<img class="card-img-top" src="/dal/image/호신술.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=defense&name=호신술'" style="margin-left: 45px; font-weight: bold;" >호신술 레슨</button>
  			</div>
		</div>
	</div>
</body>
</html>