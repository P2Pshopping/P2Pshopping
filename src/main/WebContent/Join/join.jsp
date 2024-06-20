<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="utils.JDBConnect" %>
<%@ page import="Joins.UserDAO" %>
<%@ page import="Joins.UserDTO" %>


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
    user.setPassword(password);
    user.setKakaoId(kakaoId);
    user.setNaverId(naverId);
    user.setProvinceId(provinceId);
    user.setCityId(cityId);
    user.setDistrictId(districtId);
    user.setAuth(auth);

    UserDAO memberDAO = null;
    try {
    	memberDAO = new UserDAO(application);
     //   String hashedPassword = memberDAO.hashPassword(password); // 비밀번호 해시
    //    user.setPassword(hashedPassword); // 해시된 비밀번호 설정
          boolean isUserAdded = memberDAO.addUser(user);


        if (isUserAdded) {
            message = "회원가입이 성공적으로 완료되었습니다.";
        } else {
            message = "회원가입에 실패했습니다. 다시 시도해주세요.";
        }
    } catch (Exception e) {
        e.printStackTrace();
        message = "회원가입 중 오류가 발생했습니다: " + e.getMessage();
    } finally {
    	   if (memberDAO != null) {
               memberDAO.close();
        }
    }
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Join</title>
    <link href="text.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
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
<div class="wrap">
    <div class="logo">
        <h1>I-Market</h1>
    </div>
    <div class="contents">
        <div class="join_wrapper2">
            <div class="join_form">
                 <form action="join.jsp" method="post">
                    <div class="col-md-6">
                        <label for="inputName" class="form-label">성명</label>
                        <input type="text" class="form-control" id="inputName" name="name" placeholder="한글만 입력하세요">
                    </div>
                    <div class="col-md-6">
                        <label for="inputBirth" class="form-label">생년월일</label>
                        <input type="number" class="form-control" id="inputBirth" name="birth" placeholder="앞에 6자리 입력하세요">
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
                            <input type="text" class="form-control" id="inputAddress" name="address" placeholder="1234 Main St">
                            <button type="button" class="btn btn-danger">주소 검색</button>
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="inputAddress2" class="form-label">상세 주소</label>
                        <input type="text" class="form-control" id="inputAddress2" name="address2" placeholder="Apartment, studio, or floor">
                    </div>
                    <div class="col-12">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="gridCheck">
                            <label class="form-check-label" for="gridCheck"> 회원가입 하시겠습니까 ? </label>
                        </div>
                    </div>
                </form>
                  <% if (message != null) { %>
        <p><%= message %></p>
    <% } %>
                <div class="d-grid gap-2">
                    <a href="login.jsp" class="btn btn-secondary btn-lg">뒤로 가기</a>
                    <button type="button" class="btn btn-primary btn-lg" onclick="joinCheck();">회원 가입</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>