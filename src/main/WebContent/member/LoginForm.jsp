<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Add JSTL core taglib // JSTL 태그 (동적 경로)-->
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<body>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<jsp:include page="../Common/Link.jsp"/>
	<h2>로그인 페이지</h2>
	<span style="color: red; font-size: 1.2em;"> 
	<%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>
	<%
	if (session.getAttribute("username") == null) { //로그인 상태 확인(세션)
		//로그아웃 상태
	%>
	<script>
		function validateForm(form) {
			if (!form.user_id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
	</script>
	
	<!-- mode1로그인 -->
 <!-- <form action="LoginProcess.jsp" method="post" name="loginFrm">

		아이디 : <input type="text" name="user_id" /><br /> 
		패스워드 : <input
			type="password" name="user_pw" /><br /> 

			<input type="submit" value="로그인하기"/>
	</form>	  -->

	<!-- 서블릿 로그인(model2) -->
<form action="<c:url value='/login.do' />" method="post"><!-- JSTL (동적 경로)-->
    Username: <input type="text" name="username"><br>
    Password: <input type="password" name="password"><br>
    <input type="submit" value="Login">
</form>
<% if (request.getParameter("error") != null) { %>
    <p style="color: red;">Invalid username or password. Please try again.</p>
<% } %>


 	<%
	} else { //로그인된 상태
	%>
	<%=session.getAttribute("username")%>
	회원님, 로그인하셨습니다.
	<br />
	<a href="<c:url value='/logout.do' />">[로그아웃]</a>
	<%
	}
	%>

</body>
</html>