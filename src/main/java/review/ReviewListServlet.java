package review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//@WebServlet("/review/list")
public class ReviewListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ReviewDAO dao = new ReviewDAO();
        List<ReviewDTO> reviews = dao.selectReviews();
        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("../Board/reviewList.jsp").forward(request, response);
    }
}
