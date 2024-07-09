package mvcboard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/addComment.do")
public class AddCommentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String boardId = request.getParameter("id");
        String writerId = (String) request.getSession().getAttribute("id");
        String content = request.getParameter("content");

        // Validate inputs
        if (boardId == null || writerId == null || content == null || boardId.isEmpty() || writerId.isEmpty() || content.isEmpty()) {
            // Handle error, maybe redirect or show an alert
            response.sendRedirect("../mvcboard/view.do?id=" + boardId); // Redirect back to view page
            return;
        }

        // Create a comment DTO and set its properties
        CommentDTO comment = new CommentDTO();
        comment.setCm_board(boardId);
        comment.setCm_writerId(writerId);
        comment.setCm_content(content);

        // Call DAO to insert comment into database
        CommentDAO dao = new CommentDAO();
        try {
            dao.insertComment(comment);
            // Redirect back to view page after successfully adding comment
            response.sendRedirect("../mvcboard/view.do?id=" + boardId);
        } catch (Exception e) {
            // Handle exception
            e.printStackTrace();
            // Redirect or forward to an error page
            response.sendRedirect("../error.jsp");
        } finally {
            dao.close(); // Ensure database resources are released
        }
    }
}
