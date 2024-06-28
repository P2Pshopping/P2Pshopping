package admin;
import admin.CategoryDAO;
import admin.CategoryDTO;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/categories.do")
public class CategoryAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

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
}
