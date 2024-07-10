<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
int currentPage = (Integer) request.getAttribute("currentPage");
int totalPages = (Integer) request.getAttribute("totalPages");
int pageSize = (Integer) request.getAttribute("pageSize");
int groupStartPage = (Integer) request.getAttribute("groupStartPage");
int groupEndPage = (Integer) request.getAttribute("groupEndPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../iMarket/CSS/style-header.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>파일 첨부형 게시판</title>

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

</head>
<body>
	<jsp:include page="../layout/Header.jsp" />
	<div id="container">
		<h3 style="margin-top: 5%; margin-bottom: 5%;">상품 리스트</h3>
		<hr class="dropdown-divider"
			style="margin-top: 5%; margin-bottom: 5%;">
		<div class="container">
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
									<img src="../${item.imgUrl_1}" alt="..."
										style="width: 200px; height: 200px; object-fit: cover;">
								</c:if>
								<p
									style="font-style: normal; font-size: 18px; font-weight: 700; display: flex; flex-direction: row; margin: 10px; align-items: stretch; justify-content: space-between; align-content: space-between; flex-wrap: nowrap;">
									<fmt:formatNumber type="number" pattern="#,##0"
										value="${item.price}" />
									원 <span id="elapsedTime_${loop.index}" class="elapsed-time"></span>
								</p>

								<a style="font: 'pretendard', sans-serif;">${item.productName}</a>
							</div>
							<script>
								// 각 상품 항목의 경과 시간 계산 및 출력
								var elapsedTime = calculateElapsedTime('${item.createDate}');
								var elapsedTimeElement = document
										.getElementById('elapsedTime_${loop.index}');
								elapsedTimeElement.textContent = elapsedTime;
								elapsedTimeElement.classList
										.add('elapsed-time');
							</script>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="paging">
				<%
				if (currentPage > 1) {
				%>
				<a href="?page=<%=currentPage - 1%>&pageSize=<%=pageSize%>">이전</a>
				<%
				} else {
				%>
				<a href="javascript:void(0);" class="disabled">이전</a>
				<%
				}
				%>

				<!-- 페이지 번호 표시 -->
				<c:forEach begin="${groupStartPage}" end="${groupEndPage}" var="i">
					<a href="?page=${i}&pageSize=${pageSize}"
						class="${i == currentPage ? 'current' : ''}">${i}</a>
				</c:forEach>

				<%
				if (currentPage < totalPages) {
				%>
				<a href="?page=<%=currentPage + 1%>&pageSize=<%=pageSize%>">다음</a>
				<%
				} else {
				%>
				<a href="javascript:void(0);" class="disabled">다음</a>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/Footer.jsp" />
</body>
</html>
