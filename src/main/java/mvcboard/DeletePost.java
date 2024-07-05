package mvcboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/mvcboard/deletePost.do")
public class DeletePost extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // 세션에서 사용자 ID 가져오기
        Object userIdObj = session.getAttribute("id");
        int userId = -1;

        if (userIdObj != null) {
            if (userIdObj instanceof Integer) {
                userId = (Integer) userIdObj;
            } else {
                userId = Integer.parseInt((String) userIdObj);
            }
        }

        // 게시물 ID 가져오기
        String postId = request.getParameter("id");

        if (postId != null && userId != -1) {
            MVCBoardDAO dao = new MVCBoardDAO();
            MVCBoardDTO post = dao.selectView(postId);

            // 작성자와 세션의 userId 비교
            if (post != null && post.getWriterId() == userId) {
                dao.deletePost(postId);
                
            }
        }

        response.sendRedirect("../mvcboard/list.do");
    }
}
