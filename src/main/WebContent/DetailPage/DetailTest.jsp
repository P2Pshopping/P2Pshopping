<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>세션만들기</h1>
	<%
	//jsp에선 내장객체인 session으로 바로사용가능
	//서블릿에서는 객체 생성해줘야됨

	session.setAttribute("seller", "sell");
	session.setAttribute("username", "usn");
	session.setAttribute("sellerid", "2");
	/* 유저이름  */
	//세션의 유효기간 설정 초단위설정
	session.setMaxInactiveInterval(1800);
	%>

</body>
</html>