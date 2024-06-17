<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!String str1 = "JSP상품판매";
    String str2 = "안녕하세요!!";%>
<!DOCTYPE html>
<html>
<head>
<!-- 반응형 meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<!-- API -->
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ztfp2obt82"></script>
<!-- Bootstrap CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">

<!-- Bootstrap CSS -->
<link
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    rel="stylesheet">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- jQuery UI -->
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
    rel="stylesheet">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<!-- Bootstrap JS -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style>
  #map {
            width: 100%;
            height: 400px;
        }

    .narrow-select {
        width: 300px; /* 너비를 조정 */
        height: auto;
    }
    option {
        color: black; /* 글자색 설정 */
    }
    .container {
        max-width: 800px;
        margin-top: 50px;
    }
    .category-section, .subcategory-section {
        margin-top: 20px;
    }
    .hidden {
        display: none;
    }
    .subcategory-select {
        width: 100%; /* 서브카테고리의 너비를 넓게 설정 */
    }
    #popup {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #f0f8ff;
        border: 1px solid black;
        padding: 20px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        display: none;
        z-index: 1000;
    }
    #popup label {
        display: block;
        margin-bottom: 10px;
    }
    #popup input[type="text"] {
        width: calc(100% - 50px);
        margin-right: 10px;
    }
    #popup button {
        width: 40px;
        height: 30px;
        background-color: green;
        color: white;
        border: none;
    }
    #overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        display: none;
        z-index: 500;
    }
</style>

<title>상품 판매하기</title>
</head>
<body>

 <div id="map"></div>
    <input type="text" id="address" placeholder="주소 입력">
    <button onclick="searchAddress()">검색</button>
    <div id="result"></div>













    <div class="container">
        <h2>상품 판매하기</h2>
        <div class="category-section">
            <label for="autocompleteInput">어떤 물건을 판매하고 싶으신가요?:</label>
            <input type="text" id="autocompleteInput" class="form-control" placeholder="유모차, 유아용품, 장난감, 안전용품 등">
        </div>

        <h5><a href="javascript:void(0);" id="showCategoriesButton">카테고리를 직접 둘러보시겠어요?</a></h5>
        <div id="categoryContainer" class="hidden">
            <select id="categorySelect" class="form-select narrow-select" aria-label="카테고리 선택">
                <option value="유아 안전용품">유아 안전용품</option>
                <option value="바운서, 로커 및 그네">바운서, 로커 및 그네</option>
                <option value="기저귀 용품">기저귀 용품</option>
                <option value="수유 용품">수유 용품</option>
                <option value="유아 옷, 신발 및 액세서리">유아 옷, 신발 및 액세서리</option>
                <option value="유아 및 어린이 가구">유아 및 어린이 가구</option>
                <option value="야외 장난감">야외 장난감</option>
                <option value="장난감">장난감</option>
            </select>

            <div id="subcategoryContainer" class="hidden">
                <label for="subcategorySelect">하위 카테고리를 선택해주세요:</label>
                <select id="subcategorySelect" class="form-select subcategory-select" aria-label="하위 카테고리 선택">
                    <option class="유아 안전용품 hidden" value="아기 모니터">아기 모니터</option>
                    <option class="유아 안전용품 hidden" value="침대 난간 및 가드">침대 난간 및 가드</option>
                    <option class="유아 안전용품 hidden" value="게이트 및 가드">게이트 및 가드</option>
                    <option class="유아 안전용품 hidden" value="기타 아기 및 어린이 안전용품">기타 아기 및 어린이 안전용품</option>
                    <option class="유아 안전용품 hidden" value="놀이펜">놀이펜</option>
                    <option class="바운서, 로커 및 그네 hidden" value="아기 바운서">아기 바운서</option>
                    <option class="바운서, 로커 및 그네 hidden" value="아기 로커">아기 로커</option>
                    <option class="바운서, 로커 및 그네 hidden" value="아기 그네">아기 그네</option>
                    <option class="바운서, 로커 및 그네 hidden" value="아기 보행기">아기 보행기</option>
                    <option class="기저귀 용품 hidden" value="기저귀 가방">기저귀 가방</option>
                    <option class="기저귀 용품 hidden" value="기저귀 매트">기저귀 매트</option>
                    <option class="기저귀 용품 hidden" value="기타 기저귀 갈이 용품">기타 기저귀 갈이 용품</option>
                    <option class="기저귀 용품 hidden" value="유아용 변기">유아용 변기</option>
                    <option class="수유 용품 hidden" value="젖병 워머">젖병 워머</option>
                    <option class="수유 용품 hidden" value="젖병">젖병</option>
                    <option class="수유 용품 hidden" value="유축기">유축기</option>
                    <option class="수유 용품 hidden" value="기타 수유 용품">기타 수유 용품</option>
                    <option class="유아 옷, 신발 및 액세서리 hidden" value="옷 묶음">옷 묶음</option>
                    <option class="유아 옷, 신발 및 액세서리 hidden" value="드레스">드레스</option>
                    <option class="유아 옷, 신발 및 액세서리 hidden" value="청바지 및 바지">청바지 및 바지</option>
                    <option class="유아 옷, 신발 및 액세서리 hidden" value="어린이 액세서리">어린이 액세서리</option>
                    <option class="유아 옷, 신발 및 액세서리 hidden" value="코트 및 재킷">코트 및 재킷</option>
                    <option class="유아 옷, 신발 및 액세서리 hidden" value="잠옷">잠옷</option>
                    <option class="유아 옷, 신발 및 액세서리 hidden" value="기타 어린이 옷">기타 어린이 옷</option>
                    <option class="유아 옷, 신발 및 액세서리 hidden" value="신발 및 부츠">신발 및 부츠</option>
                    <option class="유아 옷, 신발 및 액세서리 hidden" value="수영복">수영복</option>
                    <option class="유아 옷, 신발 및 액세서리 hidden" value="상의 및 셔츠">상의 및 셔츠</option>
                    <option class="유아 및 어린이 가구 hidden" value="욕조">욕조</option>
                    <option class="유아 및 어린이 가구 hidden" value="기저귀 교환대">기저귀 교환대</option>
                    <option class="유아 및 어린이 가구 hidden" value="유아용 침대">유아용 침대</option>
                    <option class="유아 및 어린이 가구 hidden" value="아기 침대 및 요람">아기 침대 및 요람</option>
                    <option class="유아 및 어린이 가구 hidden" value="하이체어">하이체어</option>
                    <option class="유아 및 어린이 가구 hidden" value="램프, 조명 및 갓">램프, 조명 및 갓</option>
                    <option class="유아 및 어린이 가구 hidden" value="기타">기타</option>
                    <option class="야외 장난감 hidden" value="기타 야외 장난감">기타 야외 장난감</option>
                    <option class="야외 장난감 hidden" value="놀이집 및 놀이 텐트">놀이집 및 놀이 텐트</option>
                    <option class="야외 장난감 hidden" value="모래놀이 및 물놀이 장난감">모래놀이 및 물놀이 장난감</option>
                    <option class="야외 장난감 hidden" value="스쿠터">스쿠터</option>
                    <option class="야외 장난감 hidden" value="스케이트보드">스케이트보드</option>
                    <option class="야외 장난감 hidden" value="미끄럼틀">미끄럼틀</option>
                    <option class="장난감 hidden" value="기타 장난감">기타 장난감</option>
                </select>
            </div>
        </div>
    </div>

    <div id="overlay"></div>
    <div id="popup">
        <label>판매자분의 위치를 알려주세요</label>
        <label>우편번호</label>
        <input type="text" id="zipcode" placeholder="우편번호">
        <button id="goButton">Go</button>
        <p>우편번호는 외부에 공개되지 않습니다</p>
        <p><a href="javascript:void(0);" id="selectLocation">위치를 직접 선택하시겠어요?</a></p>
    </div>

    <script>
    
    var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.3595704, 127.105399),
        zoom: 10
    });

    function searchAddress() {
        const address = document.getElementById('address').value;
        if (!address) {
            alert('주소를 입력해주세요.');
            return;
        }

        const geocoder = new naver.maps.Service.Geocoder();
        geocoder.addressSearch(address, function(result, status) {
            if (status === naver.maps.Service.Status.OK) {
                const item = result[0];
                const addr = `${item.roadAddress || item.jibunAddress} (도로명: ${item.roadAddress || '없음'})`;
                document.getElementById('result').innerText = addr;
                
                var mapCenter = new naver.maps.LatLng(item.y, item.x);
                map.setCenter(mapCenter);
                new naver.maps.Marker({
                    position: mapCenter,
                    map: map
                });
            } else {
                alert('주소 검색에 실패하였습니다.');
            }
        });
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
        $(document).ready(function() {
            $('#autocompleteInput').autocomplete({
                source: function(request, response) {
                    var results = $.ui.autocomplete.filter(data, request.term);
                    response(results.slice(0, 3)); // 상위 3개 항목만 반환
                },
                minLength: 1
            });

            // Show the category select when the button is clicked
            $('#showCategoriesButton').click(function() {
                $('#categoryContainer').toggleClass('hidden');
            });

            // Update subcategory options based on selected category
            $('#categorySelect').change(function() {
                const selectedCategory = $(this).val(); // 선택된 카테고리 값 가져오기
                $('#subcategorySelect option').each(function() {
                    const option = $(this);
                    if (option.hasClass(selectedCategory)) {
                        option.removeClass('hidden');
                    } else {
                        option.addClass('hidden');
                    }
                });
                $('#subcategoryContainer').removeClass('hidden');
            });

            // 서브카테고리 선택 시 팝업 표시 
            $('#subcategorySelect').change(function() {
                $('#overlay').show(); // 배경을 어둡게
                $('#popup').show(); // 팝업 표시
            });

            // 팝업 닫기 버튼 클릭 시
            $('#goButton').click(function() {
                $('#overlay').hide(); // 배경 숨기기
                $('#popup').hide(); // 팝업 숨기기
            });

            // 위치 직접 선택 클릭 시
            $('#selectLocation').click(function() {
                alert('위치를 직접 선택하는 기능은 아직 구현되지 않았습니다.');
            });-
        });
    </script>

    <!-- Separate Popper and Bootstrap JS -->
    <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>

