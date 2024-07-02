<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>거래 후기 리스트</title>
</head>
<body>
<h2>거래 후기 리스트</h2>
<c:if test="${empty reviews}">
    <p>No reviews found.</p>
</c:if>
<table border="1">
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
                <td>${review.title}</td>
                <td>${review.detail}</td>
                <td>${review.rating}</td>
                <td>${review.transactionDate}</td>
                <td>${review.sellerName}</td>
                <td>${review.buyerName}</td>
                <td>${review.productName}</td>
                <td><img src="../uploads/${review.sfile}" alt="${review.ofile}" width="100"/></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>