<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../iMarket/CSS/style-header.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>파일 첨부형 게시판</title>
<style>
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
}

#gallery-item {
	width: calc(33.333% - 20px);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	overflow: hidden;
	text-align: center;
	margin-bottom: 20px;
	cursor: pointer; /* 마우스 포인터를 손가락 모양으로 변경 */
	transition: transform 0.3s ease-in-out; /* 호버 시 부드러운 변화를 위한 트랜지션 설정 */
}

#gallery-item:hover {
	transform: scale(1.05); /* 호버 시 약간 확대되도록 스케일 변환 */
}

#left-sidebar {
	width: 200px;
	margin-bottom: 20px;
	margin-right: 20px;
	font-family: "Noto Sans KR";
	font-size: 12px;
	margin-top: 200px; /* 예시로 상단에서 50px 위치로 이동 */
	margin-left: 20px;
}

#right-sidebar {
	width: 150px;
	margin-bottom: 20px;
}

#right-sidebar img {
	margin: 0 auto;
	padding: 0px;
	width: 75px;
	height: 75px;
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
</style>
</head>
<body>
	<%@include file="../layout/Header.jsp"%>

	<h2>파일 첨부형 게시판 - 목록 보기(List)</h2>

	<div id="contents">
		<h2>게시판</h2>
		<div id="gallery">
			<c:choose>
				<c:when test="${empty product}">
					<div id="gallery-item">
						<p>등록된 게시물이 없습니다^^*</p>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${product}" var="ItemListDTO" varStatus="loop">
					<div id="caption">
                <h5>${ItemListDTO.productName}</h5>
                <p>가격: ${ItemListDTO.price}</p>
                <p>작성자 ID: ${ItemListDTO.username}</p>
              </div>
						<div id="gallery-item"
							onclick="location.href='${pageContext.request.contextPath}/DetailPage/DetailPage.jsp';">
							<c:if test="${not empty ItemListDTO.imgUrl_1}">
								<img src="${ItemListDTO.imgUrl_1}"
									alt="${ItemListDTO.imgUrl_1}" />
							</c:if>
							<div id="caption">${ItemListDTO.productName}</div>
							<p>작성자 ID: ${ItemListDTO.username}</p>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>