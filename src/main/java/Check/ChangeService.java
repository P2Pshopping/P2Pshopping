package Check;

import java.io.IOException;

import User.UserDAO;
import common.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ChangeService.do") // 핸드폰 번호 변경
public class ChangeService extends HttpServlet {
	  private UserDAO userDAO;
	    
	    public void init() throws ServletException {
	        super.init();
	        userDAO = new UserDAO(); // 예시: 생성자에 맞게 초기화
	        // 추가적인 초기화 로직도 여기서 수행할 수 있음
	    }

	    
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.setCharacterEncoding("EUC-KR");

	        // 세션에서 사용자 정보 가져오기
	        HttpSession session = request.getSession();
	        String username = (String) session.getAttribute("username");
	        String phone = request.getParameter("phone");
	        
	        UserDTO user = userDAO.getUserDTO(username, phone);
	   
	        
	        if (username != null) {
	          

	            if (username == null || username.isEmpty() ) {
	                System.out.println("username is null");
	                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Username  cannot be null or empty");
	                return;  // Ensure no further proce
	            }
	            if( phone == null ||phone.isEmpty()) {
	            	
	                System.out.println("phone is null");
	                response.sendError(HttpServletResponse.SC_BAD_REQUEST, " phone cannot be null or empty");
	                return;  // Ensure no further proce
	            	
	        }
	            
	            // Here you would typically update the user information in the database
	            // Example: userDAO.updateUser(username, newPassword);
	            boolean success = userDAO.changePhone(username, phone); // 예시 메서드 호출

	            if (success) {
	                System.out.println("phone updated successfully for user: " + username);
	                // 서블릿에서 데이터를 설정하여 JSP 페이지로 전달하는 예시
	                request.setAttribute("message", "phone successfully updated!");
	                request.getRequestDispatcher("Main/Mainpage.jsp").forward(request, response);
	            } else {
	                System.out.println("Failed to update phone for user: " + username);
	                response.sendRedirect("Change/Change.jsp?error=updateFailed");
	            }
	        } else {
	            System.out.println("세션에서 가져온 객체의 타입이 UserDTO가 아닙니다.");
	            response.sendRedirect("Change/Change.jsp?error=invalidSession");
	        }
	        userDAO.close();
	    }
	}