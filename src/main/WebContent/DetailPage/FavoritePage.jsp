<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="DPCSS.css" rel="stylesheet" type="text/css">
<!-- 다중 슬라이드 js,css링크-->


<script type="text/javascript" src="./DPJS.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<meta charset="UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="overflow-x: scroll; margin: 0 auto; width: 1200px; align-items: center;">

<div class="container text-center">
			<%@ include file="../layout/Header.jsp"%>
	</div>
	
	<div>
	<button type="button" class="btn btn-dark">전체</button>
	<button type="button" class="btn btn-dark">유모차</button>
	<button type="button" class="btn btn-dark">장난감</button>
	<button type="button" class="btn btn-dark">의류</button>

	<button style="float:right;" type="button" class="btn btn-dark">▲가격순</button>
	</div>
	
	<div class="container text-center">	
	<div class="row" >
	<div class="col"  >
	<span>
	<img src="./babycloth.jpg" style="width: 300px; height: auto; border:solid 2px black;"> 
	<br/>
	<button type="button" class="btn btn-dark" style="pointer-events : none; width:300px;">전체</button>
	</span>
	</div>
	<div class="col">
	<img src="./babycloth.jpg" style="width: 300px; height: auto;border:solid 2px black;">
	<br/>
	<button type="button" class="btn btn-dark" style="pointer-events : none; width:300px;">전체</button>
	</div>
	<div class="col">
	<img src="./babycloth.jpg" style="width: 300px; height: auto;border:solid 2px black;">
	<br/>
	<button type="button" class="btn btn-dark" style="pointer-events : none; width:300px;">전체</button>
	</div>
	</div>
	<div class="row" >
	<div class="col">
	<img src="./babycloth.jpg" style="width: 300px; height: auto;border:solid 2px black;">
	<br/>
	<button type="button" class="btn btn-dark" style="pointer-events : none; width:300px;">전체</button>
	</div>
	<div class="col">
	<img src="./babycloth.jpg" style="width: 300px; height: auto;border:solid 2px black;">
	<br/>
	<button type="button" class="btn btn-dark" style="pointer-events : none; width:300px;">전체</button>
	</div>
	<div class="col">
	<img src="./babycloth.jpg" style="width: 300px; height: auto;border:solid 2px black;">
	<br/>
	<button type="button" class="btn btn-dark" style="pointer-events : none; width:300px;">전체</button>
	</div>
	</div>
	<div class="row">
	<div class="col">
	<img src="./babycloth.jpg" style="width: 300px; height: auto;border:solid 2px black;">
	<br/>
	<button type="button" class="btn btn-dark" style="pointer-events : none; width:300px;">전체</button>
	</div>
	<div class="col">
	<img src="./babycloth.jpg" style="width: 300px; height: auto;border:solid 2px black;">
	<br/>
	<button type="button" class="btn btn-dark" style="pointer-events : none; width:300px;">전체</button>
	</div>
	<div class="col">
	<img src="./babycloth.jpg" style="width: 300px; height: auto;border:solid 2px black;">
	
	</div>
	</div>

	</div>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<div class="container text-center" style=" margin-right:200px;" >
			<%@ include file="../layout/Footer.jsp" %>
	</div>

	
	
</body>
</html>