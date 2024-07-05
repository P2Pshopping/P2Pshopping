<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>거래 후기 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f8f9fa;
        font-family: Arial, sans-serif;
    }
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
<body>
<jsp:include page="../layout/Header.jsp" />
<div class="container">
    <div class="card">
        <div class="card-header">
            <h2>${review.title}</h2>
        </div>
        <div class="card-body">
            <p><strong>상세 내용:</strong> ${review.detail}</p>
            <p><strong>평점:</strong> ${review.rating}</p>
            <p><strong>거래 날짜:</strong> ${review.transactionDate}</p>
            <p><strong>판매자 이름:</strong> ${review.sellerName}</p>
            <p><strong>구매자 이름:</strong> ${review.buyerName}</p>
            <p><strong>상품 이름:</strong> ${review.productName}</p>
            <p><strong>사진:</strong><br><img src="<c:url value='/review/images/${review.sfile}'/>" alt="${review.ofile}" width="200"/></p>
            <a href="edit?id=${review.id}" class="btn btn-primary">수정</a>
                <a href="delete?id=${review.id}" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
	<jsp:include page="../layout/Footer.jsp" />
</html>
