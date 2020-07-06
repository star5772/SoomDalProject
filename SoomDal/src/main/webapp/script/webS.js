// 자바스크립트는 브라우저가 있어야 사용가능
// 브라우저 없이 자바스크립트를 사용가능하게 한다 -> node.js , vue.js
// window.onload = function() -> 화면이 로딩되고 나면(JS이벤트)
//							  -> 중복사용 불가
// $(function(){} )			  -> 중복사용가능

// 웹소켓연결을 이곳에서 하게 만들 것
$(function() {
	var wsocket;
	function webSocketConnect() {
		// 로그인했고 웹 소켓 연결이 되지 않았다면...연결
		if(wsocket==undefined) {
			wsocket = new WebSocket("ws://localhost:8081/dal/member/socket");
			console.log(wsocket);
			wsocket.onmessage = function(evt) {
				// "홍길동의 메모: 안녕하세요"
				console.log(evt)
				var data = evt.data.split(":");
				Swal.fire(data[1], data[0],"success");
			}
		}
	}
	webSocketConnect();	
});

