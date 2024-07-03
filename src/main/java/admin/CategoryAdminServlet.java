package admin;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/categories.do")
public class CategoryAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("CategoryServlet doGet 호출됨"); // 디버그 메시지

        // ServletContext에서 데이터베이스 연결 정보를 가져와서 DAO를 초기화
        ServletContext context = getServletContext();
        CategoryDAO categoryDAO = new CategoryDAO(context);

        // 카테고리 목록을 가져와서 request에 설정
        List<CategoryDTO> categoryList = categoryDAO.getAllCategories();
        request.setAttribute("categoryList", categoryList);

        System.out.println("categoryList 설정됨: " + categoryList); // 디버그 메시지

        // JSP 페이지로 포워딩
        request.getRequestDispatcher("/admin/categories.jsp").forward(request, response);
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("CategoryServlet doPost 호출됨"); // 디버그 메시지

        // ServletContext에서 데이터베이스 연결 정보를 가져와서 DAO를 초기화
        ServletContext context = getServletContext();
        CategoryDAO categoryDAO = new CategoryDAO(context);

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String url = request.getParameter("url");

            CategoryDTO category = new CategoryDTO();
            category.setName(name);
            category.setUrl(url);

            categoryDAO.addCategory(category);

        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String url = request.getParameter("url");

            CategoryDTO category = new CategoryDTO();
            category.setId(id);
            category.setName(name);
            category.setUrl(url);

            categoryDAO.updateCategory(category);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            categoryDAO.deleteCategory(id);
        }

        // 변경 후 다시 목록을 불러오기
        List<CategoryDTO> categoryList = categoryDAO.getAllCategories();
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("/admin/categories.jsp").forward(request, response);
    }
}