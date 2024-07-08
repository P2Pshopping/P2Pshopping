<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:out value="${fn:length(likePosts)}" />
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
<title>거래 후기 게시판</title>
<style>
/* body {
	font-size: 13px;
} */
#container {
	width: 1200px;
	padding: 20px;
	margin: 0 auto;
}

#contents {
	width: 800px;
	flex-grow: 1;
	padding: 0px;
	margin: 20px;
}

/* #gallery img {
	width: 50%;
	height: auto;
} */
#gallery img {
	width: 100%;
	height: auto;
	display: block;
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
	cursor: pointer;
	transition: transform 0.3s ease-in-out;
}

#gallery-item:hover {
	transform: scale(1.05);
}

#left-sidebar {
	width: 200px;
	margin-bottom: 20px;
	margin-right: 20px;
	font-family: "Noto Sans KR";
	font-size: 12px;
	margin-top: 200px;
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
<body
	style="overflow-x: scroll; margin: 0 auto; width: 1200px; align-items: center; background-color: #f7f7f7;">
	<jsp:include page="../layout/Header.jsp" />
	<div id="container">
		<div class="flex-container">
			<div id="left-sidebar">
				<div class="btn-group-vertical" role="group"
					aria-label="Vertical button group" style="font-size: 8px;">
					<button type="button" class="btn btn-outline-warning"
						onclick="location.href='../mvcboard/list.do';">아기사진</button>
					<button type="button" class="btn btn-outline-warning"
						onclick="location.href='../review/list';">거래후기</button>
				</div>
			</div>

			<div id="contents">
				<h2>거래 후기 게시판</h2>
				<div id="gallery">
					<c:choose>
						<c:when test="${empty reviews}">
							<div id="gallery-item">
								<p>등록된 후기가 없습니다^^*</p>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${reviews}" var="review" varStatus="loop">
								<div id="gallery-item"
									onclick="location.href='../review/view?id=${review.id}'">
									<c:if test="${not empty review.sfile}">
										<img src="<c:url value='/review/images/${review.sfile}'/>"
											alt="${review.ofile}" width="200" />
									</c:if>
									<div id="caption">${review.title}</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>

				<%-- <div class="paging">${map.pagingImg}</div> --%>
				<div class="paging">
					<c:forEach var="i" begin="1" end="${totalPages}">
						<c:choose>
							<c:when test="${i == currentPage}">
								<span class="current">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="?page=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<%-- <div class="paging">
                    <c:out value="${pagingImg}" />
                </div> --%>

				<div class="d-flex justify-content-between mt-4">
					<div></div>
					<div>
						<button type="button" class="btn btn-outline-primary"
							onclick="location.href='../review/write';">글쓰기</button>
					</div>
				</div>
			</div>

			<!-- 			<div id="right-sidebar">
				<p>인기 게시글</p>
				<a href="#"><img alt="아기1" src="../img/333.jpg" width="100"
					height="100"></a>
			</div> -->
			<%-- <div id="right-sidebar">
				<p>인기글</p>
				<c:forEach items="${likePosts}" var="post">
					<a href="../review/view?id=${post.id}"> <c:if
							test="${not empty post.sfile}">
							<img alt="${post.title}"
								src="../review/images/${post.ofile}&sfile=${post.sfile}&id=${post.id}" />
							<img alt="${review.title}" src="../review/images/${review.sfile}&sfile=${post.sfile}&id=${post.id}" />
							<img src="../review/images/${review.sfile}" alt="${review.ofile}" style="max-width: 100%;" />
						</c:if> <p>${post.title}</p>
					</a>
				</c:forEach>
			</div> --%>

			<div id="right-sidebar">
				<p>인기글</p>
                <%-- <c:out value="${fn:length(likePosts)}" /> <!-- 리스트 크기 출력 --> --%>
				<c:forEach items="${likePosts}" var="post">
					<a href="../review/view?id=${post.id}"> <c:if
							test="${not empty post.sfile}">
							<img alt="${post.title}" src="../review/images/${post.sfile}" />
						</c:if>
						<%-- <p>${post.title}</p> --%>
						<p></p>
					</a>
				</c:forEach>
			</div>

		</div>
	</div>

	<jsp:include page="../layout/Footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>


<!-- 	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz4fnFO9gybBogGzAxU6j5Y3a50p1z0l5y1H5k5jUp7Bhp8vT8Dr+8bkH+"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-q2mBWTwC8PQ8xu3KjZWR6zrXb+buJ1fgNHhA8sDDYmy1J6C6tv8HgASpRl8d6Pc0"
		crossorigin="anonymous"></script> -->
</body>
</html>
