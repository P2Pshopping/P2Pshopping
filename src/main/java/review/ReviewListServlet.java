//package review;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
////@WebServlet("/review/list")
////public class ReviewListServlet extends HttpServlet {
////    private static final long serialVersionUID = 1L;
////
////    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//////        ReviewDAO dao = new ReviewDAO();
//////        List<ReviewDTO> reviews = dao.selectReviews();
//////        request.setAttribute("reviews", reviews);
////        int pageSize = 9; // 한 페이지에 보여줄 리뷰 수
////        int currentPage = 1; // 기본 페이지 번호
////        String pageParam = request.getParameter("page");
////
////        if (pageParam != null && !pageParam.isEmpty()) {
////            currentPage = Integer.parseInt(pageParam);
////        }
////
////        int start = (currentPage - 1) * pageSize + 1;
////        int end = currentPage * pageSize;
////
////        ReviewDAO dao = new ReviewDAO();
////        List<ReviewDTO> reviews = dao.selectReviews(start, end);
////        int totalReviews = dao.getReviewCount();
////
////        int totalPages = (int) Math.ceil((double) totalReviews / pageSize);
//public class ReviewListServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int pageSize = 9; // 한 페이지에 보여줄 리뷰 수
//        int currentPage = 1; // 기본 페이지 번호
//        String pageParam = request.getParameter("page");
//
//        if (pageParam != null && !pageParam.isEmpty()) {
//            currentPage = Integer.parseInt(pageParam);
//        }
//
//        int start = (currentPage - 1) * pageSize + 1;
//        int end = currentPage * pageSize;
//
//        ReviewDAO dao = new ReviewDAO();
//        List<ReviewDTO> reviews = dao.selectReviews(start, end);
//        int totalReviews = dao.getReviewCount();
//
//        int totalPages = (int) Math.ceil((double) totalReviews / pageSize);
//
//        // 로그 출력
//        System.out.println("totalReviews: " + totalReviews);
//        System.out.println("totalPages: " + totalPages);
//        System.out.println("currentPage: " + currentPage);
//        request.setAttribute("reviews", reviews);
//        request.setAttribute("totalPages", totalPages);
//        request.setAttribute("currentPage", currentPage);
//        request.getRequestDispatcher("../Board/reviewList.jsp").forward(request, response);
//    }
//}


package review;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//@WebServlet("/review/list")
public class ReviewListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 9; // 한 페이지에 보여줄 리뷰 수
        int currentPage = 1; // 기본 페이지 번호
        String pageParam = request.getParameter("page");

        if (pageParam != null && !pageParam.isEmpty()) {
            currentPage = Integer.parseInt(pageParam);
        }

        int start = (currentPage - 1) * pageSize + 1;
        int end = currentPage * pageSize;

        ReviewDAO2 dao = new ReviewDAO2();
		// 리뷰 리스트 가져오기
		int totalReviews = dao.getReviewCount();
        List<ReviewDTO> reviews = dao.selectReviews(start, end);
        

        // 페이징을 위한 파라미터 설정
        //Map<String, Object> map = new HashMap<>();
        //map.put("start", start);
        //map.put("end", end);

        // 리뷰 리스트 가져오기
        //List<ReviewDTO> reviews = dao.selectReviews(start, end);

        // 총 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalReviews / pageSize);

        // 로그 출력
        System.out.println("totalReviews: " + totalReviews);
        System.out.println("totalPages: " + totalPages);
        System.out.println("currentPage: " + currentPage);
        //System.out.println("Reviews retrieved: " + reviews.size());

        request.setAttribute("reviews", reviews);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.getRequestDispatcher("../Board/reviewList.jsp").forward(request, response);
    }
}

