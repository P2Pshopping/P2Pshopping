<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../iMarket/CSS/style-header.css" rel="stylesheet">
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
          /*   body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            
         text-align: center;
            padding: 20px;
            margin-bottom: 10px;
        } */
        .narrow-select {
            width: 300px;
            height: auto;
        }
        option {
            color: black;
        }
        /*.container {
            max-width: 800px;
            margin-top: 50px;
        }*/
           .container {
           max-width: 1200px;
            background-color: #fff;
            padding: 20px;
            margin-top: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
    
    
   <!-- 도로명지도검색 API -->
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
	
    // Save data to session storage
    sessionStorage.setItem('roadAddrPart1', roadAddrPart1);
    sessionStorage.setItem('addrDetail', addrDetail);
    sessionStorage.setItem('roadAddrPart2', roadAddrPart2);
    sessionStorage.setItem('zipNo', zipNo);
	
    // Debugging logs
    console.log("roadAddrPart1 set to: " + roadAddrPart1);
    console.log("addrDetail set to: " + addrDetail);
    console.log("roadAddrPart2 set to: " + roadAddrPart2);
    console.log("zipNo set to: " + zipNo);
}




</script>
      
    <script>

        $(document).ready(function() {
        	
        	  var data = [
                  "유아 안전용품 > 아기 모니터",
                  "유아 안전용품 > 침대 난간 및 가드",
                  "유아 안전용품 > 게이트 및 가드",
                  "유아 안전용품 > 기타 아기 및 어린이 안전용품",
                  "유아 안전용품 > 놀이펜",
                  "바운서, 로커 및 그네 > 아기 바운서",
                  "바운서, 로커 및 그네 > 아기 로커",
                  "바운서, 로커 및 그네 > 아기 그네",
                  "바운서, 로커 및 그네 > 아기 보행기",
                  "아기 옷",
                  "카시트 및 아기 캐리어",
                  "기저귀 용품 > 기저귀 가방",
                  "기저귀 용품 > 기저귀 가방",
                  "기저귀 용품 > 기저귀 매트",
                  "기저귀 용품 > 기타 기저귀 갈이 용품",
                  "기저귀 용품 > 유아용 변기",
                  "수유 용품 > 젖병 워머",
                  "수유 용품 > 젖병",
                  "수유 용품 > 유축기",
                  "수유 용품 > 기타 수유 용품",
                  "유아 옷, 신발 및 액세서리 > 옷 묶음",
                  "유아 옷, 신발 및 액세서리 > 드레스",
                  "유아 옷, 신발 및 액세서리 > 청바지 및 바지",
                  "유아 옷, 신발 및 액세서리 > 어린이 액세서리",
                  "유아 옷, 신발 및 액세서리 > 코트 및 재킷",
                  "유아 옷, 신발 및 액세서리 > 잠옷",
                  "유아 옷, 신발 및 액세서리 > 기타 어린이 옷",
                  "유아 옷, 신발 및 액세서리 > 신발 및 부츠",
                  "유아 옷, 신발 및 액세서리 > 수영복",
                  "유아 옷, 신발 및 액세서리 > 상의 및 셔츠",
                  "유아 및 어린이 가구 > 욕조",
                  "유아 및 어린이 가구 > 기저귀 교환대",
                  "유아 및 어린이 가구 > 유아용 침대",
                  "유아 및 어린이 가구 > 아기 침대 및 요람",
                  "유아 및 어린이 가구 > 하이체어",
                  "유아 및 어린이 가구 > 램프, 조명 및 갓",
                  "유아 및 어린이 가구 > 기타",
                  "야외 장난감 > 기타 야외 장난감",
                  "야외 장난감 > 놀이집 및 놀이 텐트",
                  "야외 장난감 > 모래놀이 및 물놀이 장난감",
                  "야외 장난감 > 스쿠터",
                  "야외 장난감 > 스케이트보드",
                  "야외 장난감 > 미끄럼틀",
                  "유모차 및 스토롤러",
                  "장난감"
              ];
        	//검색어 자동완성
            $('#autocompleteInput').autocomplete({
                source: function(request, response) {
                    var results = $.ui.autocomplete.filter(data, request.term);
                    response(results.slice(0, 3));
                },
                minLength: 1
            });
            
			//검색창옆 확인버튼
            $("#autocompleteInput").on("input", function() {
                var inputLength = $(this).val().length;
                if (inputLength > 0) {
                    $("#confirmButton").show();
                } else {
                    $("#confirmButton").hide();
                }
            });

			//카테고리확인버튼
            $('#confirmButton').click(function() {			
                $('#overlay').show();
                goPopup();
                $('#categoryContainer').hide();
                $('#subcategoryContainer').hide();
            });

			//'카테고리를 직접 둘러보시겠어요?'링크클릭
            $('#showCategoriesButton').click(function() {
                $('#categoryContainer').toggleClass('hidden');
            });

			// 상위카테고리 선택
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

            // 하위카테고리 선택
            $('#subcategorySelect').change(function() {			
                $('#overlay').show();
                goPopup();
                $('#autocompleteInput').val('');
            });

            $('#nextPage').click(function(event) {
                var category = document.getElementById('categorySelect').value;
                var subcategory = document.getElementById('subcategorySelect').value;

                // 숨겨진 필드에 값 설정
                document.getElementById('selectedCategoryInput').value = category;
                document.getElementById('selectedSubcategoryInput').value = subcategory;

                // 디버깅 출력
                console.log('Category:', category);
                console.log('Subcategory:', subcategory);
                alert('Category: ' + category + '\nSubcategory: ' + subcategory);

                // 실제 제출을 위해 기본 동작 유지
                return true; // 기본 폼 제출 동작 유지
            });
          
        });
        
    
    </script>
    
    
</head>
<%@ include file="/layout/Header.jsp"%>
<body style="overflow-x: scroll; margin: 0 auto; width: 1200px; align-items: center; background-color: #f7f7f7;">



	<br />
	<br />

 

    <div class="container" >
       <h2>상품 판매하기</h2>
        <div class="category-section">
            <label for="autocompleteInput">어떤 물건을 판매하고 싶으신가요?:</label>
             <button id="confirmButton" class="btn btn-primary hidden">확인</button>
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
                <label for="subcategorySelectlabel">하위 카테고리를 선택해주세요:</label>
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

	<!-- 화면어둡게 -->
    <div id="overlay" class="hidden"></div>
    
    <!-- 주소확인 && 다음버튼 -->
    <form name="form" action="sellProduct.jsp" id="form" method="post" class="hidden">
    <!--  hidden input 필드를 추가하여, 선택된 카테고리와 서브카테고리 값을 전송할 수 있도록 -->
    <input type="hidden" id="selectedCategoryInput" name="selectedCategory">
    <input type="hidden" id="selectedSubcategoryInput" name="selectedSubcategory">
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
	<!-- 	<button type="submit" id="nextPage" class="btn btn-primary hidden">다음</button> -->
	  <button type="submit"  id="nextPage" class="btn btn-primary">다음</button>
</form>
    
</body>
<%@ include file="../layout/Footer.jsp"%>
</html>
