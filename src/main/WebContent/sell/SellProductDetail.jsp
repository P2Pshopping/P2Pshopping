<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세보기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            margin-top: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .photo-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .photo-section img {
            width: 30%;
            border-radius: 8px;
        }
        .info-section, .seller-info {
            margin-bottom: 20px;
        }
        .info-section p, .seller-info p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
<%@include file="../layout/Header.jsp"%>
<div class="container">
    <h2>상품 상세보기</h2>
    <div class="photo-section">
        <img src="stroller.jpg" alt="Stroller">
        <img src="pinwheel.jpg" alt="Pinwheel">
        <img src="camera-icon.png" alt="Add more photos">
    </div>
    
    <div class="info-section">
        <h3>상품명</h3>
        <p><%= request.getParameter("productName") %></p>
        
        <h3>상품설명</h3>
        <p><%= request.getParameter("productDescription") %></p>
        
        <h3>가격</h3>
        <p><%= request.getParameter("price") %> 원</p>
    </div>
    
    <div class="seller-info">
        <h3>판매자 정보</h3>
        <p>성함: 서준맘</p>
        <p>위치: 대전광역시 서구 갈마2동</p>
        <p>이메일: seojooni@naver.com</p>
        <p>휴대폰: </p>
    </div>
</div>

</body>
<%@ include file="../layout/Footer.jsp"%>
</html>
