<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="User.UserDAO" %>
<%@ page import="common.JDBConnect" %>
<%@ page import="common.UserDTO" %>
<%@ page import="jakarta.servlet.ServletContext" %>

<%


String message = null;

if ("POST".equalsIgnoreCase(request.getMethod())) {
    String username = request.getParameter("username");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String password = request.getParameter("password");
    
    
    

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
    user.setUsername(username);
    user.setName(name);
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
        String hashedPassword = memberDAO.hashPassword(password); // 비밀번호 해시
        user.setPassword(hashedPassword); // 해시된 비밀번호 설정
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
    <title>회원가입</title>
</head>
<body>
    <h2>회원가입</h2>
    <form action="SignIn.jsp" method="post">
        <label for="username">아이디:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="name">생년월일:</label>
        <input type="text" id="name" name="birth" required><br>
        <label for="name">닉네임:</label>
        <input type="text" id="name" name="nickname" required><br>
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="phone">전화번호:</label>
        <input type="text" id="phone" name="phone" required><br>
        <label for="address">주소:</label>
        <input type="text" id="address" name="address" required><br>
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required><br>
        <label for="kakaoId">카카오 ID:</label>
        <input type="number" id="kakaoId" name="kakaoId"><br>
        <label for="naverId">네이버 ID:</label>
        <input type="number" id="naverId" name="naverId"><br>
        <label for="provinceId">도 ID:</label>
        <input type="number" id="provinceId" name="provinceId"><br>
        <label for="cityId">시 ID:</label>
        <input type="number" id="cityId" name="cityId"><br>
        <label for="districtId">구 ID:</label>
        <input type="number" id="districtId" name="districtId"><br>
        <label for="auth">권한:</label>
        <input type="text" id="auth" name="auth" value="user" readonly><br>
        <button type="submit">가입하기</button>
    </form>

    <% if (message != null) { %>
        <p><%= message %></p>
    <% } %>
</body>
</html>

