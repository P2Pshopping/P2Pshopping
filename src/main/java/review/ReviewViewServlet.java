package review;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/review/view")
public class ReviewViewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        ReviewDAO2 reviewDAO = new ReviewDAO2();
        
        // 조회수 증가 (좋아요 클릭이 아닌 경우에만)
        String likeParam = request.getParameter("like");
//        System.out.println("Received like parameter: " + likeParam); // 로그 추가
        
     // 조회수 증가 (좋아요 클릭이 아닌 경우에만)
//        if (request.getParameter("like") == null) {
//        	reviewDAO.updateVisitCount(id);  // 조회수 1 증가
//        }
        
//        if (request.getParameter("like") == null) {
            if (likeParam == null) {
//        	System.out.println("Like parameter is null, updating visit count.");
            reviewDAO.updateVisitCount(id);  // 조회수 1 증가
        } else {
            System.out.println("Like parameter is present, not updating visit count.");
        }
       
        ReviewDTO review = reviewDAO.getReviewById(id);
        System.out.println("Review details: " + review); // 리뷰 정보 로그 추가

        if (review == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Review not found with id: " + id);
            return;
        }
        
        // 작성자 이름 가져오기
        String writerName = reviewDAO.getNameByWriterId(review.getWriterId());
        System.out.println("Writer name: " + writerName); // 작성자 이름 로그 추가

        // 인기 게시글 가져오기
        List<ReviewDTO> likePosts = reviewDAO.get3likes();
        System.out.println("Popular posts: " + likePosts); // 인기 게시글 로그 추가

        reviewDAO.close();

        // 줄바꿈 처리
        review.setDetail(review.getDetail().replaceAll("\r\n", "<br/>"));

        // 첨부파일 확장자 추출 및 이미지 타입 확인
        String ext = null, fileName = review.getSfile();
        if(fileName != null) {
            ext = fileName.substring(fileName.lastIndexOf(".") + 1);
        }
        String[] mimeStr = {"png", "jpg", "gif"};
        List<String> mimeList = Arrays.asList(mimeStr);
        boolean isImage = false;
        if(mimeList.contains(ext)) {
            isImage = true;
        }

        // 게시물(dto)와 작성자 이름(writerName) 및 인기 게시글(popularPosts) 저장 후 뷰로 포워드
        request.setAttribute("dto", review);
        request.setAttribute("isImage", isImage);
        request.setAttribute("writerName", writerName);
        request.setAttribute("likePosts", likePosts);
        
        
     // 세션에서 ID 가져오기
        HttpSession session = request.getSession();
        Integer sessionId = (Integer) session.getAttribute("id");

        // 세션 ID를 리뷰 작성자 ID와 비교하여 request에 설정
        if (sessionId != null && sessionId.equals(review.getWriterId())) {
            request.setAttribute("isOwner", true);
        } else {
            request.setAttribute("isOwner", false);
        }
        
        request.setAttribute("review", review);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../Board/reviewView.jsp");
        dispatcher.forward(request, response);
    }
}