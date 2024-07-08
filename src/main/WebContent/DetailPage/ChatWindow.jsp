<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹소켓 채팅</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="DPCSS.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./DPJS.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

    <style>
        .orange-bg {
            background-color: #FFA500; 
            color: #fff; 
        }
        .orange-border {
            border-color: #FFA500 !important; 
        }
        .orange-btn {
            background-color: #FFA500; 
            border-color: #FFA500;
            color: #fff; 
        }

        /* 추가된 스타일 */
        .container {
            margin-top: 50px; 
        }
        .card {
            width: 100%; 
        }
        .card-body {
            height: 300px; 
            overflow-y: auto; 
        }
    </style>

    <script>
        var webSocket = new WebSocket("<%= application.getInitParameter("CHAT_ADDR") %>/ChatingServer");
        var chatWindow, chatMessage, chatId;

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

        function closeChatWindow() {
            window.close(); // 채팅 창 닫기
        }

        function enterKey() {
            if(event.keyCode == 13){
                sendMessage();
            }
        }

        webSocket.onopen = function(event) {
            chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.<br/>";
        };

        webSocket.onclose = function(event) {
            chatWindow.innerHTML += "웹소켓 서버와의 연결이 종료되었습니다.<br/>";
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
</head>

<body>
    <div class="container">
        <h2 class="text-center" style="color: #FFA500;">채팅창</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card orange-border">
                    <div class="card-header orange-bg">
                        대화명: <input type="text" id="chatId" value="${param.chatId}" readonly />
                        <button id="closeBtn" class="btn orange-btn" onclick="closeChatWindow();">채팅 종료</button>
                    </div>
                    <div class="card-body" id="chatWindow">
                        <!-- 채팅 메시지 표시 -->
                    </div>
                    <div class="card-footer orange-bg">
                        <div class="input-group">
                            <input type="text" id="chatMessage" class="form-control" onkeyup="enterKey();">
                            <button class="btn orange-btn" id="sendBtn" onclick="sendMessage();">전송</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>