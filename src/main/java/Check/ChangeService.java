package Check;

import java.io.IOException;
import java.io.PrintWriter;

import User.UserDAO;
import common.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/*@WebServlet("/ChangeService.do")*/ // 정보수정 핸드폰 번호 변경
public class ChangeService extends HttpServlet {
	  private UserDAO userDAO;
	    
	    public void init() throws ServletException {
	        super.init();
	        userDAO = new UserDAO(); // 예시: 생성자에 맞게 초기화
	        // 추가적인 초기화 로직도 여기서 수행할 수 있음
	    }

	    
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	response.setCharacterEncoding("UTF-8");
		    response.setContentType("text/html;charset=UTF-8");
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
	            	 String alertScript = "<script>alert('전화번호를 입력해주세요.');</script>";
						/*
						 * System.out.println("phone is null");
						 * response.sendError(HttpServletResponse.SC_BAD_REQUEST,
						 * " phone cannot be null or empty");
						 */
	                response.sendRedirect("Change/Change.jsp?error=updateFailed");
	                response.setContentType("text/html; charset=UTF-8");
	                PrintWriter out = response.getWriter();
	                out.print(alertScript);
	                return;  // Ensure no further proce
	            	
	        }else {
	            String alertScript = "<script>alert('전화번호가 성공적으로 변경되었습니다.');</script>";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.print(alertScript);
	        }
	            
	            // Here you would typically update the user information in the database
	            // Example: userDAO.updateUser(username, newPassword);
	            boolean success = userDAO.changePhone(username, phone); // 예시 메서드 호출

	            if (success) {
	                System.out.println("phone updated successfully for user: " + username);
	                // 서블릿에서 데이터를 설정하여 JSP 페이지로 전달하는 예시
	                request.setAttribute("message", "전화번호가 변경되었습니다.");
	                request.getRequestDispatcher("Main/default.jsp").forward(request, response);
	            } else {
	                System.out.println("Failed to update phone for user: " + username);
	                response.sendRedirect("Change/Change.jsp?error=updateFailed");
	            }
	        } else {
	            System.out.println("세션에서 가져온 객체의 타입이 UserDTO가 아닙니다.");
	            response.sendRedirect("Change/Change.jsp?error=invalidSession");
	        }
			/* userDAO.close(); */
	    }
	}