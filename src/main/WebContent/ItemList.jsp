<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.flex-container {
	width: 1200px;
	display: flex;
	justify-content: center; /* 좌우정렬 */
	align-items: center; /* 상하정렬 */
	flex-direction: row; /* 세로정렬 */
	flex-wrap: wrap; /* 폭이 넘치는 요소 wrap 처리 */
}

.body {
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품메뉴</title>

</head>
<body
	style="overflow-x: scroll; margin: 0 auto; width: 1200px; align-items: center;">

	<%@include file="layout/Header.jsp"%>
<div class="row">
<figure>
  <blockquote class="blockquote">
<p style="margin-top: 10%; margin-bottom: -45px; display: flex; justify-content: flex-start; font-size: 20px; font-weight:700;">상품메뉴</p>
  </blockquote>
</figure>
</div>
<hr color="black" size="2px" width="1200px" style="margin-left:auto; margin-right:auto;">
	<div class="flex-center" style="margin-top:5%;">
		<div class="container"
			style="display: flex-center; justify-content: center; max-width: 1200px;">
			<div class="row">
				<div class="col" style="width: 25%; border: 1px">
					<img src="../iMarket/Image/babe1.jpg" style="width: 350px;">
				</div>
				<div class="col" style="width: 25%">
					<img src="../iMarket/Image/babe1.jpg" style="width: 350px;">
				</div>
				<div class="col" style="width: 25%">
					<img src="../iMarket/Image/babe1.jpg" style="width: 350px;">
				</div>
			</div>
		</div>
		<div class="container"
			style="display: flex-center; justify-content: center; max-width: 1200px; margin-top:5%;">
			<div class="row">
				<div class="col" style="width: 25%; border: 1px">
					<img src="../iMarket/Image/babe1.jpg" style="width: 350px;">
					<a></a>
				</div>
				<div class="col" style="width: 25%">
					<img src="../iMarket/Image/babe1.jpg" style="width: 350px;">
				</div>
				<div class="col" style="width: 25%">
					<img src="../iMarket/Image/babe1.jpg" style="width: 350px;">
				</div>
			</div>
		</div>
	</div>
</body>
</html>