package admin;

import java.io.IOException;
import java.util.List;

import User.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DashboardServlet
 */
//@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        TransactionDAO transactionDAO = new TransactionDAO();
        ProductDAO productDAO = new ProductDAO();
        ReviewDAO reviewDAO = new ReviewDAO();
        SiteTrafficDAO trafficDAO = new SiteTrafficDAO();

        int activeUsers = userDAO.getActiveUserCount();
        int inactiveUsers = userDAO.getInactiveUserCount();
        int todayTransactions = transactionDAO.getTodayTransactionCount();
        int weekTransactions = transactionDAO.getWeekTransactionCount();
        int monthTransactions = transactionDAO.getMonthTransactionCount();
        int newProducts = productDAO.getNewProductCount();
        List<ReviewDTO> recentReviews = reviewDAO.getRecentReviews();
        int totalVisits = trafficDAO.getTotalVisits();
        int dashboardVisits = trafficDAO.getPageVisits("/iMarket/dashboard");
        int sellProductVisits = trafficDAO.getPageVisits("/iMarket/sell/sellProduct.jsp");
        int MainpageVisits = trafficDAO.getPageVisits("/iMarket/Main/Mainpage.jsp");
        int HospitalVisits = trafficDAO.getPageVisits("/iMarket/hospital/Hospital1.jsp");
//        int dashboardVisits = trafficDAO.getPageVisits("/iMarket/dashboard");


        request.setAttribute("activeUsers", activeUsers);
        request.setAttribute("inactiveUsers", inactiveUsers);
        request.setAttribute("todayTransactions", todayTransactions);
        request.setAttribute("weekTransactions", weekTransactions);
        request.setAttribute("monthTransactions", monthTransactions);
        request.setAttribute("newProducts", newProducts);
        request.setAttribute("recentReviews", recentReviews);
        request.setAttribute("totalVisits", totalVisits);
        request.setAttribute("dashboardVisits", dashboardVisits);
        request.setAttribute("sellProductVisits", sellProductVisits);
        request.setAttribute("MainpageVisits", MainpageVisits);
        request.setAttribute("HospitalVisits", HospitalVisits);

        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/dashboard.jsp");
        dispatcher.forward(request, response);
    }
}

