<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<style>
a {
    text-decoration: none;
}
</style>
</head>
<body>
    <h2>파일 첨부형 게시판 - 목록 보기(List)</h2>
    <form method="get">
        <table border="1" width="90%">
            <tr>
                <td align="center">
                    <select name="searchField">
                        <option value="productName" <c:if test="${param.searchField == 'productName'}">selected</c:if>>제품명</option>
                        <option value="username" <c:if test="${param.searchField == 'username'}">selected</c:if>>작성자</option>
                    </select>
                    <input type="text" name="searchWord" value="${param.searchWord}" />
                    <input type="submit" value="검색하기" />
                </td>
            </tr>
        </table>
    </form>

    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="*">제품명</th>
            <th width="10%">가격</th>
            <th width="15%">카테고리ID</th>
            <th width="15%">이미지</th>
        </tr>
        <c:choose>
            <c:when test="${not empty boardLists}">
                <tr>
                    <td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${boardLists}" var="row" varStatus="loop">
                    <tr align="center">
                        <td>${map.totalCount - (((map.pageNum - 1) * map.pageSize) + loop.index)}</td>
                        <td align="left"><a href="../Main/ItemList.do?id=${row.id}">${row.productName}</a></td>
                        <td>${row.price}</td>
                        <td>${row.categoryid}</td>
                        <td><c:if test="${not empty row.imgUrl_1}">
                            <img src="${row.imgUrl_1}" alt="이미지" width="50" height="50" />
                        </c:if></td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>        
    </table>

    <table border="1" width="90%">
        <tr align="center">
            <td>${map.pagingImg}</td>
            <td width="100"><button type="button" onclick="location.href='${pageContext.request.contextPath}/sell/sell.jsp';">글쓰기</button></td>
        </tr>
    </table>
</body>
</html>
