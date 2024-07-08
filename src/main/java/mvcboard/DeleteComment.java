package mvcboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/mvcboard/deleteComment.do")
public class DeleteComment extends HttpServlet {
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

        // 댓글 ID 가져오기
        String commentIdStr = request.getParameter("commentId");
        int commentId = -1;

        if (commentIdStr != null) {
            commentId = Integer.parseInt(commentIdStr);
        }

        if (commentId != -1 && userId != -1) {
            CommentDAO dao = new CommentDAO();
            int deleteResult = dao.deleteComment(commentId);

            if (deleteResult > 0) {
                // 삭제 성공 시 처리할 로직 추가 가능
                response.sendRedirect("../mvcboard/view.do?id=" + request.getParameter("boardId"));
            } else {
                // 삭제 실패 시 처리할 로직 추가 가능
                response.sendRedirect("../mvcboard/view.do?id=" + request.getParameter("boardId"));
            }
        } else {
            // 유효한 댓글 ID와 사용자 ID가 없을 경우 처리할 로직 추가 가능
            response.sendRedirect("../mvcboard/view.do?id=" + request.getParameter("boardId"));
        }
    }
}
