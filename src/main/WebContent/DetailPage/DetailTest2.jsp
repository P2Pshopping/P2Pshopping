<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>세션의 정보 가져오기</h1>
	<%
		//세션의 정보는 Object타입으로 저장되어있음
		//다운 캐스팅 : 자식클래스의 변수 = (자식클래스 타입) 부모타입의 데이터
		String id = (String) session.getAttribute("username");
		out.print(id);
	%>

</body>
</html> --%>