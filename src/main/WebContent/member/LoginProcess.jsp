<%@ page import="common.UserDTO"%>
<%@ page import="User.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그인 폼으로부터 받은 아이디와 패스워드
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
/*String userUserName= request.getParameter("user_username");
String userName = request.getParameter("user_name");
String userEmail = request.getParameter("user_email");
String userPhone = request.getParameter("user_phone");
String userAddress = request.getParameter("user_address");*/

//web.xml에서 가져온 데이터베이스 연결 정보
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

System.out.println("Login attempt: " + userId);

//회원 테이블 DAO를 통해 회원 정보 DTO 획득
UserDAO dao = new UserDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
UserDTO userDTO = dao.getuserDTO(userId, userPwd);
dao.close();

//로그인 성공 여부에 따른 처리
if(userDTO.getId()!=0){
	//로그인 성공
	    System.out.println("Login successful: " + userDTO.getUsername());
	session.setAttribute("UserId",userDTO.getId());
	session.setAttribute("UserName",userDTO.getName());
	response.sendRedirect("LoginForm.jsp");
}
else{
	//로그인 실패
	request.setAttribute("LoginErrMsg","로그인 오류입니다.");
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	
    // 로그인 실패
    System.out.println("Login failed for user: " + userId);
    response.sendRedirect("LoginForm.jsp?error=1");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>