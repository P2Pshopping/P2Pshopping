package review;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/review/view")
public class ReviewViewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ReviewDAO reviewDAO = new ReviewDAO();
        ReviewDTO review = reviewDAO.getReviewById(id);

        request.setAttribute("review", review);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../Board/reviewView.jsp");
        dispatcher.forward(request, response);
    }
}