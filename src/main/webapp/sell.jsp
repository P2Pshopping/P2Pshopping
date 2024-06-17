<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 판매하기</title>
    <script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ztfp2obt82"></script> <!-- 네이버 지도 API 키 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <style>
        #map {
            width: 100%;
            height: 400px;
        }
        .narrow-select {
            width: 300px;
            height: auto;
        }
        option {
            color: black;
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
            width: 100%;
        }
        #popup, #locationPopup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #f0f8ff;
            border: 1px solid black;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }
        #popup label, #locationPopup label {
            display: block;
            margin-bottom: 10px;
        }
        #popup input[type="text"], #locationPopup select {
            width: calc(100% - 50px);
            margin-right: 10px;
        }
        #popup button, #locationPopup button {
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
    <script>
        function searchAddress() {
            const address = document.getElementById('address').value;
            if (!address) {
                alert('주소를 입력해주세요.');
                return;
            }

            naver.maps.Service.geocode({
                address: address
            }, function(status, response) {
                if (status !== naver.maps.Service.Status.OK) {
                    return alert('주소 검색에 실패하였습니다.');
                }

                const result = response.result.items[0];
                const addr = result.address;
                document.getElementById('result').innerText = addr;

                const mapCenter = new naver.maps.LatLng(result.point.y, result.point.x);
                const map = new naver.maps.Map(document.getElementById('map'), {
                    center: mapCenter,
                    zoom: 10
                });

                new naver.maps.Marker({
                    position: mapCenter,
                    map: map
                });
            });
        }

        $(document).ready(function() {
            $('#autocompleteInput').autocomplete({
                source: function(request, response) {
                    var results = $.ui.autocomplete.filter(data, request.term);
                    response(results.slice(0, 3));
                },
                minLength: 1
            });

            $('#showCategoriesButton').click(function() {
                $('#categoryContainer').toggleClass('hidden');
            });

            $('#categorySelect').change(function() {
                const selectedCategory = $(this).val();
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

            $('#subcategorySelect').change(function() {
                $('#overlay').show();
                $('#popup').show();
            });

            $('#goButton').click(function() {
                $('#overlay').hide();
                $('#popup').hide();
            });

            $('#selectLocation').click(function() {
                $('#locationPopup').removeClass('hidden');
                $('#overlay').removeClass('hidden');
                loadProvinces();
            });

            $('#provinceSelect').change(function() {
                loadCities();
            });

            $('#citySelect').change(function() {
                loadDistricts();
            });

            $('#locationConfirmButton').click(function() {
                const province = $('#provinceSelect').val();
                const city = $('#citySelect').val();
                const district = $('#districtSelect').val();
                alert(`선택된 위치: ${province} ${city} ${district}`);
                $('#locationPopup').addClass('hidden');
                $('#overlay').addClass('hidden');
            });

            $('#currentLocationButton').click(function() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function(position) {
                        const latitude = position.coords.latitude;
                        const longitude = position.coords.longitude;
                        alert(`현재 위치: ${latitude}, ${longitude}`);
                        $('#popup').addClass('hidden');
                        $('#overlay').addClass('hidden');
                    });
                } else {
                    alert("Geolocation은 이 브라우저에서 지원되지 않습니다.");
                }
            });

            function openJusoPopup() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                        document.getElementById('address').value = data.address; // 주소 정보를 해당 필드에 입력
                        searchAddress();
                    }
                }).open();
            }

            function loadProvinces() {
                // 도로명주소 팝업 API 사용하여 도 목록 불러오기
                $.ajax({
                    url: 'https://business.juso.go.kr/addrlink/addrLinkUrl.do', // 도로명주소 API 엔드포인트
                    method: 'POST',
                    data: {
                        confmKey: 'U01TX0FVVEgyMDI0MDYxNjIyNDUwMDExNDg0NTc=', // 발급받은 API 키
                        currentPage: 1,
                        countPerPage: 100,
                        resultType: 'json'
                    },
                    success: function(data) {
                        const provinces = data.results.juso.map(item => item.sido);
                        const select = $('#provinceSelect');
                        select.empty();
                        [...new Set(provinces)].forEach(province => {
                            select.append(new Option(province, province));
                        });
                    },
                    error: function() {
                        alert('도 목록을 불러오는데 실패했습니다.');
                    }
                });
            }

            function loadCities() {
                const province = $('#provinceSelect').val();
                $.ajax({
                    url: 'https://business.juso.go.kr/addrlink/addrLinkUrl.do',
                    method: 'POST',
                    data: {
                        confmKey: 'U01TX0FVVEgyMDI0MDYxNjIyNDUwMDExNDg0NTc=',
                        currentPage: 1,
                        countPerPage: 100,
                        keyword: province,
                        resultType: 'json'
                    },
                    success: function(data) {
                        const cities = data.results.juso.map(item => item.sigungu);
                        const select = $('#citySelect');
                        select.removeClass('hidden');
                        select.empty();
                        [...new Set(cities)].forEach(city => {
                            select.append(new Option(city, city));
                        });
                    },
                    error: function() {
                        alert('시 목록을 불러오는데 실패했습니다.');
                    }
                });
            }

            function loadDistricts() {
                const city = $('#citySelect').val();
                $.ajax({
                    url: 'https://business.juso.go.kr/addrlink/addrLinkUrl.do',
                    method: 'POST',
                    data: {
                        confmKey: 'U01TX0FVVEgyMDI0MDYxNjIyNDUwMDExNDg0NTc=',
                        currentPage: 1,
                        countPerPage: 100,
                        keyword: city,
                        resultType: 'json'
                    },
                    success: function(data) {
                        const districts = data.results.juso.map(item => item.dong);
                        const select = $('#districtSelect');
                        select.removeClass('hidden');
                        select.empty();
                        [...new Set(districts)].forEach(district => {
                            select.append(new Option(district, district));
                        });
                    },
                    error: function() {
                        alert('동 목록을 불러오는데 실패했습니다.');
                    }
                });
            }
        });
    </script>
</head>
<body>
    <h2>상품 판매하기</h2>
    <div id="map"></div>
    <input type="text" id="address" placeholder="주소 입력">
    <button onclick="openJusoPopup()">검색</button>
    <div id="result"></div>

    <div class="container">
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

    <div id="overlay" class="hidden"></div>
    <div id="popup" class="hidden">
        <label>판매자분의 위치를 알려주세요</label>
        <button id="currentLocationButton">현재 위치로 설정하기</button>
        <label>우편번호</label>
        <input type="text" id="zipcode" placeholder="우편번호">
        <button id="goButton">Go</button>
        <p>우편번호는 외부에 공개되지 않습니다</p>
        <p><a href="javascript:void(0);" id="selectLocation">위치를 직접 선택하시겠어요?</a></p>
    </div>

    <div id="locationPopup" class="hidden">
        <label>도 선택</label>
        <select id="provinceSelect"></select>
        <label>시 선택</label>
        <select id="citySelect" class="hidden"></select>
        <label>동 선택</label>
        <select id="districtSelect" class="hidden"></select>
        <button id="locationConfirmButton">확인</button>
    </div>
</body>
</html>
