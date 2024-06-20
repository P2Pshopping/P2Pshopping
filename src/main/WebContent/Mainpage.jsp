<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><meta name="viewport" content="width=device-width, initial-scale=1">

<meta charset="UTF-8">
<title>i-Market</title>
</head>
<body>

<%@include file="layout/Header.jsp"%>

<div style="display: flex; justify-content: center;">
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style=" width : 1200px;" >
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
  </div>
  <div class="carousel-inner">
  <div class="carousel-item active">
      <a><img src="Image/logobanner.png" class="pics" alt="..." width="1200" height="450"></a>
    </div>
    <div class="carousel-item">
      <a><img src="https://baby-direct.com.au/cdn/shop/files/Copy_of_Pink_and_Tan_Flowers_Modern_Artisan_Business_X-Frame_Banner_4_1200x.png?v=1641170892" class="pics" alt="..." width="1200" height="450"></a>
    </div>
    <div class="carousel-item">
      <a><img src="https://cdn.shopify.com/s/files/1/0082/8070/3056/files/eggbanner.jpg?v=1559160385" class="pics" alt="..." width="1200" height="450"></a>
    </div>
    <div class="carousel-item">
      <img src="https://cdn.shopify.com/s/files/1/0082/8070/3056/files/KINGS_BABYSHOP_-_Oyster3_-_1200_x_400px.jpg?v=1559245858" class="pics" alt="..." width="1200" height="450">
    </div>
    <div class="carousel-item">
      <img src="https://angusanddudleycollections.com.au/cdn/shop/files/A_D_Website_Banner_3000_x_1200_px_50806e8f-e8ad-4e00-bb42-13ce6e502bcd_1600x.png?v=1715729012" class="pics" alt="..." width="1200" height="450">
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
<p style="margin-top: 30px;display: flex; justify-content: center; font-size: 20px; font-weight:700;">우리동네 인기판매상품</p>
  </blockquote>
</figure>
</div>

</body>

<%@ include file="layout/Footer.jsp"%>

</html>