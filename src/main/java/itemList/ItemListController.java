package itemList;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/itemList/ItemList.do")
public class ItemListController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    System.out.println("1");

    ItemListDAO dao = new ItemListDAO();
    List<ItemListDTO> product = dao.getAllproduct();
    dao.close();

    req.setAttribute("product", product);
    req.getRequestDispatcher("/Main/ItemList.jsp").forward(req, resp);
  }
}
