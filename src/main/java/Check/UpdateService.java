package Check;

import User.UserDAO;
import common.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/UpdateService.do") // 비밀번호 변경 
public class UpdateService extends HttpServlet {
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
        String newPassword = request.getParameter("password");
        
        String hashedPassword = userDAO.hashPassword(newPassword); // 입력된 비밀번호를 해시화합니다.
        UserDTO user = userDAO.getUserDTO(username, hashedPassword);
        
        if (username != null) {
          

            if (username == null || username.isEmpty() ) {
				/* System.out.println("username is null"); */
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Username cannot be null or empty");
                return;  // Ensure no further proce
            }
            if( hashedPassword == null ||hashedPassword.isEmpty()) {
            	
				/* System.out.println("newPassword is null"); */
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "password cannot be null or empty");
                return;  // Ensure no further proce
            	
        }
            
            // Here you would typically update the user information in the database
            // Example: userDAO.updateUser(username, newPassword);
            boolean success = userDAO.changePassword(username, hashedPassword); // 예시 메서드 호출

            if (success) {
				/* System.out.println("Password updated successfully for user: " + username); */
                // 서블릿에서 데이터를 설정하여 JSP 페이지로 전달하는 예시
                request.setAttribute("message", "비밀번호가 변경되었습니다.");
                request.getRequestDispatcher("Main/default.jsp").forward(request, response);
            } else {
				/* System.out.println("Failed to update password for user: " + username); */
                response.sendRedirect("Change/Change.jsp?error=updateFailed");
            }
        } else {
			/* System.out.println("세션에서 가져온 객체의 타입이 UserDTO가 아닙니다."); */
            response.sendRedirect("Change/Change.jsp?error=invalidSession");
        }
		/* userDAO.close(); */
    }
}