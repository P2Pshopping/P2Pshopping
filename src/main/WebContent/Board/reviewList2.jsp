<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>거래 후기 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f8f9fa;
        font-family: Arial, sans-serif;
    }
    .container {
        margin-top: 50px;
    }
    .table {
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
<div class="container">
    <h2 class="text-center">거래 후기 리스트</h2>
    <c:if test="${empty reviews}">
        <p class="text-center">등록된 후기가 없습니다.</p>
    </c:if>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>거래 ID</th>
                <th>제목</th>
                <th>상세내용</th>
                <th>평점</th>
                <th>거래 날짜</th>
                <th>판매자 이름</th>
                <th>구매자 이름</th>
                <th>상품 이름</th>
                <th>사진</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="review" items="${reviews}">
                <tr>
                    <td>${review.id}</td>
                    <td><a href="../review/view?id=${review.id}">${review.title}</a></td>
                    <td>${review.detail}</td>
                    <td>${review.rating}</td>
                    <td>${review.transactionDate}</td>
                    <td>${review.sellerName}</td>
                    <td>${review.buyerName}</td>
                    <td>${review.productName}</td>
                    <td><img src="/review/images/${review.sfile}" alt="${review.ofile}" width="100"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="text-center">
        <a href="../review/write" class="btn btn-primary">글 작성</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
