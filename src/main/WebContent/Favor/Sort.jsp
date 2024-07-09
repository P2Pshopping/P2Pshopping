<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="PJ2.PJ2DTO"%>
<%@ page import="PJ2.PJ2DAO"%>
<%@ page import="java.util.*" %>  
<%@ page import="com.google.gson.Gson" %>

<%
    String order = request.getParameter("order");
    int bid = (int)session.getAttribute("id"); 
    PJ2DAO dao = new PJ2DAO();
    PJ2DTO dto5 = null;
     String bid2 = Integer.toString(bid);
    if ("asc".equals(order)) {
    	
        dto5 = dao.asc(bid2);
    } else {
        dto5 = dao.desc(bid2);
    }
    
    int[] favoritenum = dto5.getFavoritenum();
    String[] favoriteimg = dto5.getFavoriteimg();
    String[] favoritename = dto5.getFavoritename();
    int[] favoritepriceInt = dto5.getFavoriteprice();
    
    // 데이터를 담을 리스트
    List<Map<String, Object>> productList = new ArrayList<>();

    // 데이터 구성
    for (int i = 0; i < favoritenum.length; i++) {
        if (favoriteimg[i] != null && favoritename[i] != null) {
            Map<String, Object> product = new LinkedHashMap<>();
            product.put("num", favoritenum[i]);
            product.put("img", favoriteimg[i]);
            product.put("name", favoritename[i]);
            product.put("price", favoritepriceInt[i]); // 숫자 그대로 넣기
            productList.add(product);
        }
    }

    // Gson 객체 생성 (재사용 권장)
    Gson gson = new Gson();

    // JSON으로 변환하여 클라이언트에게 전달
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    out.print(gson.toJson(productList));
%>
