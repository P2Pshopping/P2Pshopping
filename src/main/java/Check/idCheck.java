package Check;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import User.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/idCheck") // 아이디 중복 확인
public class idCheck extends HttpServlet {

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // 클라이언트로부터 전달받은 username 파라미터 가져오기
	        String username = request.getParameter("username");
			/*
			 * System.out.println("----------------------"); System.out.println(
			 * " 중복 체크 이름 :" + username );
			 */
	        boolean result = false;
	        String errorMessage = null;
	        
	        try {
	            // 아이디 중복 체크 메소드 호출
	            result = new UserDAO().idCheck(username);
	            
				/* System.out.println(result + " 이건 idcheck"); */
	            
	        } catch (Exception e) {
	            errorMessage = "오류 발생: " + e.getMessage();
	            e.printStackTrace();
	        }
	        
	        // 클라이언트에게 JSON 형식으로 응답
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        
	        PrintWriter out = response.getWriter();
	        if (errorMessage != null) {
	            out.print("{\"success\": false, \"message\": \"" + errorMessage + "\"}");
	        } else {
	            out.print("{\"success\": true, \"result\": " + result + "}");
	        }
	    }
	}