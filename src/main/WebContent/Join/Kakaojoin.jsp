<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<%@ page import="Kakao.KakaoDAO" %>
<%@ page import="Kakao.KakaoDTO" %>
    <link href="text.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><meta name="viewport" content="width=device-width, initial-scale=1">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="access_token" value="${param.access_token}" />

<%
String message = null;

if ("POST".equalsIgnoreCase(request.getMethod())) {
	
    String uname = request.getParameter("inputId");
    String upass = request.getParameter("inputPWD");
   


    // 빈 문자열 또는 null 체크 후 기본값 설정
    int kakaoId = request.getParameter("kakaoId") != null && !request.getParameter("kakaoId").isEmpty() 
                  ? Integer.parseInt(request.getParameter("kakaoId")) : 0;
    int naverId = request.getParameter("naverId") != null && !request.getParameter("naverId").isEmpty() 
                  ? Integer.parseInt(request.getParameter("naverId")) : 0;
    int provinceId = request.getParameter("provinceId") != null && !request.getParameter("provinceId").isEmpty() 
                     ? Integer.parseInt(request.getParameter("provinceId")) : 0;
    int cityId = request.getParameter("cityId") != null && !request.getParameter("cityId").isEmpty() 
                 ? Integer.parseInt(request.getParameter("cityId")) : 0;
    int districtId = request.getParameter("districtId") != null && !request.getParameter("districtId").isEmpty() 
                     ? Integer.parseInt(request.getParameter("districtId")) : 0;
    String auth = request.getParameter("auth");

    KakaoDTO kuser = new KakaoDTO();

    kuser.setUsername(uname);
    kuser.setPassword(upass);
    kuser.setKakaoId(kakaoId);



    KakaoDAO kakaoDAO = null;
    try {
    	kakaoDAO = new KakaoDAO(application);
     //   String hashedPassword = memberDAO.hashPassword(password); // 비밀번호 해시
    //    user.setPassword(hashedPassword); // 해시된 비밀번호 설정
          boolean isUserAdded = kakaoDAO.addKakao(kuser);


        /* if (isUserAdded) {
            message = "회원가입이 성공적으로 완료되었습니다.";
        } else {
            message = "입력칸을 다시 한 번 확인해주세요.";
        } */
    } catch (Exception e) {
        e.printStackTrace();
/*         message = "회원가입 중 오류가 발생했습니다: " + e.getMessage(); */
    } finally {
    	   if (kakaoDAO != null) {
    		   kakaoDAO.close();
        }
    }
}
%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Join</title>
  <script>
  
        function joinCheck1() {
            var id = document.getElementById("inputId").value.trim();
            var pw = document.getElementById("inputPWD").value.trim();
            var pwc = document.getElementById("inputPWDC").value.trim();
      
            if  (id === "") {
                alert("아이디를 입력해주세요.");
                document.getElementById("inputId").focus();
                event.preventDefault();
                return false;
            }
          
           if  (pw === "") {
                alert("비밀번호를 입력해주세요.");
                document.getElementById("inputPWD").focus();
                event.preventDefault();
                return false;
            }
            else if (pwc === "") {
                alert("비밀번호 확인을 입력해주세요.");
                document.getElementById("inputPWDC").focus();
                event.preventDefault();
                return false;
            }
            else  if (pw !== pwc) {
                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                document.getElementById("inputPWDC").focus();
                event.preventDefault();
                return false;
            
            } else{
            	
 			window.location.href = "../Mainpage.jsp";
 			alert("회원가입에 성공하였습니다.");
 			return true;
            }
        
        } 
    </script> 
</head>
<body>
<%-- <%@include file="../layout/Header.jsp"%> --%>
<jsp:include page="../layout/Header.jsp" />
<div style = "margin-top:400px;">

<div class="wrap">
    <div class="contents">
        <div class="join_wrapper2">
    <div class="logo"> 카카오 회원가입 </div>
            <div class="join_form">
                 <form action="join.jsp" method="post" id ="form__wrap" onsubmit = "joincheck();">
           
                    <div class="form-inline w-100">
                        <div class="col-12">
                            <label for="inputId" class="form-label">아이디</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="inputId" name="inputId" placeholder="10자 이하">
                                <button type="button" class="btn btn-danger">중복 확인</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="inputPWD" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" id="inputPWD" name="inputPWD" placeholder="20자 이하">
                    </div>
                    <div class="col-12">
                        <label for="inputPWDC" class="form-label">비밀번호 확인</label>
                        <input type="password" class="form-control" id="inputPWDC" name="inputPWDC" placeholder="위와 같이 입력하세요">
                    </div>
                   <p>
                   </p>
   
                  <% if (message != null) { %>
        <p><%= message %></p>
    <% } %>
                <div class="d-grid gap-2">
                    <a href="../Mainpage.jsp" class="btn btn-secondary btn-lg">뒤로 가기</a>
                    <button type="submit" class="btn btn-primary btn-lg" name = "loginButton" onclick="joinCheck1();">회원 가입</button>
                
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<div style = "margin-top:100px;">
<%-- <%@include file="../layout/Footer.jsp"%> --%>

    <jsp:include page="../layout/Footer.jsp" />
</div>
</body>
</html>