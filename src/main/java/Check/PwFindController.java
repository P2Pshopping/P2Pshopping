package Check;

import common.UserDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import User.UserDAO;

@WebServlet("/PwFind.do") 
public class PwFindController extends HttpServlet {
	private UserDAO userDAO;

	 @Override
	    public void init() throws ServletException {
	        // 서블릿 초기화 메서드, 서블릿이 처음 생성될 때 한 번 호출됩니다.
	        ServletContext context = getServletContext(); // 서블릿 컨텍스트를 가져옵니다.
	        userDAO = new UserDAO(context); // UserDAO 객체를 초기화합니다.
	        System.out.println("UserDAO initialized: " + (userDAO != null)); // UserDAO 초기화 여부를 출력합니다.
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	   response.setCharacterEncoding("UTF-8");
	    	    response.setContentType("text/html;charset=UTF-8");
	    	    
	        String name = request.getParameter("name"); // 요청 파라미터에서 사용자 이름을 가져옵니다.
	        String phone = request.getParameter("phone"); // 요청 파라미터에서 비밀번호를 가져옵니다.
	        String username = request.getParameter("username"); 

	     
	        UserDTO user = userDAO.getPwFindDTO(name, phone,username); //  비밀번호로 사용자 정보를 검증합니다.

	        if (user != null) {
	            // 사용자 인증에 성공한 경우
	            HttpSession session = request.getSession(); // 현재 세션을 가져오거나 새 세션을 생성합니다.
	            session.setAttribute("username", user.getUsername()); // 세션에 사용자 이름을 저장합니다
	            session.setAttribute("name", user.getName());
	            session.setAttribute("phone", user.getPhone());
				/* session.setAttribute("password", user.getPassword()); */
	           	            
	            // 디버깅 메시지 추가
	            System.out.println("User session set: " + user.getPassword());
	            	
	            response.getWriter().write( " 귀하의 아이디는 " +  user.getPassword()+" 입니다.");
				/*
				 * response.sendRedirect("M.jsp"); // 로그인 성공 후 메인 페이지로 리디렉션합니다.
				 */	        } else {
					 response.getWriter().write("입력칸을 다시 한번 확인해주세요");
	            // 사용자 인증에 실패한 경우
				/*
				 * response.sendRedirect("Login/login.jsp?error=invalid"); // 로그인 폼으로 리디렉션하고 오류
				 * 메시지를 전달합니다.
				 */	        }
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // GET 요청을 처리하는 메서드
	        doPost(request, response); // POST 요청 처리 메서드를 호출하여 동일한 로직을 수행합니다.
	    }
	}