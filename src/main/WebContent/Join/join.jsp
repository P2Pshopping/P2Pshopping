<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<%@ page import="User.UserDAO" %>
<%@ page import="common.UserDTO" %>
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



<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Join</title>
 <script>
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
            event.preventDefault();
            return false;
        } else if (birth === "") {
            alert("생년월일을 입력해주세요.");
            document.getElementById("inputBirth").focus();
            event.preventDefault();
            return false;
        } else if (nickname === "") {
            alert("닉네임을 입력해주세요.");
            document.getElementById("inputNickName").focus();
            event.preventDefault();
            return false;
        } else if (id === "") {
            alert("아이디를 입력해주세요.");
            document.getElementById("inputId").focus();
            event.preventDefault();
            return false;
        } else if (pw === "") {
            alert("비밀번호를 입력해주세요.");
            document.getElementById("inputPWD").focus();
            event.preventDefault();
            return false;
        } else if (pwc === "") {
            alert("비밀번호 확인을 입력해주세요.");
            document.getElementById("inputPWDC").focus();
            event.preventDefault();
            return false;
        } else if (pw !== pwc) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            document.getElementById("inputPWDC").focus();
            event.preventDefault();
            return false;
        } else if (phone === "") {
            alert("전화번호를 입력해주세요.");
            document.getElementById("inputPhone").focus();
            event.preventDefault();
            return false;
        } else if (email === "") {
            alert("이메일을 입력해주세요.");
            document.getElementById("inputEmail").focus();
            event.preventDefault();
            return false;
        } else if (address === "") {
            alert("주소를 입력해주세요.");
            document.getElementById("inputAddress").focus();
            event.preventDefault();
            return false;
        }
        return true;
    }
</script>

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

    // 서버 측에서 추가적인 유효성 검사 및 회원가입 처리 로직
    // 예를 들어, 이메일 중복 체크 등의 로직을 수행할 수 있습니다.

    UserDTO user = new UserDTO();
    user.setName(name);
    user.setUsername(username);
    user.setEmail(email);
    user.setPhone(phone);
    user.setAddress(address);
    user.setNickname(nickname);
    user.setPassword(password);
    // 필요한 경우 다른 필드들도 설정

    UserDAO userDAO = null;
    try {
        userDAO = new UserDAO(application);
        String hashedPassword = userDAO.hashPassword(password); // 비밀번호 해시
        user.setPassword(hashedPassword); // 해시된 비밀번호 설정
        boolean isUserAdded = userDAO.addUser(user);

        if (isUserAdded) {
            message = "회원가입이 성공적으로 완료되었습니다.";
%>
<script>
    window.location.href = "../Login/login.jsp";
    alert("회원가입에 성공하였습니다.");
</script>
<%
        } else {
            message = "입력칸을 다시 한 번 확인해주세요.";
%>
<script>
    alert("입력칸을 다시 한 번 확인해주세요.");
    event.preventDefault(); // 폼 제출을 중단
</script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
        // 예외 처리 로직 추가
    } finally {
        if (userDAO != null) {
            userDAO.close();
        }
    }
}
%>

 	
</head>
<body>
<%@include file="../layout/Header.jsp"%>
<div style = "margin-top:400px;">

<div class="wrap">
    <div class="contents">
        <div class="join_wrapper2">
    <div class="logo"> 회원가입 </div>
            <div class="join_form">
                 <form action="join.jsp" method="post" id ="form__wrap" onsubmit = "joincheck();">
                    <div class="col-12">
                        <label for="inputName" class="form-label">성명</label>
                        <input type="text" class="form-control" id="inputName" name="inputName" placeholder="성명 입력">
                    </div>
                    <div class="col-12">
                        <label for="inputBirth" class="form-label">생년월일</label>
                        <input type="number" class="form-control" id="inputBirth" name="inputBirth" placeholder="생년월일 입력">
                    </div>
                    <div class="form-inline w-85">
                        <div class="col-12">
                            <label for="inputNickName" class="form-label">닉네임</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="inputNickName" name="inputNickName" placeholder="한글만 입력하세요">
                                <button type="button" class="btn btn-danger">중복 확인</button>
                            </div>
                        </div>
                    </div>
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
                    <div class="col-12">
                        <label for="inputPhone" class="form-label">전화번호</label>
                        <input type="text" class="form-control" id="inputPhone" name="inputPhone" placeholder="숫자만 입력하세요.">
                    </div>
                    <div class="col-12">
                        <label for="inputEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="이메일을 입력하세요.">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">주소</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputAddress" name="inputAddress" placeholder="주소 입력">
                            <button type="button" class="btn btn-danger">주소 검색</button>
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="inputAddress2" class="form-label">상세 주소</label>
                        <input type="text" class="form-control" id="inputAddress2" name="inputAddress2" placeholder="상세 주소 입력">
                    </div>
                   <div class = "blank">
                   
                   </div>
                   <p>
                   </p>

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
<div style = "margin-top:600px;">
<%@include file="../layout/Footer.jsp"%>
</div>
</body>
</html>