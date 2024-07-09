<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="itemList.ItemListDTO"%>
<%@ page import="itemList.ItemListDAO"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
/* 기존 스타일 */
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
    justify-content: flex-start;
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
        <h3 style="margin-top:10%; margin-bottom:5%;">상품 리스트</h3>
        <hr class="dropdown-divider" style="margin-top:5%; margin-bottom:5%;">
        <div id="contents">
            <div id="gallery">
                <c:choose>
                    <c:when test="${empty product}">
                        <div id="gallery-item">
                            <p>등록된 게시물이 없습니다^^*</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="item" items="${product}" varStatus="status">
                            <div id="gallery-item"
                                onclick="location.href='${pageContext.request.contextPath}/DetailPage/DetailPage.jsp';">
                                <c:if test="${not empty item.imgUrl_1}">
                                    <img src="../${item.imgUrl_1}" alt="..." style="width: 200px; height: 200px; object-fit: cover;">
                                </c:if>
                                <p>제목 : ${item.productName}</p>
                                <p>작성자 ID: ${item.username}</p>
                                <p>가격: ${item.price}</p>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="paging">
                    <c:if test="${currentPage > 1}">
        <a href="?page=${currentPage - 1}&pageSize=${pageSize}">이전</a>
    </c:if>
    
    <!-- 페이지 번호 표시 -->
    <c:forEach begin="1" end="${totalPages}" var="pageNum">
        <c:choose>
            <c:when test="${pageNum == currentPage}">
                <span class="current">${pageNum}</span>
            </c:when>
            <c:otherwise>
                <a href="?page=${pageNum}&pageSize=${pageSize}">${pageNum}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    
    <a href="?page=${currentPage + 1}&pageSize=${pageSize}">다음</a>
            </div>
        </div>
    </div>
    <jsp:include page="../layout/Footer.jsp" />
</body>
</html>
