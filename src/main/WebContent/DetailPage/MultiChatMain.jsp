<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅</title>
</head>
<body>
	<script>
		function chatWinOpen() {
			var id = document.getElementById("chatId");
			if (id.value == "") {
				alert("대화명을 입력 후 채팅창을 열어주세요");
				id.focus();
				return;
			}

			window.open("ChatWindow.jsp?chatId=" + id.value, "",
					"width=400px,height=550px,left=750px,top=350px");
		}
	</script>
	<input type="text"
		value="구매자"
		id="chatId" style="display: none;" />
	<button class="btn btn-warning" onclick="chatWinOpen();"
		style="width: 100px; height: 50px; float: right; font-family: 'Godo', sans-serif;">채팅 참여</button>
</body >
</html>