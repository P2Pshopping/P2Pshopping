package itemList;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.BoardPage;

public class ItemListController extends HttpServlet {
	 private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productIdStr = req.getParameter("product_id");
        HttpSession session = req.getSession();
        
        
         Integer userId = (Integer) session.getAttribute("idx");
        int product_id = -1;
        
        
        if(productIdStr !=null & !productIdStr.isEmpty()) {
           try {
              product_id = Integer.parseInt(productIdStr);
              
              session.setAttribute("currentProductId", product_id);
              
              Integer product_id2 = (Integer) session.getAttribute("currentProductId");
              if (product_id2 == null) {
                  System.out.println("currentProductId 세션에 저장된 값이 없습니다.");
                
              } else {
                 
              }
           }catch(NumberFormatException e) {
              System.out.println("Invalid product_id format: " + productIdStr);
                  resp.getWriter().println("Invalid product_id format.");
                  return;
           }
        };

    	
    	ItemListDAO dao = new ItemListDAO();
        Map<String, Object> map = new HashMap<String, Object>();
        String searchField = req.getParameter("searchField");
        String searchWord = req.getParameter("searchWord");
        if (searchWord != null) {
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }

        int totalCount = dao.selectCount(map);

        ServletContext application = getServletContext();
        int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
        int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

        int pageNum = 1;
        String pageTemp = req.getParameter("pageNum");
        if (pageTemp != null && !pageTemp.isEmpty()) {
            pageNum = Integer.parseInt(pageTemp);
        }

        int start = (pageNum - 1) * pageSize + 1;
        int end = pageNum * pageSize;
        map.put("start", start);
        map.put("end", end);

        ArrayList<ItemListDTO> boardLists = null;
        try {
            boardLists = dao.selectListPage(map);
        } finally {
            dao.close();
        }

        String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../Main/ItemList.do");
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);

        req.setAttribute("boardLists", boardLists);
        req.setAttribute("map", map);
        req.getRequestDispatcher("/Main/ItemList.jsp").forward(req, resp);
    }
}
