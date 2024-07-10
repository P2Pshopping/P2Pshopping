<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

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

body {
	font-size: 13px;
}

#container {
	width: 1200px;
	padding: 20px;
	margin: 0 auto;
}

#contents {
	flex-grow: 1;
	padding: 0px;
	margin: 20px;
}

#gallery img {
	width: 50%;
	height: auto;
}

#caption {
	padding: 10px;
	font-size: 14px;
	color: #333;
}

#gallery {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	flex-direction: row;
	align-content: center;
	justify-content: space-between;
}

#gallery-item {
	width: calc(25% - 20px);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow: hidden;
	text-align: center;
	margin-bottom: 20px;
	cursor: pointer;
	transition: transform 0.3s ease-in-out;
}

#gallery-item:hover {
	transform: scale(1.05);
}

.flex-container {
	display: flex;
	justify-content: center;
}

#footer {
	overflow: hidden;
	width: 1200px;
	margin: 0 auto;
	padding-bottom: 25px;
	background: url(/img/imfs/main/bg_footer.jpg) repeat-x;
	font-family: "Noto Sans KR";
	font-weight: 400;
	font-size: 12px;
	color: black;
	background-color: whitesmoke;
	z-index: 2;
}

.paging {
	margin-top: 20px;
	text-align: center;
}

.paging a {
	display: inline-block;
	padding: 6px 12px;
	margin: 0px 3px;
	border: 1px solid #ddd;
	background-color: #f5f5f5;
	color: #337ab7;
	text-decoration: none;
	border-radius: 3px;
}

.paging .current {
	background-color: #337ab7;
	color: white;
	border: 1px solid #337ab7;
}

.paging a:hover {
	background-color: #ddd;
}

.elapsed-time {
    font-size: 12px;
    color: darkgrey;
}

</style>

<script>
	// JavaScript 함수 정의
	function calculateElapsedTime(dateStr) {
		var date = new Date(dateStr);
		var now = new Date();

		var seconds = Math.floor((now - date) / 1000);

		if (seconds < 60) {
			return '방금 전';
		}

		var minutes = Math.floor(seconds / 60);
		if (minutes < 60) {
			return minutes + '분 전';
		}

		var hours = Math.floor(minutes / 60);
		if (hours < 24) {
			return hours + '시간 전';
		}

		var days = Math.floor(hours / 24);
		return days + '일 전';
	}
</script>

<meta charset="UTF-8">
<title>i-Market</title>
</head>
<body class="custom-body">


	<%@include file="../layout/Header.jsp"%>
	<div class="mainwrrap">
		<div style="display: flex; justify-content: center;">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="carousel" style="width: 1200px;">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="3" aria-label="Slide 4"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="4" aria-label="Slide 5"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<a href="${pageContext.request.contextPath}/Main/default.jsp"><img
							src="${pageContext.request.contextPath}/Image/logobanner.png"
							class="pics" alt="..." width="1200" height="450"></a>
					</div>
					<div class="carousel-item">
						<a href="${pageContext.request.contextPath}/itemList/ItemList.do"><img
							src="https://baby-direct.com.au/cdn/shop/files/Copy_of_Pink_and_Tan_Flowers_Modern_Artisan_Business_X-Frame_Banner_4_1200x.png?v=1641170892"
							class="pics" alt="..." width="1200" height="450"></a>
					</div>
					<div class="carousel-item">
						<a href="${pageContext.request.contextPath}/itemList/ItemList.do"><img
							src="https://cdn.shopify.com/s/files/1/0082/8070/3056/files/eggbanner.jpg?v=1559160385"
							class="pics" alt="..." width="1200" height="450"></a>
					</div>
					<div class="carousel-item">
						<a href="${pageContext.request.contextPath}/itemList/ItemList.do"><img
							src="https://cdn.shopify.com/s/files/1/0082/8070/3056/files/KINGS_BABYSHOP_-_Oyster3_-_1200_x_400px.jpg?v=1559245858"
							class="pics" alt="..." width="1200" height="450"></a>
					</div>
					<div class="carousel-item">
						<a href="${pageContext.request.contextPath}/itemList/ItemList.do"><img
							src="https://angusanddudleycollections.com.au/cdn/shop/files/A_D_Website_Banner_3000_x_1200_px_50806e8f-e8ad-4e00-bb42-13ce6e502bcd_1600x.png?v=1715729012"
							class="pics" alt="..." width="1200" height="450"></a>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<div>
			<figure>
				<blockquote class="blockquote">
					<p
						style="margin-top: 30px; display: flex; justify-content: center; font-size: 20px; font-weight: 700;">우리동네
						인기판매상품</p>
				</blockquote>
			</figure>
		</div>
		<hr color="black" size="4px" width="1200px"
			style="margin-left: auto; margin-right: auto;">
		<div class="flex-center" style="margin-top: 3%;">
			<div class="container"
				style="display: flex-center; justify-content: center; max-width: 1200px;">
				<div id="gallery">
					<c:choose>
						<c:when test="${empty product}">
							<div id="gallery-item">
								<p>등록된 게시물이 없습니다^^*</p>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="item" items="${product}" varStatus="loop">
								<div id="gallery-item"
								onclick="location.href='${pageContext.request.contextPath}/DetailPage/DetailPage.jsp?productid=${item.productid}';">
								<c:if test="${not empty item.imgUrl_1}">
									<img src="${pageContext.request.contextPath}/${item.imgUrl_1}" alt="..."
										style="width: 200px; height: 200px; object-fit: cover;">
								</c:if>

								<p
									style="font-style: normal; font-size: 18px; font-weight: 700; display: flex; flex-direction: row; margin: 10px; align-items: stretch; justify-content: space-between; align-content: space-between; flex-wrap: nowrap;">
									<fmt:formatNumber type="number" pattern="#,##0"
										value="${item.price}" />
									원
									 <span id="elapsedTime_${loop.index}" class="elapsed-time"></span>
								</p>
								<script>
								// 각 상품 항목의 경과 시간 계산 및 출력
								var elapsedTime = calculateElapsedTime('${item.createDate}');
								var elapsedTimeElement = document
										.getElementById('elapsedTime_${loop.index}');
								elapsedTimeElement.textContent = elapsedTime;
								elapsedTimeElement.classList
										.add('elapsed-time');
							</script>
									

								<a style="font: 'pretendard', sans-serif;">${item.productName}</a>
							</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<!-- ======= ----------------------------------------------------------------------------------------->
	<!--    <%@include file="../layout/Header.jsp"%>
   <div class="mainwrrap">
      <div style="display: flex; justify-content: center;">
         <div id="carouselExampleIndicators" class="carousel slide"
            data-bs-ride="carousel" style="width: 1200px;">
            <div class="carousel-indicators">
               <button type="button" data-bs-target="#carouselExampleIndicators"
                  data-bs-slide-to="0" class="active" aria-current="true"
                  aria-label="Slide 1"></button>
               <button type="button" data-bs-target="#carouselExampleIndicators"
                  data-bs-slide-to="1" aria-label="Slide 2"></button>
               <button type="button" data-bs-target="#carouselExampleIndicators"
                  data-bs-slide-to="2" aria-label="Slide 3"></button>
               <button type="button" data-bs-target="#carouselExampleIndicators"
                  data-bs-slide-to="3" aria-label="Slide 4"></button>
               <button type="button" data-bs-target="#carouselExampleIndicators"
                  data-bs-slide-to="4" aria-label="Slide 5"></button>
            </div>
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <a href="${pageContext.request.contextPath}/Main/default.jsp"><img
                     src="${pageContext.request.contextPath}/Image/logobanner.png" class="pics" alt="..." width="1200"
                     height="450"></a>
               </div>
               <div class="carousel-item">
                  <a href="${pageContext.request.contextPath}/itemList/ItemList.do"><img
                     src="https://baby-direct.com.au/cdn/shop/files/Copy_of_Pink_and_Tan_Flowers_Modern_Artisan_Business_X-Frame_Banner_4_1200x.png?v=1641170892"
                     class="pics" alt="..." width="1200" height="450"></a>
               </div>
               <div class="carousel-item">
                  <a href="${pageContext.request.contextPath}/itemList/ItemList.do"><img
                     src="https://cdn.shopify.com/s/files/1/0082/8070/3056/files/eggbanner.jpg?v=1559160385"
                     class="pics" alt="..." width="1200" height="450"></a>
               </div>
               <div class="carousel-item">
                  <a href="${pageContext.request.contextPath}/itemList/ItemList.do"><img
                     src="https://cdn.shopify.com/s/files/1/0082/8070/3056/files/KINGS_BABYSHOP_-_Oyster3_-_1200_x_400px.jpg?v=1559245858"
                     class="pics" alt="..." width="1200" height="450"></a>
               </div>
               <div class="carousel-item">
                  <a href="${pageContext.request.contextPath}/itemList/ItemList.do"><img
                     src="https://angusanddudleycollections.com.au/cdn/shop/files/A_D_Website_Banner_3000_x_1200_px_50806e8f-e8ad-4e00-bb42-13ce6e502bcd_1600x.png?v=1715729012"
                     class="pics" alt="..." width="1200" height="450"></a>
               </div>
            </div>
            <button class="carousel-control-prev" type="button"
               data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
               <span class="carousel-control-prev-icon" aria-hidden="true"></span>
               <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button"
               data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
               <span class="carousel-control-next-icon" aria-hidden="true"></span>
               <span class="visually-hidden">Next</span>
            </button>
         </div>
      </div>
      <div>
         <figure>
            <blockquote class="blockquote">
               <p
                  style="margin-top: 30px; display: flex; justify-content: center; font-size: 20px; font-weight: 700;">우리동네
                  인기판매상품</p>
            </blockquote>
         </figure>
      </div>
      <hr color="black" size="4px" width="1200px"
         style="margin-left: auto; margin-right: auto;">
      <div class="flex-center" style="margin-top: 3%;">
         <div class="container"
            style="display: flex-center; justify-content: center; max-width: 1200px;">
            <div id="gallery">
               <c:choose>
                  <c:when test="${empty product}">
                     <div id="gallery-item">
                        <p>등록된 게시물이 없습니다^^*</p>
                     </div>
                  </c:when>
                  <c:otherwise>
                     <c:forEach var="item" items="${product}" varStatus="loop">
                        <div id="gallery-item"
                           onclick="location.href='${pageContext.request.contextPath}/DetailPage/DetailPage.jsp?productid=${item.productid}';">
                           <c:if test="${not empty item.imgUrl_1}">
                              <img src="${pageContext.request.contextPath}/${item.imgUrl_1}" alt="..."
                                 style="width: 200px; height: 200px; object-fit: cover;">
                           </c:if>
                           <p>제목 : ${item.productName}</p>
                           <p>작성자 ID: ${item.username}</p>
                           <p>가격: ${item.price}</p>
                        </div>
                     </c:forEach>
                  </c:otherwise>
               </c:choose>
            </div>
         </div>
      </div>
   </div> -->

<!-- >>>>>>> master ------------------------------------------------>
<!-- <script>
document.addEventListener('DOMContentLoaded', function() {
    // 페이지 로드 시 방문 기록 저장
    var pageUrl = window.location.pathname + window.location.search;
    $.ajax({
        url: '<%= request.getContextPath() %>/track',
        method: 'GET',
        data: { pageUrl: pageUrl },
        success: function(response) {
            console.log('Visit recorded');
            
            // 첫 번째 AJAX 요청: 제품 수 가져오기
            $.ajax({
                url: "${pageContext.request.contextPath}/ProductCnt.do",
                type: "GET",
                dataType: "json",
                success: function(data) {
                    console.log("Received product count:", data);
                    $("#productCount").text("총 상품 수: " + data.productCount);
                },
                error: function(xhr, status, error) {
                    console.error("Error fetching product count:", error);
                }
            });
        },
        error: function(xhr, status, error) {
            console.error('Error recording visit:', error);
        }
    });
});




</script> -->

</body>
<%@ include file="../layout/Footer.jsp"%>

</html>
