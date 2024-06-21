<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<%@ page import="Joins.UserDAO" %>
<%@ page import="Joins.UserDTO" %>
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


<%
String message = null;

if ("POST".equalsIgnoreCase(request.getMethod())) {
    String name = request.getParameter("inputName");
    String birth = request.getParameter("inputBirth");
	String nickname = request.getParameter("inputNickName");    
    String username = request.getParameter("inputId");
    String password = request.getParameter("inputPWD");
    String phone = request.getParameter("inputPhone");
    String email = request.getParameter("inputEmail");
    String address = request.getParameter("inputAddress");


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

    UserDTO user = new UserDTO();
    user.setName(name);
    user.setUsername(username);
    user.setEmail(email);
    user.setPhone(phone);
    user.setAddress(address);
    user.setNickname(nickname);
    user.setPassword(password);
    user.setKakaoId(kakaoId);
    user.setNaverId(naverId);
    user.setProvinceId(provinceId);
    user.setCityId(cityId);
    user.setDistrictId(districtId);
    user.setAuth(auth);


    UserDAO userDAO = null;
    try {
    	userDAO = new UserDAO(application);
     //   String hashedPassword = memberDAO.hashPassword(password); // 비밀번호 해시
    //    user.setPassword(hashedPassword); // 해시된 비밀번호 설정
          boolean isUserAdded = userDAO.addUser(user);


        /* if (isUserAdded) {
            message = "회원가입이 성공적으로 완료되었습니다.";
        } else {
            message = "입력칸을 다시 한 번 확인해주세요.";
        } */
    } catch (Exception e) {
        e.printStackTrace();
/*         message = "회원가입 중 오류가 발생했습니다: " + e.getMessage(); */
    } finally {
    	   if (userDAO != null) {
    		   userDAO.close();
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
  /*   "use strict";

    document.addEventListener("DOMContentLoaded", function() {
    	  const form = document.getElementById('form__wrap');
    	  const checkAll = document.getElementById('checkAll');
    	  const submitButton = document.querySelector('button.next-button');
    	  const checkBoxes = document.querySelectorAll('.input__check input[type="checkbox"]');
    	  const loginButton = document.querySelector('loginButton');
    	  const agreements = {
             
                  privacyPolicy: false
    	  };
    	  checkBoxes.forEach(function(item) {
              item.addEventListener("input", toggleCheckbox);
          });
    	  function toggleCheckbox(e) {
              const { checked, id } = e.target;
              agreements[id] = checked;
              this.parentNode.classList.toggle("active");
              checkAllStatus();
              toggleSubmitButton();
          }
    	   function checkAllStatus() {
               const {  privacyPolicy } = agreements;
               checkAll.checked =  privacyPolicy ;
    	   }
    	   
    	   
    	    function toggleSubmitButton() {
                const { privacyPolicy } = agreements;
                submitButton.disabled = !(privacyPolicy);
    	    }
    	    checkAll.addEventListener("click", function(e) {
                const { checked } = e.target;
                checkBoxes.forEach(function(item) {
                    item.checked = checked;
                    agreements[item.id] = checked;
                    item.parentNode.classList.toggle("active", checked);
                });
                toggleSubmitButton();
            });
          submitButton.addEventListener('click', function() {
              window.location.href = '../Join/join.jsp';
          }); 
      });
    	  
  */
        function joinCheck() {
            var name = document.getElementById("inputName").value.trim();
            var birth = document.getElementById("inputBirth").value.trim();
            var nickname = document.getElementById("inputNickName").value.trim();
            var id = document.getElementById("inputId").value.trim();
            var pw = document.getElementById("inputPWD").value.trim();
            var pwc = document.getElementById("inputPWDC").value.trim();
            var phone = document.getElementById("inputPhone").value.trim();
            var address = document.getElementById("inputAddress").value.trim();
            var email = document.getElementById("inputEmail").value.trim();

            if (name === "") {
                alert("이름을 입력해주세요.");
                document.getElementById("inputName").focus();
                return false;
            }
            if (birth === "") {
                alert("생년월일을 입력해주세요.");
                document.getElementById("inputBirth").focus();
                return false;
            }
            if (nickname === "") {
                alert("닉네임을 입력해주세요.");
                document.getElementById("inputNickName").focus();
                return false;
            }
            if (id === "") {
                alert("아이디를 입력해주세요.");
                document.getElementById("inputId").focus();
                return false;
            }
            if (pw === "") {
                alert("비밀번호를 입력해주세요.");
                document.getElementById("inputPWD").focus();
                return false;
            }
            if (pwc === "") {
                alert("비밀번호 확인을 입력해주세요.");
                document.getElementById("inputPWDC").focus();
                return false;
            }
            if (phone === "") {
                alert("전화번호를 입력해주세요.");
                document.getElementById("inputPhone").focus();
                return false;
            }
            if (address === "") {
                alert("주소를 입력해주세요.");
                document.getElementById("inputAddress").focus();
                return false;
            }
            if (email === "") {
                alert("이메일을 입력해주세요.");
                document.getElementById("inputEmail").focus();
                return false;
            }
            if (pw !== pwc) {
                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                document.getElementById("inputPWDC").focus();
                return false;
            }

            document.getElementById("joinForm").submit();
        }
    </script>
</head>
<body>
<%@include file="../layout/Header.jsp"%>
<div style = "margin-bottom:;">

<div class="wrap">
    <div class="contents">
        <div class="join_wrapper2">
    <div class="logo"> 회원가입 </div>
            <div class="join_form">
                 <form action="join.jsp" method="post" id ="form__wrap">
                    <div class="col-md-6">
                        <label for="inputName" class="form-label">성명</label>
                        <input type="text" class="form-control" id="inputName" name="name" placeholder="성명 입력">
                    </div>
                    <div class="col-md-6">
                        <label for="inputBirth" class="form-label">생년월일</label>
                        <input type="number" class="form-control" id="inputBirth" name="birth" placeholder="생년월일 입력">
                    </div>
                    <div class="form-inline w-85">
                        <div class="col-12">
                            <label for="inputNickName" class="form-label">닉네임</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="inputNickName" name="nickname" placeholder="한글만 입력하세요">
                                <button type="button" class="btn btn-danger">중복 확인</button>
                            </div>
                        </div>
                    </div>
                    <div class="form-inline w-100">
                        <div class="col-12">
                            <label for="inputId" class="form-label">아이디</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="inputId" name="id" placeholder="10자 이하">
                                <button type="button" class="btn btn-danger">중복 확인</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="inputPWD" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" id="inputPWD" name="pw" placeholder="20자 이하">
                    </div>
                    <div class="col-12">
                        <label for="inputPWDC" class="form-label">비밀번호 확인</label>
                        <input type="password" class="form-control" id="inputPWDC" name="pwc" placeholder="위와 같이 입력하세요">
                    </div>
                    <div class="col-12">
                        <label for="inputPhone" class="form-label">전화번호</label>
                        <input type="text" class="form-control" id="inputPhone" name="phone" placeholder="숫자만 입력하세요.">
                    </div>
                    <div class="col-12">
                        <label for="inputEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="inputEmail" name="email" placeholder="이메일을 입력하세요.">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">주소</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputAddress" name="address" placeholder="주소 입력">
                            <button type="button" class="btn btn-danger">주소 검색</button>
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="inputAddress2" class="form-label">상세 주소</label>
                        <input type="text" class="form-control" id="inputAddress2" name="address2" placeholder="상세 주소 입력">
                    </div>
                   <div class = "blank">
                   
                   </div>

   <!--                 <div class="terms__box">
                        <div class="input__check">
                            <input  type="checkbox" id="privacyPolicy" name ="agreement"value="privacyPolicy" required>
                            <label class="required" for="privacyPolicy"> 회원가입 하시겠습니까 ? </label>
                        </div>
                   </div> -->
                  <% if (message != null) { %>
        <p><%= message %></p>
    <% } %>
                <div class="d-grid gap-2">
                    <a href="../Mainpage.jsp" class="btn btn-secondary btn-lg">뒤로 가기</a>
                    <button type="submit" class="btn btn-primary btn-lg" name = "loginButton" onclick="joinCheck();">회원 가입</button>
                
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<div style = "margin-top:60%;">
<%@include file="../layout/Footer.jsp"%>
</div>
</body>
</html>