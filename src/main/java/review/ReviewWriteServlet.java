package review;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

//@WebServlet("/review/write")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
    maxFileSize = 1024 * 1024 * 50, // 50 MB
    maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class ReviewWriteServlet extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "uploads";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("../Board/reviewWrite.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ReviewDAO2 reviewDAO = new ReviewDAO2();

        String transactionIdStr = request.getParameter("transactionId");
        if (transactionIdStr == null || transactionIdStr.isEmpty()) {
            response.getWriter().write("거래 ID가 유효하지 않습니다.");
            return;
        }

        ReviewDTO review = new ReviewDTO();
        review.setTransactionId(Integer.parseInt(transactionIdStr));
        review.setTitle(request.getParameter("title"));
        review.setDetail(request.getParameter("detail"));
        review.setRating(Integer.parseInt(request.getParameter("rating")));
        // 세션에서 사용자 ID 가져오기
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("id");
        if (userId == null) {
            response.getWriter().write("로그인이 필요합니다.");
            return;
        }
        review.setWriterId(userId);
	    
        // Handle file upload
        for (Part part : request.getParts()) {
            if (part.getName().equals("reviewImages") && part.getSize() > 0) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                File filePath = new File(uploadPath);
                if (!filePath.exists()) filePath.mkdirs();
                part.write(filePath + File.separator + fileName);
                review.setOfile(fileName);
                review.setSfile(UPLOAD_DIRECTORY + "/" + fileName);
                break;
            }
        }

        int result = reviewDAO.insertReview(review);

        if (result > 0) {
            response.sendRedirect("list");
        } else {
            response.getWriter().write("리뷰 작성에 실패했습니다.");
        }
    }
}
