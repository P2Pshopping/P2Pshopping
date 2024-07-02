<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
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
<jsp:include page="../layout/Header.jsp" />
	<div id="container">
		<div class="flex-container">
			<div id="left-sidebar">
				<div class="btn-group-vertical" role="group"
					aria-label="Vertical button group" style="font-size: 8px;">
					<button type="button" class="btn btn-outline-warning" onclick="location.href='../mvcboard/list.do';">아기사진</button>
					<button type="button" class="btn btn-outline-warning" onclick="location.href='../review/list';">거래후기</button>
				</div>
			</div>

			<div id="contents">
				<h2>게시판</h2>
				<div id="gallery">
					<c:choose>
						<c:when test="${empty boardLists}">
							<div id="gallery-item">
								<p>등록된 게시물이 없습니다^^*</p>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${boardLists}" var="row" varStatus="loop">
								<div id="gallery-item"
									onclick="location.href='../mvcboard/view.do?id=${row.id}'">
									<c:if test="${not empty row.sfile}">
										<img
											src="../mvcboard/download.do?ofile=${row.ofile}&sfile=${row.sfile}&id=${row.id}"
											alt="${row.title}" />
									</c:if>
									<div id="caption"></div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="paging">${map.pagingImg}</div>

				<div class="d-flex justify-content-between mt-4">
					<div></div>
					<div>
						<button type="button" class="btn btn-outline-primary"
							onclick="location.href='../mvcboard/write.do';">글쓰기</button>
					</div>

				</div>
			</div>

			<div id="right-sidebar">
				<p>인기 게시글</p>
				<a href="#"><img alt="아기1" src="../img/333.jpg" width="100"
					height="100"></a>
			</div>
		</div>
	</div>

<jsp:include page="../layout/Footer.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz4fnFO9gybBogGzAxU6j5Y3a50p1z0l5y1H5k5jUp7Bhp8vT8Dr+8bkH+"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-q2mBWTwC8PQ8xu3KjZWR6zrXb+buJ1fgNHhA8sDDYmy1J6C6tv8HgASpRl8d6Pc0"
		crossorigin="anonymous"></script>
</body>
</html>
