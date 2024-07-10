package User;

import java.io.IOException;

import java.io.PrintWriter;


import common.UserDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


//@WebServlet("/login.do") // 이 서블릿을 "/login" URL 패턴에 매핑합니다.

public class LoginController extends HttpServlet {
	private UserDAO userDAO;
//	private UserDTO userDTO;

	@Override
	public void init() throws ServletException {
		// 서블릿 초기화 메서드, 서블릿이 처음 생성될 때 한 번 호출됩니다.
		ServletContext context = getServletContext(); // 서블릿 컨텍스트를 가져옵니다.
		userDAO = new UserDAO(context); // UserDAO 객체를 초기화합니다.
		/*
		 * System.out.println("UserDAO initialized: " + (userDAO != null)); // UserDAO
		 * 초기화 여부를 출력합니다.
		 */	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		   response.setCharacterEncoding("UTF-8");
   	    response.setContentType("text/html;charset=UTF-8");
		// POST 요청을 처리하는 메서드
		String username = request.getParameter("username"); // 요청 파라미터에서 사용자 이름을 가져옵니다.
		String password = request.getParameter("password"); // 요청 파라미터에서 비밀번호를 가져옵니다.
		String checkbox = request.getParameter("checkbox");
//		if (password == null) {
//			System.out.println(" password is null");
//		}
		
		String hashedPassword = userDAO.hashPassword(password); // 입력된 비밀번호를 해시화합니다.
		UserDTO user = userDAO.getUserDTO(username, hashedPassword); // 해시된 비밀번호로 사용자 정보를 검증합니다.

        PrintWriter out = response.getWriter();
        Cookie cookie = new Cookie("username", username);

        if (checkbox != null) {
            cookie.setMaxAge(60 * 60 * 24 * 7); // 7일 동안 유효한 쿠키
        } else {
            cookie.setMaxAge(0); // 쿠키 삭제
        }
        response.addCookie(cookie);

        if (user != null) {
            // 사용자 인증에 성공한 경우
            HttpSession session = request.getSession(); // 현재 세션을 가져오거나 새 세션을 생성합니다.
            session.setAttribute("username", user.getUsername()); // 세션에 사용자 이름을 저장합니다.
            session.setAttribute("name", user.getName());
            session.setAttribute("id", user.getId());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("phone", user.getPhone());
            session.setAttribute("address", user.getAddress());
            session.setAttribute("password", user.getPassword());
            session.setAttribute("kakaoId", user.getKakaoId());
            session.setAttribute("naverId", user.getNaverId());
            session.setAttribute("provinceId", user.getProvinceId());
            session.setAttribute("cityId", user.getCityId());
            session.setAttribute("districtId", user.getDistrictId());
            session.setAttribute("auth", user.getAuth());
            session.setAttribute("createDate", user.getCreateDate());


//			session.setAttribute("checked", user);

			// 디버깅 메시지 추가
			/* System.out.println("User session set: " + user.getName()); */
//			UserDTO userDTO = new UserDTO();
//			session = request.getSession();
//			session.setAttribute("getUserDTO", userDTO); // userDTO는 로그인 성공 후 가져온 사용자 정보 객체

            response.sendRedirect("Main/default.jsp"); // 로그인 성공 후 메인 페이지로 리디렉션합니다.
        } else {
            // 사용자 인증에 실패한 경우
            out.println("<html>");
            out.println("<head>");
            out.println("<script type='text/javascript'>");
            out.println("alert('아이디와 비밀번호를 다시 한번 확인해주세요.');");
            out.println("window.location.href = 'Login/login.jsp';"); // 이전 페이지로 이동
            out.println("</script>");
            out.println("</head>");
            out.println("<body></body>");
            out.println("</html>");
        }
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// GET 요청을 처리하는 메서드
		doPost(request, response); // POST 요청 처리 메서드를 호출하여 동일한 로직을 수행합니다.
	}

}
