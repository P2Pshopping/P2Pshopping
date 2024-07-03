package review;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/review/edit")
public class ReviewEditServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ReviewDAO2 reviewDAO = new ReviewDAO2();
        ReviewDTO review = reviewDAO.getReviewById(id);

        request.setAttribute("review", review);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../Board/reviewEdit.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ReviewDAO2 reviewDAO = new ReviewDAO2();

        ReviewDTO review = new ReviewDTO();
        review.setId(Integer.parseInt(request.getParameter("id")));
        review.setTitle(request.getParameter("title"));
        review.setDetail(request.getParameter("detail"));
        review.setRating(Integer.parseInt(request.getParameter("rating")));
        review.setOfile(request.getParameter("ofile"));
        review.setSfile(request.getParameter("sfile"));

        int result = reviewDAO.updateReview(review);

        if (result > 0) {
            response.sendRedirect("list");
        } else {
            response.getWriter().write("리뷰 수정에 실패했습니다.");
        }
    }
}
