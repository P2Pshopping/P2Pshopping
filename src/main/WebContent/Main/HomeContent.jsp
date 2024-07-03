<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
    <c:when test="${listOfProducts != null}">
        <div align="center">등록된 게시물이 없습니다^^*</div>
    </c:when>
    <c:otherwise>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Category ID</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${listOfProducts}">
                    <tr>
                        <td>${item.username}</td>
                        <td>${item.productname}</td>
                        <td>${item.price}</td>
                        <td><img src="${item.imgUrl}" alt="${item.productname} image" width="100" height="100"></td>
                        <td>${item.categoryId}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>
