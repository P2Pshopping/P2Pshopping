package itemList;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MainPage.do")
public class MainController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("1");
     // 페이지 번호와 페이지 크기 파라미터 받기
        int currentPage = 1;
        int pageSize = 32; // 한 페이지당 보여줄 아이템 수
        String pageParam = req.getParameter("page");
        String keyword = null;
        
        if(req.getParameter("keyword") != null) {

        	keyword = req.getParameter("keyword");

        }
        
        if (pageParam != null && !pageParam.isEmpty()) {
            currentPage = Integer.parseInt(pageParam);
        }

        int start = (currentPage - 1) * pageSize + 1;
        int end = currentPage * pageSize;

        ItemListDAO dao = new ItemListDAO();
        int totalProducts = dao.getProductCount();

        List<ItemListDTO> product = dao.getAllproduct(start, end, keyword);

        dao.close();

        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        
        req.setAttribute("product", product);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalPages", totalPages);
        req.getRequestDispatcher("/Main/Mainpage.jsp").forward(req, resp);
    }
}
