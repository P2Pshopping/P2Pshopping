package hospital;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/KakaoHospitalSearch")
public class KakaoHospitalSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String department = request.getParameter("department");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");
            String apiKey = "0637e168501ef6ed107e35286b4b79b1"; // 카카오 API 키

            if (department == null || latitude == null || longitude == null) {
                response.getWriter().println("Missing required parameters.");
                return;
            }

            String text = URLEncoder.encode(department, "UTF-8");
            String apiURL = "https://dapi.kakao.com/v2/local/search/keyword.json?query=" + text + "&x=" + longitude + "&y=" + latitude;

            Map<String, String> requestHeaders = new HashMap<>();
            requestHeaders.put("Authorization", "KakaoAK " + apiKey);
            requestHeaders.put("KA", "sdk/1.0 os/java lang/java origin/your.service.domain");

            String responseBody = get(apiURL, requestHeaders);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(responseBody);
        } catch (Exception e) {
            e.printStackTrace(); // 예외를 출력하여 디버깅
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private static String get(String apiUrl, Map<String, String> requestHeaders) throws IOException {
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 오류 발생
                return readBody(con.getErrorStream());
            }
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl) throws IOException {
        URL url = new URL(apiUrl);
        return (HttpURLConnection) url.openConnection();
    }

    private static String readBody(InputStream body) throws IOException {
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        }
    }
}

