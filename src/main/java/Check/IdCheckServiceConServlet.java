package Check;

import User.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/idCheckService")
public class IdCheckServiceConServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("[IdCheckServiceConServlet]");
        // 아이디 중복체크 버튼 눌렀을 때 ajax로 보낸 email값 받기
        String username = request.getParameter("username");
        System.out.println("username : " + username);
        // 아이디 중복체크 메소드 호출!
        boolean result = new UserDAO().idCheck(username);

        System.out.println(result);
        PrintWriter out = response.getWriter();
        out.print(result);
    }
}
