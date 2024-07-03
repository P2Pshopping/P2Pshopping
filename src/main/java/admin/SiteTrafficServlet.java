package admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SiteTrafficServlet
 */
//@WebServlet("/track")
public class SiteTrafficServlet extends HttpServlet {
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageUrl = request.getParameter("pageUrl");
//        int userId = (request.getSession().getAttribute("id") != null) ? (int) request.getSession().getAttribute("id") : 0;

        Integer userId = (request.getSession().getAttribute("id") != null) ? (Integer) request.getSession().getAttribute("id") : 0;

//        System.out.println("Page URL: " + pageUrl);
//        System.out.println("User ID: " + userId);


        SiteTrafficDAO trafficDAO = new SiteTrafficDAO();
        trafficDAO.saveVisit(pageUrl, userId);

//        response.sendRedirect(pageUrl);
//        response.getWriter().write("Visit recorded");
    }
}