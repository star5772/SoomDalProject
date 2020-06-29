<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h2 id="text">미술 서비스 </h2>
	<div class="service">
		<div class="card">
  			<img class="card-img-top" src="/image/회화.jpg" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=painting" class="btn btn-primary" style="margin-left: 84px;">회화 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/만화,웹툰,애니.jpg" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=toonart" class="btn btn-primary" style="margin-left: 45px;">만화,웹툰,애니 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/아동미술.png" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=childart" class="btn btn-primary" style="margin-left: 60px;">아동미술 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/샌드아트.jpg" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=sandart" class="btn btn-primary" style="margin-left: 65px;">샌드아트 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/팝아트.jpg" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=popart" class="btn btn-primary" style="margin-left: 70px;">팝아트 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/목공예.jpg" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=woodworking" class="btn btn-primary" style="margin-left: 55px;">가구,목공예 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/도예.jpg" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=pottery" class="btn btn-primary" style="margin-left: 78px;">도예 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/소묘.jpg" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=drawing" class="btn btn-primary" style="margin-left: 80px;">소묘 레슨</a>
  			</div>
		</div>
		<div class="card">
  			<img class="card-img-top" src="/image/켈리그라피.jpg" alt="Card image cap">
  			<div class="card-body">
    			<a href="/dal/member/field/list?detailFName=kelligrapy" class="btn btn-primary" style="margin-left: 60px;">켈리그라피 레슨</a>
  			</div>
		</div>
	</div>
</body>
</html>