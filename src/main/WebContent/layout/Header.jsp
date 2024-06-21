<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div style="display: flex; justify-content: center;">
<nav class="navbar navbar-expand-max-height navbar-light bg-$orange-300" style=" width : 1200px;">
  <div class="container-fluid">
    <div class=row style="width:1100px;">
    <div class=col-sm-4>
    <a class="navbar-brand" href="#" style="font-weight: 700; font-size : 50px;"><span style="color:rgb(219, 20, 60, 0.5); font-weight: 700; font-size: 50px;">i-</span>Market </a>
	</div>
	<div class=col-md-4></div>
	<div class=col-md-4 style="display: flex; justify-content: right; align-items: center" >
    <c:choose>
				<c:when test="${sessionScope.principal != null}">
						<c:if test="${sessionScope.principal.auth eq 'admin' }">
							<a href="<%=request.getContextPath()%>/product?cmd=insertPage"
								class="header-sub-menu">상품등록</a>
							<a href="#" class="header-sub-menu">상품수정</a>
						</c:if>
						<a href="<%=request.getContextPath()%>/favor?cmd=favorList"
							class="header-sub-menu">찜</a> <a href="<%=request.getContextPath()%>/cart?cmd=cartList" class="header-sub-menu">장바구니</a>
						<a href="<%=request.getContextPath()%>/user?cmd=checkAgain"
							class="header-sub-menu">정보수정</a> <a
							href="<%=request.getContextPath()%>/user?cmd=logout"
							class="header-sub-menu">로그아웃</a>
					
				</c:when>
				<c:otherwise>
						<a href="<%=request.getContextPath()%>/member/LoginForm.jsp"
							class="header-sub-menu" style="margin: 5px;">로그인</a> <a
							href="<%=request.getContextPath()%>/user?cmd=joinForm"
							class="header-sub-menu">회원가입</a>
				</c:otherwise>
			</c:choose>
			</div>
  </div>
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">홈</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-cureent="page" href="#">병원찾기</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            중고장터
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item"  href="../iMarket/ItemList.jsp">상품목록</a></li>
            <li><a class="dropdown-item" href="#">후기글</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">커뮤니티</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="상품명 또는 브랜드명으로 검색해주세요." aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
    </div>
</nav>

</div>
</body>
</html>