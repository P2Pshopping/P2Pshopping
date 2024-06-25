package Kakao;

import Kakao.KakaoDTO;
import User.UserDAO;
import common.UserDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class KakaoController extends HttpServlet{
	private KakaoDAO kakaoDAO;
	
	@Override
	   public void init() throws ServletException {
        // 서블릿 초기화 메서드, 서블릿이 처음 생성될 때 한 번 호출됩니다.
        ServletContext context = getServletContext(); // 서블릿 컨텍스트를 가져옵니다.
        kakaoDAO = new KakaoDAO(context); // UserDAO 객체를 초기화합니다.
        System.out.println("KakaoDAO initialized: " + (kakaoDAO != null)); // UserDAO 초기화 여부를 출력합니다.
    }
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // POST 요청을 처리하는 메서드
	        String uname = request.getParameter("username"); // 요청 파라미터에서 사용자 이름을 가져옵니다.
	        String upass = request.getParameter("password"); // 요청 파라미터에서 비밀번호를 가져옵니다.
	        if (upass == null) {
	        	System.out.println(" upass is null");
	        }

	        String hashedPassword = kakaoDAO.hashPassword(upass); // 입력된 비밀번호를 해시화합니다.
	        KakaoDTO kuser = kakaoDAO.getKakaoDTO(uname, upass); // 해시된 비밀번호로 사용자 정보를 검증합니다.

	        if (kuser != null) {
	            // 사용자 인증에 성공한 경우
	            HttpSession session = request.getSession(); // 현재 세션을 가져오거나 새 세션을 생성합니다.
	            session.setAttribute("token", kuser.getKakaoId()); // 세션에 사용자 이름을 저장합니다.	          
	            session.setAttribute("password", kuser.getPassword());
	            session.setAttribute("kakaoId", kuser.getKakaoId());	       
	            session.setAttribute("createDate", kuser.getCreateDate());
	            
	            

	            response.sendRedirect("Mainpage.jsp"); // 로그인 성공 후 메인 페이지로 리디렉션합니다.
	        } else {
	            // 사용자 인증에 실패한 경우
	            response.sendRedirect("Login/login.jsp?error=invalid"); // 로그인 폼으로 리디렉션하고 오류 메시지를 전달합니다.
	        }
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // GET 요청을 처리하는 메서드
	        doPost(request, response); // POST 요청 처리 메서드를 호출하여 동일한 로직을 수행합니다.
	    }
	}

}
