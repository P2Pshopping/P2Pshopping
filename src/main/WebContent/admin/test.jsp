<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin - Category Management</title>
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
        .table {
            background-color: #495057;
            color: white;
        }
        .table th, .table td {
            border-color: #6c757d;
        }
    </style>
</head>
<%@include file="../layout/Header.jsp"%>

<body>
    <div class="container mt-5">
        <h2>Category Management</h2>
        
        <table class="table table-dark table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>URL</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="category" items="${categoryList}">
                    <tr>
                        <td>${category.id}</td>
                        <td>${category.name}</td>
                        <td>${category.url}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
<%@ include file="../layout/Footer.jsp"%>

</html>
