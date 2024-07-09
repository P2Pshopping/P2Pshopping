package sell;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
//@WebServlet("/sellController.do")  // 주석 처리
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
	    maxFileSize = 1024 * 1024 * 10,       // 10MB
	    maxRequestSize = 1024 * 1024 * 50     // 50MB
	)

public class SellController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 디버깅 메시지 추가
        System.out.println("SellController doPost 메서드 호출됨");

        String selectedCategory = request.getParameter("selectedCategory");
        String selectedSubcategory = request.getParameter("selectedSubcategory");
                String productName = request.getParameter("productName");
                String productDescription = request.getParameter("productDescription");
                String price = request.getParameter("price");
                String roadAddrPart1 = request.getParameter("roadAddrPart1");
                String addrDetail = request.getParameter("addrDetail");

//                String photo1 = saveImage(request.getParameter("photo1"));
//                String photo2 = saveImage(request.getParameter("photo2"));
//                String photo3 = saveImage(request.getParameter("photo3"));
//                String photo4 = saveImage(request.getParameter("photo4"));

//                String name = (String) request.getSession().getAttribute("name");
                String email = (String) request.getSession().getAttribute("email");
//                String phone = (String) request.getSession().getAttribute("phone");

                SellDAO sellDAO = new SellDAO();
                List<String> fileNames = new ArrayList<>();

                for (Part part : request.getParts()) {
                    if (part.getName().equals("productImages") && part.getSize() > 0) {
                        String fileName = part.getSubmittedFileName();
                        String uploadPath = getServletContext().getRealPath("") + "uploads" + File.separator + fileName;

                        File uploadDir = new File(getServletContext().getRealPath("") + "uploads");
                        if (!uploadDir.exists()) {
							uploadDir.mkdir();
						}

                        try {
                            part.write(uploadPath);
                            fileNames.add("/uploads/" + fileName);
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }

                String photo1 = fileNames.size() > 0 ? fileNames.get(0) : null;
                String photo2 = fileNames.size() > 1 ? fileNames.get(1) : null;
                String photo3 = fileNames.size() > 2 ? fileNames.get(2) : null;
                String photo4 = fileNames.size() > 3 ? fileNames.get(3) : null;


             // 좌표 변환 API 호출
                Coordinates coordinates = getCoordinates(roadAddrPart1);

                try {
                    int categoryId = sellDAO.getCategoryId(selectedCategory);
                    int subCategoryId = sellDAO.getSubcategoryId(selectedSubcategory);
                    int writerId = sellDAO.getUserId(email);

                    sellDAO.saveProduct(productName, categoryId, subCategoryId, Integer.parseInt(price), productDescription,
                    		photo1, photo2, photo3, photo4, writerId, roadAddrPart1, addrDetail, coordinates.getLatitude(), coordinates.getLongitude());


                    response.sendRedirect("../itemList/ItemList.do");

                } catch (SQLException e) {
                    e.printStackTrace();
//                    response.sendRedirect("error.jsp");
                    response.sendRedirect(request.getContextPath() + "/error.jsp");  // 경로 수정
                }
    }

    private Coordinates getCoordinates(String address) {
        String clientId = "ztfp2obt82"; // 네이버 클라이언트 ID
        String clientSecret = "hnPwfHZh6DgZl65JqRsZJks2sfn8ahvpnfY0mLjG"; // 네이버 클라이언트 시크릿
        String apiURL = "";

        try {
            apiURL = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=" + java.net.URLEncoder.encode(address, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null; // 인코딩 실패 시 null 반환
        }

        CloseableHttpClient client = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(apiURL);
        httpGet.addHeader("X-NCP-APIGW-API-KEY-ID", clientId);
        httpGet.addHeader("X-NCP-APIGW-API-KEY", clientSecret);

        try (CloseableHttpResponse httpResponse = client.execute(httpGet)) {
            String responseString = EntityUtils.toString(httpResponse.getEntity(), "UTF-8");
            JSONObject jsonResponse = new JSONObject(responseString);
            JSONArray addresses = jsonResponse.getJSONArray("addresses");
            if (addresses.length() > 0) {
//                JSONObject addressObject = addresses.getJSONObject(0);
//                String latitude = addressObject.getString("y");
//                String longitude = addressObject.getString("x");
//                return "위도: " + latitude + ", 경도: " + longitude;

                JSONObject addressObject = addresses.getJSONObject(0);
                String latitude = addressObject.getString("y");
                String longitude = addressObject.getString("x");
                return new Coordinates(latitude, longitude);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private class Coordinates {
        private String latitude;
        private String longitude;

        public Coordinates(String latitude, String longitude) {
            this.latitude = latitude;
            this.longitude = longitude;
        }

        public String getLatitude() {
            return latitude;
        }

        public String getLongitude() {
            return longitude;
        }
    }
}
