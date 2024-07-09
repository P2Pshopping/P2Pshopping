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
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//@WebServlet("/review/list")
public class ReviewListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	 int id = Integer.parseInt(request.getParameter("id"));
    	
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
        

        // 인기 게시글 가져오기
        List<ReviewDTO> likePosts = dao.get3likes();
        System.out.println("Number of popular posts fetched: " + likePosts.size()); // 디버깅 로그 추가

       

//        ReviewDTO review = dao.getReviewById(id);
        dao.close();
        
//        // 작성자 이름 가져오기
//        String writerName = dao.getNameByWriterId(review.getWriterId());
//        System.out.println("Writer name: " + writerName); // 작성자 이름 로그 추가
        
        
        // 줄바꿈 처리
//        review.setDetail(review.getDetail().replaceAll("\r\n", "<br/>"));

////         첨부파일 확장자 추출 및 이미지 타입 확인
//        String ext = null, fileName = review.getSfile();
//        if(fileName != null) {
//            ext = fileName.substring(fileName.lastIndexOf(".") + 1);
//        }
//        String[] mimeStr = {"png", "jpg", "gif"};
//        List<String> mimeList = Arrays.asList(mimeStr);
//        boolean isImage = false;
//        if(mimeList.contains(ext)) {
//            isImage = true;
//        }

        // 게시물(dto)와 작성자 이름(writerName) 및 인기 게시글(popularPosts) 저장 후 뷰로 포워드
//        request.setAttribute("dto", review);
//        request.setAttribute("isImage", isImage);
//        request.setAttribute("writerName", writerName);
//        request.setAttribute("likePosts", likePosts);
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

        request.setAttribute("reviews", reviews);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("likePosts", likePosts); // 인기글 리스트 설정

        // JSP에 전달하기 전에 리스트 크기 로그 출력
        System.out.println("Number of likePosts: " + likePosts.size());

        request.getRequestDispatcher("../Board/reviewList.jsp").forward(request, response);
    }
}

