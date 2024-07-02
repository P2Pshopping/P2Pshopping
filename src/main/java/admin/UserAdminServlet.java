package admin;

import java.io.IOException;
import java.util.List;

import User.UserDAO;
import common.UserDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/users.do")
public class UserAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UserServlet doGet 호출됨"); // // 디버그 메시지

        // ServletContext에서 데이터베이스 연결 정보를 가져와서 DAO를 초기화
        ServletContext context = getServletContext();
        UserDAO userDAO = new UserDAO(context);

        String action = request.getPathInfo();
        if (action == null) {
            action = "/";
        }

        switch (action) {
            case "/editUser":
                showEditForm(request, response, userDAO);
                break;
            case "/deleteUser":
                deleteUser(request, response, userDAO);
                break;
            default:
                listUsers(request, response, userDAO);
                break;
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response, UserDAO userDAO) throws ServletException, IOException {
        List<UserDTO> userList = userDAO.getAllUsers();
        request.setAttribute("userList", userList);

        System.out.println("userList 설정됨: " + userList); // 디버그 메시지

        // JSP 페이지로 포워딩
        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response, UserDAO userDAO) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UserDTO existingUser = userDAO.getUserById(id);
        request.setAttribute("user", existingUser);
        request.getRequestDispatcher("/admin/editUser.jsp").forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response, UserDAO userDAO) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);
//        response.sendRedirect("users");
        response.sendRedirect(request.getContextPath() + "/admin/users");

    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = getServletContext();
        UserDAO userDAO = new UserDAO(context);

        String action = request.getPathInfo();
        if (action == null) {
            action = "/";
        }

        switch (action) {
            case "/updateUser":
                updateUser(request, response, userDAO);
                break;
            default:
                doGet(request, response);
                break;
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response, UserDAO userDAO) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String auth = request.getParameter("auth");
        int active = Integer.parseInt(request.getParameter("active"));

        UserDTO user = new UserDTO();
        user.setId(id);
        user.setUsername(username);
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setAuth(auth);
        user.setActive(active);
        userDAO.updateUser(user);
//        response.sendRedirect("users");
        response.sendRedirect(request.getContextPath() + "/admin/users");

    }
}
