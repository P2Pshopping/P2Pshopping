package itemList;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/itemList")
public class ItemListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ItemListDAO dao = new ItemListDAO();
        List<ItemListDTO> itemList = dao.getItemList();
        request.setAttribute("itemList", itemList);
        request.getRequestDispatcher("/itemList.jsp").forward(request, response);
    }
}
