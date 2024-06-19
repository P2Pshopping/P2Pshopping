<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="DPCSS.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>웹소켓 채팅</title>



</head>
<body>
	<script>
	function chatWinOpen() {
		var id = document.getElementById("chatId");
		if(id.value == "") {
			alert("대화명을 입력 후 채팅창을 열어주세요");
			id.focus();
			return;
		}
		window.open("ChatWindow.jsp?chatId=" + id.value, "", "width=320,height=400");
		id.value = "";
	}
	</script>
	<div class="end">
	대화명 : <input type="text" id="chatId"  />
	<button onclick="chatWinOpen();">채팅 참여</button>
	</div>
</body>
</html>