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
   
   
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="DPCSS.css" rel="stylesheet" type="text/css">
<!-- 다중 슬라이드 js,css링크-->

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<title>아이 자세히 보기</title>



<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<meta charset="UTF-8">
<title>아이 물건 보기</title>



<style>
@font-face {
  font-family: 'Godo';
  font-style: normal;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff2') format('woff2'),
       url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff') format('woff');
}
.trendy-title,
    .trendy-content,
    .trendy-price {
      font-family: 'Godo', sans-serif; /* 'Godo' 글꼴 적용 */
    }

 
#love{
      width: 50px;
      fill: #ddd;
}

#love.active{
      fill: red;
}



#love.active svg path {
        fill: red;
    }    
</style>

 <style>
    .trendy-title {
        font-size: 36px;
        text-align: center;
        border: none;
        background-color: transparent;
        font-weight: bold;
        color: #333; /* 짙은 글자 색상 */
        outline: none; /* 기본 입력 포커스 테두리 제거 */
    }

    .trendy-content {
        font-size: 20px;
        resize: none; /* 텍스트영역 크기 조정 비활성화 */
        border: 1px solid #ccc; /* 연한 테두리 */
        padding: 10px;
        background-color: #f9f9f9; /* 연한 배경색 */
        color: #555; /* 약간 짙은 글자 색상 */
    }

    .trendy-price {
        font-size: 24px;
        text-align: center;
        border: none;
        background-color: transparent;
        font-weight: bold;
        color: #666; /* 조금 더 짙은 글자 색상 */
        outline: none; /* 기본 입력 포커스 테두리 제거 */
    }
</style>


<%
JDBConnect db = new JDBConnect(); //<% 이건 Java <script>는 jscript...
PJ2DAO dao = new PJ2DAO();
PJ2DTO dto = new PJ2DTO();
String   productid=request.getParameter("productid");  //앞에서 판매글 id 가져와야함.

dto = dao.img(productid);

String username =(String) session.getAttribute("username"); 
PJ2DTO dto6 = dao.findid(username);

/* if(session.getAttribute("")) */
session.setAttribute("bid", dto6.getUserid());  //구매자 고유 번호

/* if(request.getParameter("productid")==null){
session.setAttribute("productid", "43");
System.out.println("43으로 설정");
}else{
String sid = productid;
System.out.println(sid+"으로 설정");
}  */
String sid = null;  // sid = productid
int sid2 = 0;
if(productid==null){
String dump = "42";   //이거 땜에 그럼
sid2 = Integer.parseInt(dump);
}else{
sid = productid;
sid2 = Integer.parseInt(productid);
}//이건 파라메터로 가져와야함


String bid = Integer.toString(dto6.getUserid());
int bid2 = dto6.getUserid();



/* session.setAttribute("suid", "43"); //판매자의 아이디 번호. */

String suid = dto.getWriterid();
PJ2DTO dto2 = dao.more();
PJ2DTO dto3 = dao.ADRS(suid);

String[] f = Arrays.copyOf(dto2.getF(), 4);
String[] moreid=Arrays.copyOf(dto2.getMoreid(),4);

PJ2DTO dto4 = dao.likesearch(sid2, bid2); //찜했나 안했나 확인 null이면 안함 1이면 함
 

System.out.println(username);

/* System.out.print(session.getAttribute("username"));
 */

System.out.println(dto6.getUserid());  //현재 구매자
System.out.println(dto.getWriterid()); //글 판매자
System.out.println(productid);  //판매글 번호
%>



</head>
<!-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
<body
   style="overflow-x: scroll; margin: 0 auto; width: 1200px; align-items: center; background-color:#f7f7f7;">


   <%@ include file="../layout/Header.jsp"%>



   <br />
   <br />




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



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $("#love").click(function() {
        var sid = "<%= sid %>"; 
        var bid = "<%= bid %>"; 
        
        $.ajax({
            type: "POST",
            url: "http://localhost:8081/iMarket/DetailController", // DetailController 서블릿의 URL 매핑
            dataType: 'json',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: { sid: sid, bid: bid },
            success: function(data) {
               
                // 성공 시 필요한 추가 로직 구현
            },
            error: function(request, status, error) {
               
            }
        });
    });
});
</script>




<button id="love" onclick="toggleHeart()" data-like="<%= dto4.getLikeSearch() %>">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" id="heartIcon">
        <path id="heartPath" d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/>
    </svg>
</button>

<%=Integer.parseInt(dto4.getLikeSearch())%>


<script>
    var btn = document.getElementById("love");
    var heartPath = document.getElementById("heartPath");
    var likeStatus = parseInt(btn.getAttribute("data-like"));

    // 초기 상태에 따라 하트 색상 설정
    if (likeStatus !== 0) {
        heartPath.style.fill = "red"; // 하트를 빨간색으로 변경
    }

    // 클릭 이벤트 핸들러
    function toggleHeart() {
        likeStatus = 1 - likeStatus; // 상태 토글 (0 -> 1, 1 -> 0)
        btn.setAttribute('data-like', likeStatus.toString()); // 상태 업데이트

        if (likeStatus !== 0) {
            heartPath.style.fill = "red"; // 하트를 빨간색으로 변경
        } else {
            heartPath.style.fill = ""; // 하트를 원래대로 돌리기
        }
    }
</script>





   <div class="end" style="float: right;">
      <b style="border: solid 1px black; width: auto; height: auto;"
         id=favorite;>  판매자이름
 &nbsp;&nbsp;&nbsp;
      </b>
   </div>

   <hr class="recenter" style="border: solid 1px black; width: 1200px;">
   <div>
<button id="sellButton" class="btn btn-warning" onclick="sellProduct()"
    style="width: 100px; height: 50px; float: left; font-family: 'Godo', sans-serif;">
    판매 완료
</button>
</div>
   
      <%@ include file="./MultiChatMain.jsp"%>
   </div>
   <br />
   <br />   <br />   
   
<script>
// JavaScript 코드
document.addEventListener("DOMContentLoaded", function() {
    var sellButton = document.getElementById("sellButton");
    var userId = <%=dto6.getUserid()%>;
    var writerId = <%=dto.getWriterid()%>;

    if (userId === writerId) {
        sellButton.style.display = "block";  // 보이기
    } else {
        sellButton.style.display = "none";   // 숨기기
    }
});   
</script>   
   
   
   


<script>
function sellProduct() {
    // 팝업 창을 띄워서 구매자 이름을 입력받음
    var bidname = prompt("구매자 이름을 입력하세요", "");
    var sid = "<%= sid %>";

    // bidname이 null 또는 빈 문자열이면 아무 작업도 하지 않음
    if (bidname !== null && bidname !== "") {
        // AJAX 요청
        $.ajax({
            type: "GET",
            url: "http://localhost:8081/iMarket/DetailController",
            data: {
                action: "sell",
                sid: sid,
                bidname: bidname
            },
            success: function(response) {
                if (response === "success") {
                    alert("판매가 완료되었습니다.");
                } else if (response === "duplicate") {
                    alert("이미 판매된 상품입니다.");
                } else {
                    alert("판매 처리 중 오류가 발생했습니다.");
                }
            },
            error: function(xhr, status, error) {
                console.error("판매 처리 중 오류 발생:", error);
                alert("판매 처리 중 오류가 발생했습니다.");
            }
        });
    } else {
        alert("구매자 이름을 입력해주세요.");
    }
}
</script>
   
   
   
   
   
   

   
   
   
 <div class="container text-center">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <!-- 제목 -->
            <input type="text" name="trendy-title" value="<%=dto.getProductName()%>"
                   class="form-control mb-4 trendy-title" readonly>

            <!-- 상세 내용 -->
            <textarea name="trendy-content" class="form-control mb-4 trendy-content" rows="20" readonly><%=dto.getDetail()%></textarea>

            <!-- 가격 -->
            <input type="text" name="trendy-price" value="가격: <%=dto.getPrice()%>"
                   class="form-control mb-4 trendy-price" readonly>
        </div>
    </div>
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




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
   <div class="grid text-center">
      <div class="row"></div>
      <div class="col">
         <a href="../DetailPage/DetailPage.jsp?productid=<%=moreid[0]%>"><img src="../<%=f[0] %>" style="width: 300px; height: 300px;" onerror="this.style.display='none'"></a>
      </div>
      <div class="col">
         <a href="../DetailPage/DetailPage.jsp?productid=<%=moreid[1]%>"><img src="../<%=f[1] %>" style="width: 300px; height: 300px;" onerror="this.style.display='none'"></a>
      </div>
      <div class="col">
         <a href="../DetailPage/DetailPage.jsp?productid=<%=moreid[2]%>"><img src="../<%=f[2] %>" style="width: 300px; height: 300px;" onerror="this.style.display='none'"></a>
      </div>
      <div class="col">
         <a href="../DetailPage/DetailPage.jsp?productid=<%=moreid[3]%>"><img src="../<%=f[3] %>"  style="width: 300px; height: 300px;" onerror="this.style.display='none'"></a>
      </div>
   </div>

   <%@ include file="../layout/Footer.jsp"%>



</body>


</html>                   <c:otherwise>
                            <c:forEach items="${pagedLists}" var="item" varStatus="loop">
                                <c:choose>
                                    <c:when test="${item.type == 'board'}">
                                        <div id="gallery-item" onclick="location.href='../mvcboard/view.do?id=${item.id}'">
                                            <c:if test="${not empty item.sfile}">
                                                <img src="../mvcboard/download.do?ofile=${item.ofile}&sfile=${item.sfile}&id=${item.id}" alt="${item.title}" />
                                            </c:if>
                                            <div id="caption">${item.title}</div>
                                        </div>
                                    </c:when>
                                    <c:when test="${item.type == 'review'}">
                                        <div id="gallery-item" onclick="location.href='../review/view?id=${item.id}'">
                                            <c:if test="${not empty item.sfile}">
                                                <img src="../review/download.do?ofile=${item.ofile}&sfile=${item.sfile}&id=${item.id}" alt="${item.title}" />
                                            </c:if>
                                            <div id="caption">${item.title}</div>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="paging">${map.pagingImg}</div>

                <div class="d-flex justify-content-between mt-4">
                    <div></div>
                    <div>
                        <button type="button" class="btn btn-outline-primary" onclick="location.href='../mvcboard/write.do';">글쓰기</button>
                    </div>
                </div>
            </div>

            <div id="right-sidebar">
                <p>인기 게시글</p>
                <a href="#"><img alt="아기1" src="../img/333.jpg" width="100" height="100"></a>
            </div>
        </div>
    </div>

<jsp:include page="../layout/Footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybBogGzAxU6j5Y3a50p1z0l5y1H5k5jUp7Bhp8vT8Dr+8bkH+" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-q2mBWTwC8PQ8xu3KjZWR6zrXb+buJ1fgNHhA8sDDYmy1J6C6tv8HgASpRl8d6Pc0" crossorigin="anonymous"></script>
</body>
</html>
