<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<style>
.container {
	background-color: #fff;
	padding: 20px;
	margin-top: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
/* 노멀라이즈 시작 */
body, ul, li {
  margin: 0;
  padding: 0;
  list-style: none;   	    /* 해당 태그의 list-style을 none으로 하는 것으로 ●을 제거한다 */
}

a {
  color: inherit;   	    /* 부모 엘리먼트의 값을 물려받는다 */
  text-decoration: none;    /* 해당 태그의 text-decoration 속성을 none 값으로 하는 것으로 밑줄을 제거한다 */
}
/* 2차 이상의 메뉴를 숨기기 */
.side-bar > ul ul {
  display: none;
}

/* 사이트의 높이를 5000px로 만들어 스크롤 생성 */
body {
  height: 5000px;
  background-color: #444;
}

/* 사이드바의 너비와 높이를 변수를 통해 통제 */
:root {
  --side-bar-width: 270px;
  --side-bar-height: 90vh;
}

.side-bar {
  position: fixed;    /* 스크롤을 따라오도록 지정 */
  background-color: black;
  width: var(--side-bar-width);
  min-height: var(--side-bar-height);   /* 사이드바의 높이를 전체 화면 높이의 90%로 지정 */
  margin-top: calc((100vh - var(--side-bar-height)) / 2);    /* 사이드바 위와 아래의 마진을 동일하게 지정 */
}

/* 모든 메뉴의 a에 속성값 부여 */
.side-bar ul > li > a {
  display: block;
  color: white;
  font-size: 1.4rem;
  font-weight: bold;
  padding-top: 20px;
  padding-bottom: 20px;
  padding-left: 50px;
}
/* 노멀라이즈 끝 */
/* 자식의 position이 absolute일 때 자식을 영역 안에 가두어 준다 */
.side-bar > ul > li {
  position: relative;
}

/* 모든 메뉴가 마우스 인식 시 반응 */
.side-bar ul > li:hover > a {
  background-color: #555;
  border-bottom: 1px solid #999;
}

/* 1차 메뉴의 항목이 마우스 인식 시에 2차 메뉴 등장 */
.side-bar > ul > li:hover > ul {
  display: block;
  position: absolute;
  background-color: #888;
  top: 0;         /* 2차 메뉴의 상단을 1차 메뉴의 상단에 고정 */
  left: 100%;     /* 2차 메뉴를 1차 메뉴의 너비만큼 이동 */
  width: 100%;    /* 1차 메뉴의 너비를 상속 */
}
/* 사이드바 너비의 80%만큼 왼쪽으로 이동 */
.side-bar {
  border-radius: 20px;
  transform: translate(calc(var(--side-bar-width) * -0.8), 0);  /* X축 이동, Y축 고정 */
  transition: .5s;
}

/* 마우스 인식 시 원래의 위치로 이동 */
.side-bar:hover {
  transform: translate(-20px, 0);   /* 둥근 모서리의 너비만큼 X축 이동, Y축 고정 */
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품메뉴</title>

</head>
<body>

	<%@include file="../layout/Header.jsp"%>
<div class="row">
<figure>
  <blockquote class="blockquote">
<p style="margin-top: 10%; margin-bottom: -3%; display: flex; justify-content: flex-start; font-size: 20px; font-weight:700;">상품메뉴</p>
  </blockquote>
</figure>
</div>
<hr color="black" size="2px" width="1200px" style="margin-left:auto; margin-right:auto;">
	<div class="flex-center" style="margin-top:5%;">
		<div class="container"
			style="display: flex-center; justify-content: center; max-width: 1200px;">
			<div class="row">
				<div class="col" style="width: 25%; border: 1px">
				<table class ="table">
<c:choose>
	<c:when test="${empty boardLists }"> <!-- 게시물이 없을때 -->
		<tr>
			<td colspan="6" align="center"> 등록된 게시물이 없습니다 ! </td>
		</tr>
	</c:when>
	
	<c:otherwise> <!-- 게시물이 있을때 -->
		<c:forEach items="${ boardlists }" var ="row" varStatus="loop">
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
	</div>
	</div>
	</div>
	</div>
	<aside class="side-bar">
  <section class="side-bar__icon-box">
    <section class="side-bar__icon-1">
      <div></div>
      <div></div>
      <div></div>
    </section>
  </section>
  <ul>
    <li>
      <a href="#"><i class="fa-solid fa-cat"></i> menu1</a>
      <ul>
        <li><a href="#">text1</a></li>
        <li><a href="#">text2</a></li>
        <li><a href="#">text3</a></li>
        <li><a href="#">text4</a></li>
      </ul>
    </li>
    <li>
      <a href="#">menu2</a>
      <ul>
        <li><a href="#">text1</a></li>
        <li><a href="#">text2</a></li>
        <li><a href="#">text3</a></li>
        <li><a href="#">text4</a></li>
      </ul>
    </li>
    <li>
      <a href="#">menu3</a>
      <ul>
        <li><a href="#">text1</a></li>
        <li><a href="#">text2</a></li>
        <li><a href="#">text3</a></li>
        <li><a href="#">text4</a></li>
      </ul>
    </li>
    <li>
      <a href="#">menu4</a>
      <ul>
        <li><a href="#">text1</a></li>
        <li><a href="#">text2</a></li>
        <li><a href="#">text3</a></li>
        <li><a href="#">text4</a></li>
      </ul>
    </li>
  </ul>
</aside>
<%@ include file="../layout/Footer.jsp"%>

</body>
</html>