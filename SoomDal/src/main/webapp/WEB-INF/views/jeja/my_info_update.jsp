<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		$("#nameArea").hide();
		$("#emailArea").hide();
		$("#pwdArea").hide();
		$("#telArea").hide();
		$("#activateChangeName").on("click", function() {
			$("#nameArea").toggle();
		});
		$("#activateChangeEmail").on("click", function() {
			$("#emailArea").toggle();
		});
		$("#activateChangePwd").on("click", function() {
			$("#pwdArea").toggle();
		});
		$("#activateChangeTel").on("click", function() {
			$("#telArea").toggle();
		});
	});
</script>
<style>
	#update_title {
		text-align: center;
		padding: 15px 20px;
	}
	#frm_wrap {
		display: inline-block;
		position: relative;
		top:40%;
		left: 40%;
		padding: 80px 0;
		
	}
	#btn_resign {
		padding-top: 30px;
	}
	.info_wrap {
		padding: 10px 0;
		width: 500px;
	}
	.info_wrap span {
		padding: 0 10px;
	}
	.info_wrap input {
		width: 300px;
	}
	.key {
		padding: 10px 10px;
	}
</style>
</head>
<body>
	<div id="update_wrap">
		<div id="update_title">
			<h1>계정</h1>
		</div>
		<div id="frm_wrap">
		<form id="updateFrm">
			<div id="private">
				<h2>개인 정보</h2>
			</div>
			<div class="info_wrap">
				<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_01.png"><span>OOO</span><button type="button" class="btn btn-info" id="activateChangeName">수정</button>
				<div id="nameArea" class="card">
					<span class="key" style="padding: 10px 10px;">이름 : </span><input type="text" id="jName" class="form-control" placeholder="변경하실 이름을 입력해주세요"><br>
	  				<button type="button" class="btn btn-info" id="changeName" style="width: 80px;">수정사항 저장</button>
				</div>
			</div>
			<div class="info_wrap">
				<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_02.png"><span>tmdgns277@naver.com</span><button type="button" class="btn btn-info" id="activateChangeEmail">수정</button>
				<div id="emailArea">
					<span class="key">ID(email) : </span><input type="text" id="jEmail" class="form-control"><br>
	  				<button type="button" class="btn btn-info" id="changeEmail">수정사항 저장</button>
				</div>
			</div>
			<div class="info_wrap">
				<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_03.png"><span>비밀번호</span><button type="button" class="btn btn-info" id="activateChangePwd">수정</button>
				<div id="pwdArea">
					<span class="key">현재 비밀번호 : </span><input type="password" id="jPassword" name="jPassword" class="form-control"><br>
					<span class="key">새 비밀번호 : </span><input type="password" id="jNewPassword" name="jNewPassword" class="form-control"><br>
					<span class="key">새 비밀번호 확인 : </span><input type="password" id="jNewPassword2" class="form-control"><br>
	  				<button type="button" class="btn btn-info" id="changeEmail">수정사항 저장</button>
				</div>
			</div>
			<div class="info_wrap">
				<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_05.png"><span>010-0000-0000</span><button type="button" class="btn btn-info" id="activateChangeTel">수정</button>
				<div id="telArea">
					<span class="key">연락처 : </span><input type="text" id="jTel" class="form-control"><br>
	  				<button type="button" class="btn btn-info" id="changeTel">수정사항 저장</button>
				</div>
			</div>
		</form>
		<div id="btn_resign">
			<img src="https://dmmj3ljielax6.cloudfront.net/static/img/account/account_icon_08.png"><a href="/dal/member/resign"><span>계정 삭제</span></a>
		</div>
		</div>
	</div>
</body>
</html>