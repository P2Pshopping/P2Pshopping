package common;

import java.io.IOException;
import java.util.List;

import User.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MainController extends HttpServlet {
    private UserDAO itemService;

    @Override
    public void init() throws ServletException {
        this.itemService = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Item> topItems = itemService.getTopItems();
        request.setAttribute("items", topItems);
        request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
    }
}
