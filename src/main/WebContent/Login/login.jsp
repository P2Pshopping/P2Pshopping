<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn" %>
<link href="text.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><meta name="viewport" content="width=device-width, initial-scale=1">

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

<body style="overflow-x: scroll; margin:0 auto; width:1200px; align-items : center;">
 <%@include file="../../layout/Header.jsp"%>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<span style="color: red; font-size: 1.2em;"> 
<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>	
<% if(session.getAttribute("UserId") == null) { %>
</span>
<script>
		function validateForm(form) {
			if (!form.username.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (form.password.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
	</script>



	<div class="login_wrapper">
	<div class="flex-center">
Login In
</div>
	
		<div class="login_form">
		


		  <form action="<c:url value='/login.do' />"  method="post" name = "loginFrm" onsubmit = "return validateForm(this);">

				<input type="text"  name="username" class="login_text" placeholder="ID">
				 <input type="password" name="password" class="login_text"  placeholder="PASSWORD">

				<p>
				<div class ="blank">
					<a href="../Find/FindId.jsp" class="btn btn-link" type=button
						id="Find">Forgot Password?</a> 
						
						
					<a href="../agree/agree.jsp"
						class="btn btn-link" type=button id="join">Sign In</a> 
						
					<input type="checkbox" class="form-check-input" name="save_check">
					<label class="form-check-label">아이디 저장</label>
				</div>
				</p>
			<div class="d-grid gap-2 col-6 mx-auto">
				<input type="submit" class="btn btn-secondary btn-lg"  value = "로그인"/>

	</div>
		</form>


				<button class="btn btn-primary" type="submit">카카오 로그인</button>
				<button class="btn btn-primary" type="submit">네이버 로그인</button>


			</div>

		</div>
		<% if (request.getParameter("error") != null) { %>
    <p style="color: red;">Invalid username or password. Please try again.</p>
<% } %>
		
	<%
	} else { //로그인된 상태
	%>
<%=session.getAttribute("username")%>
	회원님, 로그인하셨습니다.
	<br />
	<a href="<c:url value='/login.do' />">[로그아웃]</a>
	<%
	}
	%>

<div style = "margin-top:50%;">
<%@include file="../layout/Footer.jsp"%>
</div>
</body>
</html>