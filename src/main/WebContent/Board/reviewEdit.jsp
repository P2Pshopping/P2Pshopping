<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
   /*  body {
        background-color: #f8f9fa;
        font-family: Arial, sans-serif;
    } */
    .container {
        margin-top: 50px;
    }
    .card {
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }
    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
</style>
</head>
<body 
	style="overflow-x: scroll; margin: 0 auto; width: 1200px; align-items: center; background-color:#f7f7f7;">
    <%@include file="../layout/Header.jsp"%>
<div class="container">
    <div class="card">
        <div class="card-header">
            <h2>리뷰 수정</h2>
        </div>
        <div class="card-body">
            <form action="edit" method="post">
                <input type="hidden" name="id" value="${review.id}">
                <div class="mb-3">
                    <label for="title" class="form-label">제목:</label>
                    <input type="text" class="form-control" id="title" name="title" value="${review.title}" required>
                </div>
                <div class="mb-3">
                    <label for="detail" class="form-label">내용:</label>
                    <textarea class="form-control" id="detail" name="detail" required>${review.detail}</textarea>
                </div>
                <div class="mb-3">
                    <label for="rating" class="form-label">평점:</label>
                    <input type="number" class="form-control" id="rating" name="rating" value="${review.rating}" min="1" max="10" required>
                </div>
                <div class="mb-3">
                    <label for="ofile" class="form-label">원본 파일명:</label>
                    <input type="text" class="form-control" id="ofile" name="ofile" value="${review.ofile}">
                </div>
                <div class="mb-3">
                    <label for="sfile" class="form-label">저장 파일명:</label>
                    <input type="text" class="form-control" id="sfile" name="sfile" value="${review.sfile}">
                </div>
                <button type="submit" class="btn btn-primary">수정</button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
<%@ include file="../layout/Footer.jsp"%>
</html>
