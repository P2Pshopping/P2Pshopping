package User;

import common.UserDAO;
import common.UserDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

//@WebServlet("/admin/users.do")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UserServlet doGet 호출됨"); // 디버그 메시지

        // ServletContext에서 데이터베이스 연결 정보를 가져와서 DAO를 초기화
        ServletContext context = getServletContext();
        UserDAO userDAO = new UserDAO(context);

        // 사용자 목록을 가져와서 request에 설정
        List<UserDTO> userList = userDAO.getAllUsers();
        request.setAttribute("userList", userList);
        
        System.out.println("userList 설정됨: " + userList); // 디버그 메시지

        // JSP 페이지로 포워딩
        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
    }
}

