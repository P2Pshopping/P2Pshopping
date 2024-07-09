<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="PJ2.PJ2DTO"%>
<%@ page import="PJ2.PJ2DAO"%>
<%@ page import="java.util.*" %>  
<%@ page import="com.google.gson.Gson" %>

<%
    String order = request.getParameter("order");
    String bid = (String) session.getAttribute("username"); 
    PJ2DAO dao = new PJ2DAO();
    PJ2DTO dto5;
    
    if ("asc".equals(order)) {
        dto5 = dao.asc(bid);
    } else {
        dto5 = dao.desc(bid);
    }

    String[] favoriteimg = dto5.getFavoriteimg();
    int[] favoritepriceInt = dto5.getFavoriteprice();
    String[] favoritename = dto5.getFavoritename();

    // 데이터를 담을 리스트
    List<Map<String, Object>> productList = new ArrayList<>();

    // 데이터 구성
    for (int i = 0; i < 100; i++) {
        if (favoriteimg[i] != null && favoritename[i] != null) {
            Map<String, Object> product = new LinkedHashMap<>();
            product.put("img", favoriteimg[i]);
            product.put("name", favoritename[i]);
            product.put("price", favoritepriceInt[i]); // 숫자 그대로 넣기
            productList.add(product);
        }
    }

    // 가격순으로 정렬
    if ("asc".equals(order)) {
        productList.sort((Map<String, Object> p1, Map<String, Object> p2) -> {
            Integer price1 = (Integer) p1.get("price");
            Integer price2 = (Integer) p2.get("price");
            return price1.compareTo(price2);
        });
    } else {
        productList.sort((Map<String, Object> p1, Map<String, Object> p2) -> {
            Integer price1 = (Integer) p1.get("price");
            Integer price2 = (Integer) p2.get("price");
            return price2.compareTo(price1);
        });
    }

    // 정렬된 데이터를 JSON으로 변환하여 클라이언트에게 전달
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    out.print(new Gson().toJson(productList));
%>