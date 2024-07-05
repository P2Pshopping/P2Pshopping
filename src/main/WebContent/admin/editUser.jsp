<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            background-color: #343a40;
            color: white;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-control {
            background-color: #495057;
            color: white;
            border: none;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
    </style>
</head>
<%@include file="../layout/Header.jsp"%>
<body>

    <div class="container mt-5">
        <h2>Edit User</h2>
        <form action="${pageContext.request.contextPath}/admin/users/updateUser" method="post">
            <input type="hidden" name="id" value="${user.id}" />
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" value="${user.username}" required>
            </div>
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${user.name}" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" class="form-control" id="address" name="address" value="${user.address}" required>
            </div>
            <div class="form-group">
                <label for="auth">Auth</label>
                <input type="text" class="form-control" id="auth" name="auth" value="${user.auth}" required>
            </div>
            <div class="form-group">
                <label for="active">Active</label>
                <input type="text" class="form-control" id="active" name="active" value="${user.active}" required>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</body>
<%@ include file="../layout/Footer.jsp"%>
</html>
