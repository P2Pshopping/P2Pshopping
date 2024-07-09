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

        String keyword = null;
        
        if(req.getParameter("keyword") != null) {
        	keyword = req.getParameter("keyword");
        }
        // 페이지 번호와 페이지 크기 파라미터 받기
        int page = 1;
        int pageSize = 9; // 한 페이지당 보여줄 아이템 수

        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        if (req.getParameter("pageSize") != null) {
            pageSize = Integer.parseInt(req.getParameter("pageSize"));
        }

        ItemListDAO dao = new ItemListDAO();
        List<ItemListDTO> product = dao.getAllproduct(page, pageSize, keyword);
        dao.close();

        req.setAttribute("keyword", keyword);
        req.setAttribute("product", product);
        req.setAttribute("currentPage", page);
        req.setAttribute("pageSize", pageSize);
        req.getRequestDispatcher("/Main/ItemList.jsp").forward(req, resp);
    }
}
