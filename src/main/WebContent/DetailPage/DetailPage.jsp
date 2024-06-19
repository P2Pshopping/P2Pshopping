<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="DPCSS.css" rel="stylesheet" type="text/css">
<!-- 다중 슬라이드 js,css링크-->


<script type="text/javascript" src="./DPJS.js"></script> 

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<meta charset="UTF-8">
<title>아이 물건 보기</title>
</head>
<body>

	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide"><img src="pc1.jpg"></div>
			<div class="swiper-slide"><img src="pc2.jpg"></div>
			<div class="swiper-slide"><img src="pc3.jpg"></div>
			<div class="swiper-slide"><img src="pc4.jpg"></div>
		</div>
		
		
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
				<!-- 버튼  -->
				
		<div class="swiper-pagination"></div>
	</div>
	
	<div style="text-align:center;margint-top:5px;">사진 </div>
	
	
	<script>

	new Swiper('.swiper-container',{
		
		slidesPerView:1, /* 동시에 보여줄 슬라이드  */
		spaceBeteween:40,
		slidesPerGroup:1, /*view 랑 같은 값을 하는게 좋음(그룹으로 묶을 수)  */
		/* loopFillGroupWithBlank: true, */
		centeredSlides: true,
		autoplay: { delay: 5000 },
		
		loop : true,
		
		pagination : {
			el : '.swiper-pagination',
			clickable : true,
	},
	
	navigation : {
		nextEl : '.swiper-button-next',
		prevEl : '.swiper-button-prev',
		
	},
	});

</script>
	
	<br/>
	
	<p style="margin-right:30%;text-align:right"> <b>닉네임</b>&nbsp;&nbsp;&nbsp;<b>아이나이</b> </p> <!-- 글정보를  기반으로 찾아서 넣기  -->
	
	<hr class="recenter" style="border:solid 1px black; width:1200px;">
	
	<br/>
	
	<div class="center">
		<input type = "text" name="title"  value="제목"
		style="width:50%;height:50px;px;font-size:30px;text-align:center;border:2px solid black;"> 
	</div>
	<br/>
	<div class="center">	
		<input type = "text" name="content"  value="내용"
			style="width:50%;height:500px;px;font-size:30px;text-align:center; border:2px solid black;">	
	</div>
	
	<br/>
	<!-- <div class="bt1">
	대화명 : <input type="text" id="chatId" />
	<button id="button" id="chatId">채팅 참여</button>
	<script src="../MultiChatMain.jsp"></script>
	  <script >
 		chatWinOpen();
    </script>
	</div>
	 -->
	 
	
	
	
	 <div class="container text-center">
	 <div class="col" style="float:right;  margin-right:100px; ">
	<%@ include file="./MultiChatMain.jsp"%> <!-- 세션에서 가져온 아이디를 기반으로 찾아서 넣기  -->
	</div>
	</div>
	
	
	<div class="container text-center">		
	<div class="col"id="map" style="width: 500px; height:300px;border:2px solid black; float:left;margin-left:50px;"></div>
		<table class="table" style="float:right; width: 500px; height:200px; margin-right:100px;">
  <thead >
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>
</div>


	
	
	<p><em></em></p> 

<div id="clickLatlng" style="hidden"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0637e168501ef6ed107e35286b4b79b1"></script>
	<script>
var mapContainer = document.getElementById('map'), 
    mapOption = { 
        center: new kakao.maps.LatLng(37.737964073835634, 127.04409542301234), 
        level: 3 
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

var marker = new kakao.maps.Marker({ 
  
    position: map.getCenter() 
}); 

marker.setMap(map);


       



kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
 
    var latlng = mouseEvent.latLng;  // 위도 경도 가져옴.
    

    marker.setPosition(latlng);
    
    
    
    
});


</script>
	
	
	
	<div class="grid text-center">
	<div class="row">
</div>
  <div class="col" ><img src="./babycloth.jpg" style="width:300px; height:auto;"></div>
  <div class="col" ><img src="./babycloth2.jpg" style="width:300px; height:auto;"></div>
  <div class="col"  ><img src="./babycloth3.jpg" style="width:300px; height:auto;"></div>
  <div class="col" ><img src="./babycloth5.jpg" style="width:300px; height:auto;"></div>
</div> 
	

	
</body>


</html>