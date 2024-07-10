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
        // 페이지 번호와 페이지 크기 파라미터 받기
        int currentPage = 1;
        int pageSize = 20; // 한 페이지당 보여줄 아이템 수
        int pageGroupSize = 5; // 한 그룹당 페이지 수
        String pageParam = req.getParameter("page");
        String keyword = null;
        
        if (req.getParameter("keyword") != null) {
            keyword = req.getParameter("keyword");
        }
        
        if (pageParam != null && !pageParam.isEmpty()) {
            currentPage = Integer.parseInt(pageParam);
        }

        int start = (currentPage - 1) * pageSize + 1;
        int end = currentPage * pageSize;

        ItemListDAO dao = new ItemListDAO();
        int totalProducts = dao.getProductCount(); // keyword 추가
        List<ItemListDTO> product = dao.getAllproduct(start, end, keyword); // keyword 추가
        dao.close();

        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        // 페이지 그룹의 시작과 끝 계산
        int currentGroup = (currentPage - 1) / pageGroupSize;
        int groupStartPage = currentGroup * pageGroupSize + 1;
        int groupEndPage = Math.min(groupStartPage + pageGroupSize - 1, totalPages);
        

        req.setAttribute("keyword", keyword);
        req.setAttribute("product", product);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("pageSize", pageSize);
        req.setAttribute("groupStartPage", groupStartPage);
        req.setAttribute("groupEndPage", groupEndPage);
        req.setAttribute("pageGroupSize", pageGroupSize);
        
        req.getRequestDispatcher("/Main/ItemList.jsp").forward(req, resp);
    }
}
