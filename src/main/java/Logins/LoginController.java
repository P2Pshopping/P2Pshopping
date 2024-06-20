package Logins;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/Login/login.jsp").forward(request, response);
    
    
    
    }
}
//        response.setContentType("application/json");
//        PrintWriter out = response.getWriter();
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        Connection conn= null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##musthave", "1234");
//
//            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
//            ps = conn.prepareStatement(sql);
//            ps.setString(1, username);
//            ps.setString(2, password);
//           rs = ps.executeQuery();
//
//            if (rs.next()) {
//            	HttpSession session = request.getSession();
//            	session.setAttribute("username", username);
//            	response.sendRedirect("login.jsp");
//                out.print("{\"success\": true, \"message\": \"로그인 성공\"}");
//            } else {
//                out.print("{\"success\": false, \"message\": \"아이디 또는 비밀번호가 잘못되었습니다.\"}");
//            }
//
//            rs.close();
//            ps.close();
//            conn.close();
//        } catch (Exception e) {
//            out.print("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
//            e.printStackTrace();
//        }
//        finally {
//        	try {
//        		if(rs != null) rs.close();
//        		if(ps != null) ps.close();
//        		if(conn != null) conn.close();
//        		
//        	}catch (Exception e) {
//        		e.printStackTrace();
//        	}
//         }