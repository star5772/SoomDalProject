<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function() {
		$("#F1").on("click", function() {
			$("#A1Area").toggle();
		})
	}
</script>
</head>
<body>
	<div id="F1">
		1. 아이디와 비밀번호를 잃어버렸어요!
	</div>
	<div id="A1Area">
		답변
	</div>
</body>
</html>