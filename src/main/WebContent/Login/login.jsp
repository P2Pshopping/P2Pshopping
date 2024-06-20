<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="text.css" rel="stylesheet" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<head>
<meta charset="UTF-8">
<title>Login</title>
<script type = "text/javascript">
function validateForm(form) {

	if (!form.username.value) {
		alert('아이디를 입력해주세요');
		username.focus();
		return false;
		
	}

	if (form.password.value == "") {
		alert('비밀번호를 입력해주세요');
		password.focus();
		return false;
	}

	if (password.length < 6) {
		alert('비밀번호를 6자 이상 입력해주세요');
		password.focus();
		return false;
	}
</script>
</head>
<body>
<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>	
<% if(session.getAttribute("UserId") == null) { %>
	<div class="login_wrapper">
		<div class="login_form">

		  <form action="LoginProcess.jsp" method="post" name = "loginFrm" onsubmit = "return validateForm(this);">
				<input type="text"  name="username" class="login_text" placeholder="ID">
				 <input type="password" name="user_password" class="login_text"  placeholder="PASSWORD">

				<p>
					<a href="../Find/Find.jsp" class="btn btn-link" type=button
						id="join">Forgot Password?</a> 
						
						
					<a href="../agree/agree.jsp"
						class="btn btn-link" type=button id="join">Sign In</a> 
						
					<input type="checkbox" class="form-check-input" name="save_check">
					<label class="form-check-label">아이디 저장</label>
				</p>
			<div class="d-grid gap-2 col-6 mx-auto">
				<input type="submit" class="btn btn-secondary btn-lg"  value = "로그인"/>

	</div>
		</form>


				<button class="btn btn-primary" type="submit">카카오 로그인</button>
				<button class="btn btn-primary" type="submit">네이버 로그인</button>


			</div>

		</div>
<%
	}else {
%>
<%= session.getAttribute("username") %> 회원님, 로그인하셨습니다.<br />
 <a href = "Logout.jsp">[로그아웃]</a>
	 <%
	 }
	 %>


	  <!-- <script>
	
		function setCookie(name, value, days) {
			var expires = "";
			if (days) {
				var date = new Date();
				date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
				expires = "; expires=" + date.toUTCString();
			}
			document.cookie = name + "=" + (value || "") + expires + "; path=/";
		}

		// 쿠키 가져오기 함수
		function getCookie(name) {
			var nameEQ = name + "=";
			var ca = document.cookie.split(';');
			for (var i = 0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0) == ' ')
					c = c.substring(1, c.length);
				if (c.indexOf(nameEQ) == 0)
					return c.substring(nameEQ.length, c.length);
			}
			return null;
		}

		// 쿠키 삭제 함수
		function deleteCookie(name) {
			document.cookie = name + '=; Max-Age=-99999999;';
		}

		// 아이디 저장하기 함수
		function saveUsername() {
			var username = document.getElementById('username').value;
			var rememberMe = document.getElementById('save_check').checked;

			if (rememberMe && username) {
				setCookie('username', username, 7); // 7일 동안 저장
			} else {
				deleteCookie('username');
			}
		} 
 -->
	<!-- 	// 로그인 버튼 클릭 시 호출될 함수
	

	//		if(username != db 아이디 && password != db 비번){
	//			alert('아이디와 비밀번호를 확인해주세요');
	//			return;
	//		}
	//		
			// 아이디 저장 함수
			saveUsername();

			// 폼 제출
			document.getElementById('loginForm').submit();
		}

		// 페이지 로드 시 쿠키에서 아이디 불러오기
		window.onload = function() {
			var savedUsername = getCookie('username');
			if (savedUsername) {
				document.getElementById('username').value = savedUsername;
				document.getElementById('save_check').checked = true;
			}
		}
	</script> -->
</body>
</html>