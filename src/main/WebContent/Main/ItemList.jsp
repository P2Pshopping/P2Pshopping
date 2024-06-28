<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<style>
.container {
	background-color: #fff;
	padding: 20px;
	margin-top: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

</style>
<meta charset="UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품메뉴</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

	<%@include file="../layout/Header.jsp"%>
<div class="row">
<figure style="display: flex;  justify-content: center">
  <blockquote class="blockquote" style="width:1200px; display: flex;  justify-content: flex-start">
<p style="margin-top: 10%; margin-bottom: -3%; display: flex;  justify-content: flex-start; font-size: 20px; font-weight:700;">상품메뉴</p>
  </blockquote>
</figure>
</div>
<hr color="black" size="2px" width="1200px" style="margin-left:auto; margin-right:auto;">

	<div class="flex-center" style="margin-top:5%;">
		<div class="container"
			style="display: flex-center; justify-content: center; max-width: 1200px;">
			<div class="row">
				<div class="col" style="width: 25%; border: 1px">
				

<div style="display:flex; justify-content:center; width:1200px;">
  <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" >
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Home</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Profile</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Contact</button>
  </li>
</ul>
<div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">...</div>
  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">...</div>
  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">...</div>
  <div class="tab-pane fade" id="pills-disabled" role="tabpanel" aria-labelledby="pills-disabled-tab" tabindex="0">...</div>
</div>
</div>
<div class="container">
    <h1>상품 목록</h1>
    <div class="items">
        <c:forEach var="item" items="${itemList}">
            <div class="item">
                <img src="shopsave/${item.photo}" alt="${item.name}">
                <h2>${item.name}</h2>
                <strike>${item.price}원</strike>
                <div class="sale">${sale}%</div>
                <div class="price">
                    ${item.price - (item.price * sale / 100)}원
                </div>
            </div>
        </c:forEach>
    </div>
</div>

	</div>
	</div>
	</div>
	</div>

<%@ include file="../layout/Footer.jsp"%>

</body>
</html>