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
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}

</style>
</head>
<body>
<h2 id="text">미술 서비스 </h2>
<h3 id="text">미술 서비스에 오신걸 환영합니다 ! 하고싶은 Art를 배우세요 !</h3>
	<div class="service">
		<div class="card">
  			<img class="card-img-top" src="/image/회화.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=painting'" style="margin-left: 45px; font-weight: bold;" >회화 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/만화,웹툰,애니.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=toonart'" style="margin-left: 45px; font-weight: bold;" >만화,웹툰,애니 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/아동미술.png" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=childart'" style="margin-left: 45px; font-weight: bold;" >아동미술 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/샌드아트.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=sandart'" style="margin-left: 45px; font-weight: bold;" >샌드아트 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/팝아트.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=popart'" style="margin-left: 45px; font-weight: bold;" >팝아트 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/목공예.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=woodworking'" style="margin-left: 45px; font-weight: bold;" >가구,목공예 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/도예.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=pottery'" style="margin-left: 45px; font-weight: bold;" >도예 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/소묘.jpg" alt="Card image cap">
  			<div class="card-body">
  			<button onclick="location.href='/dal/member/field/list?detailFName=drawing'" style="margin-left: 45px; font-weight: bold;" >소묘 레슨</button>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/켈리그라피.jpg" alt="Card image cap">
  			<div class="card-body">
    			<button onclick="location.href='/dal/member/field/list?detailFName=kelligrapy'" style="margin-left: 45px; font-weight: bold;" >캘리그라피 레슨</button>
  			</div>
		</div>
	</div>
</body>
</html>