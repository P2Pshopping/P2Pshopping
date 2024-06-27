<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>

$('#autocompleteInput').autocomplete({
    source: function(request, response) {
        var results = $.ui.autocomplete.filter(data, request.term);
        response(results.slice(0, 3));
    },
    minLength: 1
});

</script>
</head>

<body>
<div class="header-second" style="display: flex; justify-content: center;">
<nav class="navbar navbar-expand-max-height navbar-light bg-$orange-300" style=" width : 1200px;">
  <div class="container-fluid">
    <div class="row" style="width:1100px;">
    <div class="col-sm-4">
    <a class="navbar-brand" href="../Main/Mainpage.jsp" style="font-weight: 700; font-size : 50px;"><span style="color:rgb(219, 20, 60, 0.5); font-weight: 700; font-size: 50px;">i-</span>Market </a>
	</div>
	<div class="col-md-4"></div>
	<div class="col-md-4" style="display: flex; justify-content: right; align-items: center; font-color:black;" >
    
				<c:if test="${sessionScope.username != null}">
												
						<a href="<%=request.getContextPath()%>/favor?cmd=favorList"
							class="bi bi-suit-heart-fill" style="margin: 2%; color:red; --bs-btn-font-size: .75rem;">찜 </a> 
						<a href="<%=request.getContextPath()%>/cart?cmd=cartList" class="bi bi-cart-fill" style="margin: 2%; color:black; --bs-btn-font-size: .75rem;">장바구니</a>
													
						<a href="<%=request.getContextPath()%>/user?cmd=checkAgain"

							class="bi bi-gear-fill" style="margin: 2%; color:black; --bs-btn-font-size: .75rem;">정보수정 </a> 
						<a href="<%=request.getContextPath()%>/user?cmd=logout"
							class="bi bi-box-arrow-left" style="margin: 2%; color:black; --bs-btn-font-size: .75rem;">로그아웃 </a>
				<a href="<%=request.getContextPath()%>/sell/sell.jsp"
							class="bi bi-upload btn btn-outline-secondary" type="submit" style="margin-left: 40px; margin-right: -20px; --bs-btn-font-size: 1.05rem; "> 상품등록 </a>
				</c:if>
				<c:if test="${sessionScope.username == null}">
						<a href="../Login/login.jsp"
							class="bi bi-box-arrow-in-right btn btn-success btn-sm" style="margin: 2%; color:fff; --bs-btn-font-size: .75rem;"> Login </a> 
							<a href="<%=request.getContextPath()%>/member/SignIn.jsp"
							class="bi bi-person-plus-fill btn btn-primary btn-sm" style="margin: 2%; color:fff; --bs-btn-font-size: .75rem;"> create account </a>

							<a href="<%=request.getContextPath()%>/sell/sell.jsp"
							class="bi bi-upload btn btn-outline-secondary" type="submit" style="margin-left: 40px; margin-right: -20px; --bs-btn-font-size: 1.05rem; "> 상품등록 </a>
				</c:if>
			</div>
  </div>
  
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="../Main/Mainpage.jsp">홈</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-cureent="page" href="	https://map.kakao.com/link/map/37.402056,127.108212">병원찾기</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            중고장터
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item"  href="../Main/ItemList.jsp">상품목록</a></li>
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