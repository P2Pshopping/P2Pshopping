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
<title>리스트</title>
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

#gallery-item img {
	width: 85%;
	height: 150px;
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
}

#left-sidebar {
	width: 200px;
	margin-bottom: 20px;
	margin-right: 20px;
	font-family: "Noto Sans KR";
	font-size: 12px;
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
</style>
</head>
<body>
<div style="display: flex; justify-content: center;">
<nav class="navbar navbar-expand-max-height navbar-light bg-$orange-300" style=" width : 1200px;">
  <div class="container-fluid">
    <div class=row>
    <div class=col-md-2>
    <a class="navbar-brand" href="#" style="font-weight: 700; font-size : 50px;"><span style="color:rgb(219, 20, 60, 0.5); font-weight: 700; font-size: 50px;">i-</span>Market </a>
	</div>
	<div class=col-md-4>
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
							class="header-sub-menu">로그인</a> <a
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
            <li><a class="dropdown-item"  onclick="location.href='../iMarket/ItemList.jsp'">상품목록</a></li>
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
	<div id="container">
		<div class="flex-container">
			<div id="left-sidebar">
				<div class="btn-group-vertical" role="group"
					aria-label="Vertical button group" style="font-size: 8px;">
					<button type="button" class="btn btn-outline-warning">전체보기</button>
					<button type="button" class="btn btn-outline-warning">아기사진</button>
					<button type="button" class="btn btn-outline-warning">거래후기</button>
				</div>
			</div>

			<div id="contents">
				<div id="gallery">
					<div id="gallery-item">
						<a href="#"><img src="../image/1.jpg" alt="Item"> </a>
					</div>
					<div id="gallery-item">
						<a href="#"><img src="../image/2.jpg" alt="Item"></a>
					</div>
					<div id="gallery-item">
						<a href="#"><img src="../image/3.jpg" alt="Item"></a>
					</div>
					<div id="gallery-item">
						<a href="#"><img src="../image/1.jpg" alt="Item"></a>
					</div>
					<div id="gallery-item">
						<a href="#"><img src="../image/2.jpg" alt="Item"></a>
					</div>
					<div id="gallery-item">
						<a href="#"><img src="../image/3.jpg" alt="Item"></a>
					</div>
					<div id="gallery-item">
						<a href="#"><img src="../image/1.jpg" alt="Item"></a>
					</div>
					<div id="gallery-item">
						<a href="#"><img src="../image/2.jpg" alt="Item"></a>
					</div>
					<div id="gallery-item">
						<a href="#"><img src="../image/3.jpg" alt="Item"></a>
					</div>
					<!-- <c:choose>
						<c:when test="${ empty boardLists }">
							
						</c:when>
						<c:otherwise>
							<c:forEach items="${ boardLists }" var="row" varStatus="loop">
								<div id="gallery-item">
									
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose> -->
				</div>

				<!-- 검색창 추가 -->
				<div class="input-group mt-4 mb-4"
					style="max-width: 300px; margin: 0 auto;">
					<input type="text" class="form-control" placeholder="검색어를 입력하세요"
						aria-label="검색어를 입력하세요" aria-describedby="button-search">
					<button class="btn btn-outline-secondary" type="button"
						id="button-search">검색</button>
				</div>
			</div>

			<div id="right-sidebar" class="border">
				<p>인기 게시글</p>
				<a href="#"><img alt="아기1" src="../img/333.jpg" width="100"
					height="100"></a>
			</div>
		</div>

		<div id="footer">
			<hr color="black" size="5px">
			<div class="row">
				<div class="col-md-4">
					<dl class="dl1">
						<dt>
							(주)아이마켓코리아 <span class="txt_owner">대표이사 김아무개</span>
						</dt>
						<dd>서울시 강남구 삼성로 512 삼성동빌딩 16층</dd>
						<dd>
							사업자등록번호 104-81-58502 <a
								href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1048158502&amp;apv_perm_no="
								class="btn_num_con" target="_blank">사업자정보확인</a>
						</dd>
						<dd>통신판매업 신고번호 : 제 2011-서울강남-02905호</dd>
						<dd>의료기기판매업 신고번호: 제4850호</dd>
					</dl>
				</div>
				<div class="col-md-4">
					<dl class="dl4 ">
						<dt>
							고객센터<a
								href="http://www.imarket.co.kr/ecenter/MainFAQ.do?_method=MainFAQ&amp;pgid=pcfront&amp;cgrp=cmmn&amp;cmod=foot_links"
								class="btn_inquire">문의 전 클릭</a>
						</dt>
						<dt>
							아이마켓<span style="font-size: 12px;"><span>TEL :
									1522-8250</span><span class="bar">|</span><span>FAX :
									02-3708-8338</span></span>
						</dt>
						<dt class="type_mg" style="margin-top: 0;">
							의료몰<span style="font-size: 12px; padding-left: 17px"><span>TEL
									: 02-6715-4390</span><span class="bar">|</span><span>FAX :
									02-3708-8338</span></span>
						</dt>
					</dl>
				</div>
				<div class="col-md-4">
					<dl class="dl4">
						<dt>[인증범위]</dt>
						<dd>
							<span style="font-size: 12px;"><span>MRO 구매 서비스 운영</span></span>
						</dd>
						<dt class="type_mg" style="margin-top: 12px;"></dt>
						<dt>[유효기간]</dt>
						<dd>
							<span style="font-size: 12px;"><span>2023.08.02~2026.08.01</span></span>
						</dd>
					</dl>
				</div>
				<div class="col-md-4">
					<dl class="dl3">
						<dt>
							구매안전(에스크로)서비스 가맹점 <a
								href="http://www.allatpay.com/servlet/AllatBizV2/svcinfo/SvcInfoMainCL?menu_id=m010602&amp;action_flag=SEARCH&amp;search_no=biz_no&amp;es_business_no=1048158502"
								class="btn_join_con" target="_blank">가입확인</a>
						</dt>
						<dd>
							고객님의 안전한 거래를 위해 현금으로 결제 시<br>구매안전(에스크로)서비스를 이용하실 수 있습니다.
						</dd>
						<dt class="type_mg" style="margin-top: 20px"></dt>
						<dd>Copyright ⓒ IMARKETKOREA.CO.LTD All Rights Reserved</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w4C1gPKEqFb/yx8hsIZjkhMCixIqL5ykz6qykIv5Qh4lg7hR1Hz6ol4LZcK0zMLG"
		crossorigin="anonymous"></script>
</body>
</html>
