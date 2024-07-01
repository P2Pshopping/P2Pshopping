<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="PJ2.JDBConnect"%>
<%@ page import="PJ2.PJ2DTO"%>
<%@ page import="PJ2.PJ2DAO"%>
<%@ page import = "java.util.*" %> 

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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>아이 자세히 보기</title>

<script type="text/javascript" src="./DPJS.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<meta charset="UTF-8">
<title>아이 물건 보기</title>

<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: Verdana, Geneva, Arial, sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>





<%
JDBConnect db = new JDBConnect(); //<% 이건 Java <script>는 jscript...
PJ2DAO dao = new PJ2DAO();
PJ2DTO dto = new PJ2DTO();


if(request.getParameter("sellerid")!= null){
 String	sellerid=request.getParameter("sellerid");
 dto=dao.img(sellerid);	
 

}else{
	session.setAttribute("seller", "sell"); //판매자 이름
	session.setAttribute("sellerid", "22"); //판매 글 고유 번호
	session.setMaxInactiveInterval(30000);
	
	

	String sid = (String) session.getAttribute("sellerid");
	String bid = (String) session.getAttribute("username");
 	 dto = dao.img(sid); /* 기억해라 애송이 이거다 */
}
session.setAttribute("seller", "sell");
session.setAttribute("username", "42");

String sid = (String) session.getAttribute("sellerid");
String bid = (String) session.getAttribute("username");



session.setAttribute("suid", "43"); //판매자의 아이디 번호.
String suid =(String)session.getAttribute("suid");
PJ2DTO dto2 = dao.more();
PJ2DTO dto3 = dao.ADRS(suid);
String[] f = Arrays.copyOf(dto2.getF(), 4);
String[] moreid=Arrays.copyOf(dto2.getMoreid(),4);

%>




</head>
<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
<body
	style="overflow-x: scroll; margin: 0 auto; width: 1200px; align-items: center;">


	<%@ include file="../layout/Header.jsp"%>



	<br />
	<br />


	<!-- <i class="bi bi-suit-heart"></i> -->
	<!-- <i class="bi bi-suit-heart-fill"></i> -->



	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="../<%=dto.getImgUrl_1()%>" onerror="this.style.display='none'">
			</div>
			<div class="swiper-slide"  >
				<img src="../<%=dto.getImgUrl_2()%>" onerror="this.style.display='none'">
			</div>
			<div class="swiper-slide">
				<img src="../<%=dto.getImgUrl_3()%>" onerror="this.style.display='none'">
			</div>
			<div class="swiper-slide">
				<img src="../<%=dto.getImgUrl_4()%>" onerror="this.style.display='none'">
			</div>
		</div>


		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<!-- 버튼  -->

		<div class="swiper-pagination"></div>
	</div>

	<div style="text-align: center; margint-top: 5px;">사진</div>








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

	<br />



<button type="button" id="likebtn" style="background-color: black; width: 60px; height: 50px">
    <i class="bi bi-suit-heart"></i> <!-- 초기 버튼 아이콘 -->
</button>

<%-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
   $(document).ready(function () {
        $("#likebtn").click(function () {
            $.ajax({
                url: 'LikeServlet',
                type: 'POST',
                data: {
                    sellerid: '<%= sid %>',
                    userid: '<%= bid %>'
                },
                success: function (response) {
                    if (response.trim() === "liked") {
                        $("#likebtn").html('<i class="bi bi-suit-heart-fill" style="color: red;"></i>');
                    } else if (response.trim() === "unliked") {
                        $("#likebtn").html('<i class="bi bi-suit-heart"></i>');
                    }
                },
                error: function () {
                    alert('찜 하는 중 오류 발생.');
                }
            });
        });
    });
</script>


 --%>



 <button class="btn" onclick="like()">찜하기</button>
 
 <script>
 	function like(){
 	
 		<%= dao.like(sid, bid)%>	
 	}
 	
 </script>




	<!-- <svg xmlns="http://www.w3.org/2000/svg" width="60" height="50" fill="red" class="bi bi-suit-heart" viewBox="0 0 16 16">
  <path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.6 7.6 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z"/>
</svg>	      안채워진거-->


	<!-- <svg xmlns="http://www.w3.org/2000/svg" width="60" height="50" fill="red" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
  <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1"/>
</svg>   채워진거
	 -->



	<div class="end" style="float: right;">
		<b style="border: solid 1px black; width: auto; height: auto;"
			id=favorite;> <%
 String seller = (String) session.getAttribute("seller"); //판매자 이름
 out.print(seller);%> 
 &nbsp;&nbsp;&nbsp;
		</b>
	</div>

	<hr class="recenter" style="border: solid 1px black; width: 1200px;">
	
		<%@ include file="./MultiChatMain.jsp"%>
	
	<br />
	<br />	<br />	
	<div class="container text-center">
		<input type="text" name="title" value="<%=dto.getProductName()%>"
			style="width: 50%; height: 50px; px; font-size: 30px; text-align: center; border: 2px solid black;"
			readonly> <input type="text" name="content"
			value="<%=dto.getDetail()%>"
			style="width: 50%; height: 500px; px; font-size: 30px; text-align: center; border: 2px solid black;"
			readonly>
			
			
	</div>

	<br />








	<br/>



	

	<div class="map_wrap">
		<div id="map"
			style="width: 500px; height: 300px; position: relative; overflow: hidden; margin: 0 auto; border: solid 2px black;"></div>


		<div  hidden id="menu_wrap" class="bg_white" style="border: solid 2px black; display: block; ">
			<div class="option"  hidden style="display: block;">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text"
							value=<%=dto3.getAddress()%>
							id="keyword" size="15">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0637e168501ef6ed107e35286b4b79b1&libraries=services"></script>
	<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>



<%-- <p><%PJ2DTO dto2 = dao.more();
	System.out.println(Arrays.toString(dto2.getF()));
	String[] f = Arrays.copyOf(dto2.getF(), 4);
	System.out.print(f[0]);
%></p> --%>

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
	<div class="grid text-center">
		<div class="row"></div>
		<div class="col">
			<a href="../PJ2/DetailPage.jsp?sellerid=<%=moreid[0]%>"><img src="../<%=f[0] %>" style="width: 300px; height: 300px;" onerror="this.style.display='none'"></a>
		</div>
		<div class="col">
			<a href="../PJ2/DetailPage.jsp?sellerid=<%=moreid[1]%>"><img src="../<%=f[1] %>" style="width: 300px; height: 300px;" onerror="this.style.display='none'"></a>
		</div>
		<div class="col">
			<a href="../PJ2/DetailPage.jsp?sellerid=<%=moreid[2]%>"><img src="../<%=f[2] %>" style="width: 300px; height: 300px;" onerror="this.style.display='none'"></a>
		</div>
		<div class="col">
			<a href="../PJ2/DetailPage.jsp?sellerid=<%=moreid[3]%>"><img src="../<%=f[3] %>"  style="width: 300px; height: 300px;" onerror="this.style.display='none'"></a>
		</div>
	</div>

	<%@ include file="../layout/Footer.jsp"%>



</body>


</html>