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
    int pageSize = 9; // 한 페이지에 보여줄 상품 수
    int currentPage = 1; // 기본 페이지 번호
    String pageParam = req.getParameter("page");

    if (pageParam != null && !pageParam.isEmpty()) {
        currentPage = Integer.parseInt(pageParam);
    }

    int start = (currentPage - 1) * pageSize + 1;
    int end = currentPage * pageSize;

    ItemListDAO dao = new ItemListDAO();
    int totalProducts = dao.getProductCount();
    List<ItemListDTO> products = dao.selectProducts(start, end);
    dao.close();

    int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

    req.setAttribute("products", products);
    req.setAttribute("totalPages", totalPages);
    req.setAttribute("currentPage", currentPage);

    req.getRequestDispatcher("/Main/ItemList.jsp").forward(req, resp);
  }
}
