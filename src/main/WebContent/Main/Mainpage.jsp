<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../iMarket/CSS/style-header.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .custom-body {
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
    </style>
    <meta charset="UTF-8">
    <title>i-Market</title>
</head>
<body class="custom-body">

    <%@include file="../layout/Header.jsp"%>
    <div class="mainwrrap">
        <div style="display: flex; justify-content: center;">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="width: 1200px;">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <a href="../Main/Mainpage.jsp"><img src="../Image/logobanner.png" class="pics" alt="..." width="1200" height="450"></a>
                    </div>
                    <div class="carousel-item">
                        <a href="${pageContext.request.contextPath}/itemList/ItemList.do"><img src="https://baby-direct.com.au/cdn/shop/files/Copy_of_Pink_and_Tan_Flowers_Modern_Artisan_Business_X-Frame_Banner_4_1200x.png?v=1641170892" class="pics" alt="..." width="1200" height="450"></a>
                    </div>
                    <div class="carousel-item">
                         <a href="${pageContext.request.contextPath}/itemList/ItemList.do"><img src="https://cdn.shopify.com/s/files/1/0082/8070/3056/files/eggbanner.jpg?v=1559160385" class="pics" alt="..." width="1200" height="450"></a>
                    </div>
                    <div class="carousel-item">
                         <a href="${pageContext.request.contextPath}/itemList/ItemList.do"><img src="https://cdn.shopify.com/s/files/1/0082/8070/3056/files/KINGS_BABYSHOP_-_Oyster3_-_1200_x_400px.jpg?v=1559245858" class="pics" alt="..." width="1200" height="450"></a>
                    </div>
                    <div class="carousel-item">
                         <a href="${pageContext.request.contextPath}/itemList/ItemList.do"><img src="https://angusanddudleycollections.com.au/cdn/shop/files/A_D_Website_Banner_3000_x_1200_px_50806e8f-e8ad-4e00-bb42-13ce6e502bcd_1600x.png?v=1715729012" class="pics" alt="..." width="1200" height="450"></a>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <div>
            <figure>
                <blockquote class="blockquote">
                    <p style="margin-top: 30px; display: flex; justify-content: center; font-size: 20px; font-weight: 700;">우리동네 인기판매상품</p>
                </blockquote>
            </figure>
        </div>
        <hr color="black" size="4px" width="1200px" style="margin-left: auto; margin-right: auto;">
        <div class="flex-center" style="margin-top: 3%;">
            <div class="container" style="display: flex-center; justify-content: center; max-width: 1200px;">
                <div class="row">
                    <div class="col" style="width: 25%; border: 1px">
                        <img src="../Image/babe1.jpg" style="width: 350px;">
                    </div>
                    <div class="col" style="width: 25%">
                        <img src="../Image/babe1.jpg" style="width: 350px;">
                    </div>
                    <div class="col" style="width: 25%">
                        <img src="../Image/babe1.jpg" style="width: 350px;">
                    </div>
                </div>
            </div>
            <div class="container" style="display: flex-center; justify-content: center; max-width: 1200px; margin-top: 5%;">
                <div class="row">
                    <div class="col" style="width: 25%; border: 1px">
                        <img src="../Image/babe1.jpg" style="width: 350px;">
                    </div>
                    <div class="col" style="width: 25%">
                        <img src="../Image/babe1.jpg" style="width: 350px;">
                    </div>
                    <div class="col" style="width: 25%">
                        <img src="../Image/babe1.jpg" style="width: 350px;">
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
document.addEventListener('DOMContentLoaded', function() {

	  // 페이지 로드 시 방문 기록 저장
  var pageUrl = window.location.pathname + window.location.search;
  $.ajax({
      url: '<%= request.getContextPath() %>/track',
      method: 'GET',
      data: { pageUrl: pageUrl },
      success: function(response) {
          console.log('Visit recorded');
      },
      error: function(xhr, status, error) {
          console.error('Error recording visit:', error);
      }
  });
});
</script>
<%@ include file="../layout/Footer.jsp"%>

</html>
