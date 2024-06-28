<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>관리자님 환영합니다</h2>
        <p>상세보기:</p>
       
         <a href="${pageContext.request.contextPath}/admin/users.do" class="btn btn-primary">회원관리</a>
        <a href="${pageContext.request.contextPath}/admin/categories.do" class="btn btn-secondary">카테고리관리</a>
    </div>
</body>
</html>
