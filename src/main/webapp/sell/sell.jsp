<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
   <script type="text/javascript" src="http://127.0.0.1:8983/app/js/jquery-1.7.2.min.js"></script>


<script type="text/javascript" src="http://127.0.0.1:8983/app/js/jquery-ui-1.12.1.min.js"></script>
<script type="text/javascript" src="http://127.0.0.1:8983/app/js/rns.search-1.0.min.js"></script>
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
    
    
   
    <script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("../popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}
</script>
      
    <script>

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
                goPopup();
            });

          
        });
        
    
    </script>
    
    
</head>

<body>

<form name="form" id="form" method="post" class="hidden">
	<table >
			<colgroup>
				<col style="width:20%"><col>
			</colgroup>
			<tbody>
				<tr>
					<th>우편번호</th>
					<td>
					    <input type="hidden" id="confmKey" name="confmKey" value=""  >
						<input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
						<!-- <input type="button"  value="주소검색" onclick="goPopup();"> -->
					</td>
				</tr>
				<tr>
					<th>도로명주소</th>
					<td><input type="text" id="roadAddrPart1" style="width:85%"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
						<input type="text" id="addrDetail" style="width:40%" value="">
						<input type="text" id="roadAddrPart2"  style="width:40%" value="">
					</td>
				</tr>
			</tbody>
		</table>
</form>







    <h2>상품 판매하기</h2>
  <!--    <div id="map"></div>
    <input type="text" id="address" placeholder="주소 입력">
    <button onclick="openJusoPopup()">검색</button>
    <div id="result"></div> -->

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
