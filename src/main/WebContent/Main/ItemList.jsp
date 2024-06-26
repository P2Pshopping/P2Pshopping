<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

	<%@include file="../layout/Header.jsp"%>
<div class="row">
<figure>
  <blockquote class="blockquote">
<p style="margin-top: 10%; margin-bottom: -6%; display: flex; justify-content: flex-start; font-size: 20px; font-weight:700;">상품메뉴</p>
  </blockquote>
</figure>
<!-- 검색 폼 -->
<form method ="get">
<table width="100%">
	<tr align="center">
		<td>
			<select name="searchField" class="custom-select" style="width:10%; display:inline-block;">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord"  class="form-control" style="width:30%; display:inline-block;"/>
			<input type="submit" value="검색하기" class="btn btn-primary" style="width:10%; display:inline-block;"/>
		</td>
	</tr>
</table>	
</form>
</div>
<hr color="black" size="2px" width="1200px" style="margin-left:auto; margin-right:auto;">
	<div class="flex-center" style="margin-top:5%;">
		<div class="container"
			style="display: flex-center; justify-content: center; max-width: 1200px;">
			<div class="row">
				<div class="col" style="width: 25%; border: 1px">
				<table class ="table">
	<tr class= "bg-color2">
		<th width ="10%">번호</th>
		<th width ="*"> 제목 </th>
		<th width ="15%"> 작성자 </th>
		<th width ="10%"> 조회수 </th>
		<th width ="15%"> 작성일 </th>
		<th width ="8%"> 첨부 </th>
	</tr>
<c:choose>
	<c:when test="${empty boardLists }"> <!-- 게시물이 없을때 -->
		<tr>
			<td colspan="6" align="center"> 등록된 게시물이 없습니다 ! </td>
		</tr>
	</c:when>
	
	<c:otherwise> <!-- 게시물이 있을때 -->
		<c:forEach items="${ boardLists }" var ="row" varStatus="loop">
		<tr align="center" class="bg-color4">
			<td> ${map.totalCount  - (((map.pageNum-1) * map.pageSize) + loop.index)} </td>
			<td align="left">
			 	<a href="../mvcboard/view.do?idx=${row.idx }">${row.title }</a> 
			</td>
			<td> ${row.name} </td>
			<td> ${row.visitcount} </td>	
			<td> ${row.postdate} </td>
			<td>
			<c:if test="${not empty row.ofile }">	
			<c:set var="fileNm" value="${row.ofile}" />
			<c:forTokens var="token" items="${fileNm }" delims="." varStatus="status">
				<c:if test="${status.last }">
					<c:choose> 
						<c:when test="${token eq 'html' }"> 
							<img src="/img/html.png" width="40px" height="40px"> 
						</c:when>
							
						<c:when test="${token eq 'txt'}"> 
							<img src="/img/txt.png"  width="40px" height="34px">
						</c:when> 
							 
						<c:when test="${token eq 'pdf'}"> 
							<img src="/img/pdf.png"  width="40px" height="40px"> 
						</c:when>
							 
						<c:when test="${token eq 'css'}"> 
							<img src="/img/css.png"  width="40px" height="40px"> 
						</c:when>
							 
						<c:when test="${token eq 'png'}"> 
							<img src="/img/png.png"  width="40px" height="40px"> 
						</c:when>
							 
						<c:when test="${token eq 'jpg'}"> 
							<img src="/img/jpg.png"  width="40px" height="40px"> 
						</c:when>
					</c:choose> 
				</c:if>
			</c:forTokens>			
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
	</table>	
	<!-- 하단메뉴(바로가기, 글쓰기) -->	
	<table>
		<tr align="center">
			<td>
				${map.pagingImg }
			</td>
			<td width="100"> <button type="button" onclick="location.href='../mvcboard/write.do';"> 글쓰기 </button> </td>
		</tr>	
	</table>
	</div>
	</div>
	</div>
	
<%@ include file="../layout/Footer.jsp"%>

</body>
</html>