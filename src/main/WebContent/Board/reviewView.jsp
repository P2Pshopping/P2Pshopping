<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>거래 후기 상세</title>
<style>
/* body {
    font-size: 13px;
    background-color: #f8f9fa;
    font-family: 'Noto Sans KR', sans-serif;
} */

#container {
    max-width: 1200px;
    padding: 20px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#main-content {
    display: flex;
    justify-content: space-between;
}

#left-sidebar {
    width: 200px;
    margin-top: 20px;
    font-size: 14px;
}

#contents {
    width: 800px;
    margin: 0 auto;
    position: relative;
}

#right-sidebar {
    width: 150px;
    text-align: center;
    margin-top: 20px;
    margin-left: 20px;
}

#right-sidebar img {
    width: 75px;
    height: 75px;
    margin-bottom: 10px;
    border-radius: 50%;
    object-fit: cover;
}

.card {
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    overflow: hidden;
    margin-bottom: 20px;
}

.card-header {
    background-color: #007bff;
    color: #fff;
    padding: 15px;
}

.card-body {
    padding: 20px;
}

.card-body p {
    margin-bottom: 10px;
}

.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}

.btn-danger:hover {
    background-color: #c82333;
    border-color: #bd2130;
}

#action-buttons {
    margin-top: 10px;
    text-align: center;
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

.no_dot {
    list-style-type: none;
    padding-left: 0;
}

.paging a:hover {
    background-color: #ddd;
}

.btn-group-vertical .btn {
    margin-bottom: 10px;
}
</style>
</head>
<body style="overflow-x: scroll; margin: 0 auto; width: 1200px; align-items: center; background-color: #f7f7f7;">
<jsp:include page="../layout/Header.jsp" />
<div id="container">
    <div id="main-content">
        <div id="left-sidebar">
            <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                <button type="button" class="btn btn-outline-warning" onclick="location.href='../mvcboard/list.do';" style="font-size: 18px;">아기사진</button>
                <button type="button" class="btn btn-outline-warning" onclick="location.href='../review/list';" style="font-size: 18px;">거래후기</button>
            </div>
        </div>

        <div id="contents">
            <div class="card">
                <div class="card-header">
                    <h2>${review.title}</h2>
                </div>
                <div class="card-body">
                    <p>작성자 : ${writerName}</p>
                    <p>조회수 : ${review.views} | 추천수 : ${review.likes} | 작성시간 : ${review.createDate}</p>
                    <p><img src="../review/images/${review.sfile}" alt="${review.ofile}" style="max-width: 100%;" /></p>
                    <p>판매자 이름 : ${review.sellerName} | 구매자 이름 : ${review.buyerName} | 상품 이름 : ${review.productName}</p>
                    <p>평점 : ${review.rating} | 거래 날짜 : ${review.transactionDate}</p>
                    <p><strong>상세 내용:</strong><br>${review.detail}</p>
                    <div id="action-buttons">
                        <!-- <form action="../review/like" method="post" style="display: inline;"> -->
                        <form action="${pageContext.request.contextPath}/review/like" method="post" style="display: inline;">
                            <input type="hidden" name="id" value="${review.id}">
                            <button type="submit" class="btn btn-outline-success">
                                <img src="../Image/ddabong.png" alt="추천" style="width: 50px; height: 50px;">
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <div id="action-buttons">
                <c:if test="${sessionScope.id == review.writerId}">
                    <button class="btn btn-primary" type="button" onclick="location.href='../review/edit?mode=edit&id=${param.id }';">수정하기</button>
                    <form action="../review/delete" method="post" id="deleteForm" style="display: inline;">
                        <input type="hidden" name="id" value="${review.id}">
                        <input class="btn btn-secondary" type="submit" value="삭제" onclick="return confirm('정말 삭제하시겠습니까?');">
                    </form>
                </c:if>
            </div>

            <%-- <div class="mt-3">
                <form action="../review/addComment.do" method="post">
                    <input type="hidden" name="id" value="${review.id}">
                    <input type="text" name="content" placeholder="댓글" class="form-control">
                    <button type="submit" class="btn btn-secondary mt-1">등록</button>
                </form>
            </div> --%>

        </div>

<%--         <div id="right-sidebar">
            <p>인기글</p>
            <c:forEach items="${likePosts}" var="post">
                <a href="../review/view?id=${post.id}">
                    <c:if test="${not empty post.sfile}">
                        <img alt="${post.title}" src="../review/images/${post.ofile}&sfile=${post.sfile}&id=${post.id}" />
                        <img alt="${review.title}" src="../review/images/${review.sfile}&sfile=${post.sfile}&id=${post.id}" />
                    <img src="../review/images/${review.sfile}" alt="${review.ofile}" style="max-width: 100%;" />
                    </c:if>
                    <p></p>
                    <p>${post.title}</p>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

