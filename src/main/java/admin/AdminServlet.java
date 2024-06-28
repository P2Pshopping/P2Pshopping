package admin;

import java.io.IOException;
import java.util.List;

import org.apache.catalina.realm.JNDIRealm.User;

import com.example.dao.AdminDAO;
import com.example.model.Product;
import com.example.model.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO;

    public void init() {
        adminDAO = new AdminDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = adminDAO.getAllUsers();
        List<Product> products = adminDAO.getAllProducts();
        List<Transaction> transactions = adminDAO.getAllTransactions();

        request.setAttribute("users", users);
        request.setAttribute("products", products);
        request.setAttribute("transactions", transactions);

        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}

