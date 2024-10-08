<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- Add JSTL core taglib // JSTL 태그 (동적 경로)-->
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");//날짜 표시 형식

long creationTime = session.getCreationTime();//최초 요청(세션 생성)시각
String creationTimeStr = dateFormat.format(new Date(creationTime));

long lastTime = session.getLastAccessedTime(); //마지막 요청 시각
String lastTimeStr = dateFormat.format(new Date(lastTime));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<h2>Session 설정 확인</h2>
	<ul>
		<li>세션 유지 시간 : <%=session.getMaxInactiveInterval()%>
		</li>
		<li>세션 아이디 : <%=session.getId()%>
		</li>
		<li>최초 요청 시각 : <%=creationTimeStr%>
		</li>
		<li>마지막 요청 시각 : <%=lastTimeStr%>
		</li>
	</ul>
	
	<h2>서블랫 로그인(model2)</h2>
	<% 
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("LoginForm.jsp");
        return;
    }
%>
<h1>Welcome, <%= username %>!</h1>
<a href="<c:url value='/logout.do' />" >Logout</a>
</body>
</html>