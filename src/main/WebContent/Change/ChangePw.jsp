<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="common.UserDTO" %> 
	<%@ page import ="User.UserDAO" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="common.JDBConnect"%>

<%@ page import="jakarta.servlet.http.HttpSession" %>

<!-- 2024-07-01 phone ,password 변경 완료 ChangeService 서블릿과 UpdateService 서블릿으로 가능함 -->

<link href="text.css" rel="stylesheet" type="text/css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><meta name="viewport" content="width=device-width, initial-scale=1">

<head>
<meta charset="UTF-8">
<title> 새 비밀번호 설정 </title>
<%

String message = null;
 session = request.getSession(); 

if ("POST".equalsIgnoreCase(request.getMethod())) {
	    String password = request.getParameter("password");
	    String confirmPassword = request.getParameter("passwordc");
		String phone = request.getParameter("phone");
	System.out.println(password);
	if (password != null && password.equals(confirmPassword)) {
       
        session.setAttribute("password", password);
	UserDTO user = new UserDTO();

	user.setPhone(phone);
	user.setPassword(password);
	
	UserDAO userDAO = null;
	try {
		userDAO = new UserDAO(application);
	
		/* boolean isUserAdded = userDAO.addUser(user); */

} catch (Exception e) {
e.printStackTrace();
// 예외 처리 로직 추가
} finally {
if (userDAO != null) {
userDAO.close();
}
}
}
}
	
%>
</head>
<body>

<script>
"use strict";
function joinCheck() {

    var password = document.getElementById("password").value.trim();
    var passwordc = document.getElementById("passwordc").value.trim();
if(password ==='' || passwordc === '' ){
	alert ("입력칸을 다시 한번 확인해주세요.");	
	  document.getElementById("password").focus();
	    event.preventDefault();
	    return false;
}else if (password !== passwordc) {
    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    document.getElementById("passwordc").focus();
    event.preventDefault();
    return false;
} else {

	return true;
}

}


</script>

<%@include file="../layout/Header.jsp"%>


	<div class="join_wrapper2">
		
		
 

    
			<form action="${pageContext.request.contextPath}/ChangePwd.do" method="Post" name="ChangeFrm" style ="width:700px;height:300px;">
    <label class="col-sm-2 col-form-label" style ="width:300px;font-weight:bold;font-size:30px;">새 비밀번호 설정  </label>
    <div class="input-group">
    <label for="inputPassword" class="col-sm-2 col-form-label" style ="width:200px;margin-top:10px;" >새 비밀번호  </label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="password" id = "password"  placeholder="영어,숫자,특수기호 3가지를 모두 사용해주세요." maxlength="20">
      </div>
      
      </div>
     
      

<div class="mb-3 row">

    <label for="inputPassword" class="col-sm-2 col-form-label" style ="width:200px;">새 비밀번호 확인</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="passwordc" id = "passwordc"placeholder="위와 같이 입력하세요." maxlength="20">
</div>

</div>

   <div class="col align-self-center">
      <input class="btn btn-success" value = "비밀번호 변경"onclick = "return joinCheck();"  type="submit" style="margin-left:450px;">
</div>
</form>
  </div>
 
 

	


<div style = "margin-top:40%;">
<%@include file="../layout/Footer.jsp"%>
</div>



</body>
</html>
