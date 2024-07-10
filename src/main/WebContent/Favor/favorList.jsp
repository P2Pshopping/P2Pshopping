<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="PJ2.PJ2DTO"%>
<%@ page import="PJ2.PJ2DAO"%>
<%@ page import="java.util.*" %>  

    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="DPCSS.css" rel="stylesheet" type="text/css">
<link href='http://www.openhiun.com/hangul/nanumbarungothic.css' rel='stylesheet' type='text/css'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<link href="DPCSS.css" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">
    <title>My Favor List</title>

    <style>
        .card {
            margin-bottom: 20px;
        }

        .card-img-top {
             height: 200px;
    width: 250px;
            object-fit: cover;
        }
     /*     .custom-container {
            margin-top: 200px; /* 헤더가 사라질 때 공간을 유지하는 역할 */
        } */
          .custom-row {
                max-width: 1100px;
                margin-left: auto;
                margin-right: auto;
            }

            .card-img-top {
                width: 300px;
                height: 300px;
                object-fit: cover;
            }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../layout/Header.jsp"%>

        <div class="custom-container">
      <div class="visual">
            <div class="fav_wrapper" style = "margin-top:60px;">
                <span class="left">
                    <span class="title_font">${sessionScope.username} <span class="nim">님</span></span>
                </span>
                <div class="right text">게시물 : ${sessionScope.boardCount} 개</div>
                <div class="right text">찜 개수 : ${sessionScope.likeCount} 개</div>
                <div class="right text">판매 상품 : ${sessionScope.productCount} 개</div>
            </div>
            </div>
    
          
                <div class="dropdown text" style="float:right;">
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"style="margin-left:30px;margin-bottom:100px;">
                        ▼ 가격순
                    </button>
                    <ul class="dropdown-menu text">
                        <li><a class="dropdown-item text" href="#" data-order="asc" onclick="sortFavorite('asc')">▲ 가격순</a></li>
                        <li><a class="dropdown-item text" href="#" data-order="desc" onclick="sortFavorite('desc')">▼ 가격순</a></li>
                    </ul>
        </div>	
</div>


        <div class="container text-center text">
            <div class="visual text" id="visualContainer">
          
                <%
                    PJ2DAO dao = new PJ2DAO();  
                    PJ2DTO dto = new PJ2DTO();

                    /* session.setAttribute("username", "43"); */  //주석해서 쓰세요
                    String bid = (String)session.getAttribute("username");    
                    int num = (int)session.getAttribute("id");  
                    String num2 = Integer.toString(num);
                    PJ2DTO dto5 = dao.favorite(num2);
                    int [] favoritenum = Arrays.copyOf(dto5.getFavoritenum(),100);
                    String[] favoriteimg = Arrays.copyOf(dto5.getFavoriteimg(), 100); //이미지
                    int[] favoriteprice = Arrays.copyOf(dto5.getFavoriteprice(), 100); //가격
                    String[] favoritename = Arrays.copyOf(dto5.getFavoritename(), 100); // 이름
                   boolean hasData = favoriteimg.length > 0 && favoriteimg[0] != null;
                    if (!hasData) {
                        %>
                        <div class="message text" style = "margin-top:400px;margin-bottom:200px;">찜한 상품이 없습니다.</div> 
                        <% } else  {  %>
                        <%
                    int numItems = 9; 
                    int count = Math.min(numItems, favoriteimg.length);
                    int j = 0;
                    for (int i = 0; i < 20; i++) {
                    
                        if (i % 4 == 0) {
                        	System.out.println("글번호 : " + favoritenum[j] );
                   System.out.println("이미지 : " + favoriteimg[j]);
                   System.out.println("이름 : " + favoritename[j]);
                   System.out.println("가격 : " + favoriteprice[j]);
                 
                %>
                <div class="row custom-row  text-left" style =" margin-top:30px;">
                <% } %>
                        <% if (j < numItems || favoriteimg[j] != null) {
                        	  if (favoriteimg[j] == null){
                           	   break;
                              } 
                        	%>

                <div class="col-md-4 mb-4" style="width:350px;height:470px;">
                    <div class="card" style="border:none;width:330px;height:450px;">
                           <a href="../DetailPage/DetailPage.jsp?sellerid=<%=favoritenum[j]%>"><img src="../<%= favoriteimg[j] %>" class="card-img-top" alt="..." style=" margin:0 auto;width: 200px; object-fit: cover;"></a>
                        <div class="card-body text">
                            <h5 class="card-title text" style ="font-weight: bold; font-family: 'Nanum Barun Gothic', sans-serif;"><%= favoritename[j] %></h5>
                            <p class="card-text" ><%= favoriteprice[j] +"원"%></p>
                      
                        </div>
                        <% } else { %>
                        <div class="empty-card card text" style="border: none;">
                        
                        </div>
                        <% } %>
                    </div>
                </div>

                <%
                    if ((i + 1) % 4 == 0 || i == 14) {
                    	
                %>
                </div>
                <%
                    }
                    j++;
                %>
                <%
                    }
                        } 
                %>
            </div>
        </div>

       <script>
       function sortFavorite(order) {
    	    $.ajax({
    	        url: 'http://localhost:8081/iMarket/Favor/Sort.jsp',
    	        method: 'POST',
    	        data: { order: order },
    	        dataType: 'json',
    	        success: function(data) {
    	            var visualContainer = $('#visualContainer');
    	            visualContainer.empty();

    	            // 받아온 데이터를 이용하여 카드 HTML을 동적으로 생성
    	            var itemsPerRow = 3; // 한 행당 카드 개수
    	            var rowHtml = ''; // 한 행에 추가할 HTML을 담을 변수

    	            $.each(data, function(index, item) {
    	                if (index % itemsPerRow === 0) {
    	                    rowHtml += '<div class="row custom-row text-left" style =" margin-top:30px;">';
    	                }

    	                var cardHtml = '<div class="col-md-4 mb-4" style="width:350px;height:470px;">' +
                        '<div class="card" style="border:none;width:330px;height:450px;">' +
                        '<a href="../DetailPage/DetailPage.jsp?sellerid=' + item.num + '">' +
                        '<img src="../' + item.img + '" class="card-img-top" alt="Product Image" style="margin:0 auto;width: 200px; object-fit: cover;">' +
                        '</a>' +
                        '<div class="card-body text-left">' +
                        '<h5 class="card-title text" style="font-weight: bold; font-family: \'Nanum Barun Gothic\', sans-serif;">' + item.name + '</h5>' +
                        '<p class="card-text">' + item.price + '원</p>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
    	                            
    
    	                            
    	                            
    	                            
    	                            

    	                rowHtml += cardHtml;

    	                if ((index + 1) % itemsPerRow === 0 || index === data.length - 1) {
    	                    rowHtml += '</div>'; // 행 닫기
    	                    visualContainer.append(rowHtml);
                            rowHtml = '';
    	                }
    	            });

    	            visualContainer.append(rowHtml);

    	            console.log('정렬 완료');
    	        },
    	        
    	        error: function(xhr) {
    	            console.error('에러 발생: ' + xhr.statusText);
    	        }
    	    });
    	}

</script>

     
    </div> 
    
            <jsp:include page="../layout/Footer.jsp" />
            
</body>
</html> 
