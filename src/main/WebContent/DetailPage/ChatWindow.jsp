<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="DPCSS.css" rel="stylesheet" type="text/css">
<!-- 다중 슬라이드 js,css링크-->


<script type="text/javascript" src="./DPJS.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<meta charset="UTF-8">
<title>웹소켓 채팅</title>
<script>
var webSocket 
	= new WebSocket("<%= application.getInitParameter("CHAT_ADDR") %>/ChatingServer");
var chatWindow, chatMessage,chatId;


window.onload = function() {
	chatWindow = document.getElementById("chatWindow");
	chatMessage = document.getElementById("chatMessage");
	chatId = document.getElementById('chatId').value;
}

function sendMessage() {
	
	chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>"
	webSocket.send(chatId + '|' + chatMessage.value);
	chatMessage.value = "";
	chatWindow.scrollTop = chatWindow.scrollHeight;
}

function disconnect() {
	webSocket.close();
}

function enterkey() {
	if(window.event.keyCode == 13){
		sendMessage();
	}
}

webSocket.onopen = function(event) {
	chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.<br/>";
};

webSocket.onclose = function(event) {
	chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다.<br/>";
};

webSocket.onerror = function(event) {
	alert(event.data);
	chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.<br/>";
};

webSocket.onmessage = function(event) {
	var message = event.data.split("|");
	var sender = message[0];
	var content = message[1];
	if(content != ""){
		if(content.match("/")) {
			if(content.match(("/" + chatId))) {
				var temp = content.replace(("/" + chatId), "[귓속말] : ");
				chatWindow.innerHTML += "<div>" + sender + "" + temp + "</div>";
			}
		}
		else {
			chatWindow.innerHTML += "<div>" + sender + " : " + content + "</div>";
			}
		}
		chatWindow.scrollTop = chatWindow.scrollHeight;
	};
</script>	

<style>
#chatWindow{border:1px solid black; width:350px; height:400px; overflow:hidden; padding:5px;}
#chatMessage{width:306px; height:30px;}
#sendBtn{height:30px; position:relative; top:2px; left:-2px;}
#closeBtn{margin-bottom:3px; position:relative; top:2px; left:-2px;}
#chatId{width:158px; height:24px; border:1px solid #AAAAAA; background-color:#EEEEEE;}
.myMsg{text-align:right;}
</style>
</head>


<body >
	<div class="container text-center">
		대화명 : <input type="text" id="chatId" value="${param.chatId }" readonly />
		<button id="closeBtn" onclick="disconnect();">채팅 종료</button>
		<div id="chatWindow" style="margin: 0 auto; border: solid 2px black;"></div>
		<div>
			<input type="text" id="chatMessage" onkeyup="enterKey();">
			<button class="btn btn-primary" id="sendBtn" onclick="sendMessage();">전송</button>
		</div>
	</div>
</body>
</html>