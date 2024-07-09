package review;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/review/delete")
public class ReviewDeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ReviewDAO2 reviewDAO = new ReviewDAO2();
        
        int result = reviewDAO.deleteReview(id);
        
        if (result > 0) {
            response.sendRedirect("list");
        } else {
            response.getWriter().write("리뷰 삭제에 실패했습니다.");
        }
    }
}
