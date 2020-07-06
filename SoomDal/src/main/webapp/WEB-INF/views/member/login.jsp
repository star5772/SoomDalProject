<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script>
var openWin;

function openChild()
{
    // window.name = "부모창 이름"; 
    window.name = "main";
    // window.open("open할 window", "자식창 이름", "팝업창 옵션");
    openWin = window.open("/dal/member/find_id",
            "FindDalinId", "width=700, height=700, resizable = no, scrollbars = no");    
}
$(function() {
	var jidmsg = "${jidmsg}";
	var didmsg = "${didmsg}";
	var jmsg = "${jmsg}";
	var dmsg = "${dmsg}";
	if(jidmsg != "") {
		$("#jidalert").text(jidmsg);
		$("#jidmsg").show();
	}
	if(jmsg!="") {
		$("#jalert").text(jmsg);
		$("#jmsg").show();
	}
	if(didmsg != "") {
		$("#didalert").text(didmsg);
		$("#didmsg").show();
	}
	if(dmsg!="") {
		$("#dalert").text(dmsg);
		$("#dmsg").show();
	}
	
});	
</script>	
<style>

.form-group {
	margin: 50px 150px 120px 150px;
	padding: 20px 20px 20px 20px;
	text-align: center;
}
.inline-div {
	display: inline-block;
	width: 300px;
	height: 400px;
	border: 1px solid #DDDDDD;
	border-radius: 2px;
}
.topDiv {
	margin: 100px 220px 0px 220px;
}
#top-h1 {
	width: 100%;
	text-align: center;
	font-weight: bold;
	font-size: 28px;
}
#jejalogin {
	padding: 10px 10px 10px 10px;
	height: 380px;
	margin-left: 20px;
}
#dalinlogin {
	padding: 10px 10px 10px 10px;
	height: 380px;
	margin-right: 20px;
}
h3 {
	margin: 5px;
	margin-bottom: 30px;
	font-weight: bold;
	font-size: 20px;
}
label {
	font-size: 14px;
	margin-bottom: 12px;
}
.btn {
	color: white;
	width: 250px;
	height: 40px;
	margin-top: 10px;
	font-size: 15px;
	font-weight: bold;
}

</style>
</head>
<body>
	<div class="topDiv">
		<h1 id="top-h1">숨달에 오신것을 환영합니다</h1><br>
	</div>
		<div class="form-group memberLogin">
				<div class="inline-div" id="dalinlogin">
					<h3>달인회원 로그인</h3>
					<form action="/dal/dalin/loginpost" method="post" style="height: 400px; text-align: left;">
					<div>
						<label for="dalinId">아이디</label>
						<input type="text" name="dEmail" placeholder="아이디(Email)을 입력해주세요" maxlength="50" class="form-control form-control-lg"><br>
						<div style="height: 30px;">
							<div class="alert alert-success alert-dismissible" id="didmsg" style="display:none; height: 30px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						    	<strong>서버 메시지 </strong><span id="didalert"></span>
						  	</div>
						  	<a class="findId" href="#" onclick="openChild()" style="float:left">달인 아이디 찾기</a>
					  	</div>
					  	</div>
					  	<div style="margin-top: 20px;">		
						<label for="dalinPwd">비밀번호</label>
						<input type="password" name="dPassword" placeholder="비밀번호를 입력하세요" maxlength="20" class="form-control form-control-lg"><br>
						<div style="height: 30px;">
							<div class="alert alert-success alert-dismissible" id="dmsg" style="display:none;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						    	<strong>서버 메시지 </strong><span id="dalert"></span>
						  	</div>
						  	<a class="findPwd" href="/dal/dalin/change_pwd" style="float: left;">달인 비밀번호 찾기</a>			
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						<div style="text-align: center;">
						<button type="submit" class="btn btn-warning">로그인</button><br><br>
						</div>
						
						</div>
					</form>	
				</div>
			<div class="inline-div" id="jejalogin">
					<h3>제자회원 로그인</h3>
					<form action="/dal/jeja/loginpost" method="post" style="height: 400px; text-align: left;">
					<div>
						<label for="jejaId">아이디</label>
						<input type="text" name="jEmail" placeholder="아이디(Email)을 입력해주세요" maxlength="50" class="form-control form-control-lg"><br>
						<div style="height: 30px;">
							<div class="alert alert-success alert-dismissible" id="jidmsg" style="display:none; height: 30px;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						    	<strong>서버 메시지 </strong><span id="jidalert"></span>
						  	</div>
						  	<a class="findId" href="#" onclick="openChild()" style="float:left">제자 아이디 찾기</a>
					  	</div>
					  	</div>
					  	<div style="margin-top: 20px;">
						<label for="jejaPwd">비밀번호</label>
						<input type="password" name="jPassword" placeholder="비밀번호를 입력하세요" maxlength="50" class="form-control form-control-lg"><br>
						<div style="height: 30px;">
							<div class="alert alert-success alert-dismissible" id="jmsg" style="display:none;">
						    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						    	<strong>서버 메시지 </strong><span id="jalert"></span>
						  	</div>
						  	<a class="findPwd" href="/dal/jeja/change_pwd"style="float: left;">제자 비밀번호 찾기</a>						
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						<div style="text-align: center;">
						<button type="submit" class="btn btn-success">로그인</button><br><br>
						</div>
						
						</div>
					</form>	
				</div>	
		</div>

</body>
</html>