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

        
        Integer writerIdInteger = (Integer) request.getSession().getAttribute("id");
        if (writerIdInteger == null) {
            
            response.sendRedirect("../mvcboard/view.do?id=" + boardId);  
            return;
        }

        String writerId = writerIdInteger.toString();
        String content = request.getParameter("content");
        
        if (boardId == null || writerId == null || content == null || boardId.isEmpty() || writerId.isEmpty() || content.isEmpty()) {
            
            response.sendRedirect("../mvcboard/view.do?id=" + boardId); 
            return;
        }
       
        CommentDTO comment = new CommentDTO();
        comment.setCm_board(boardId);
        comment.setCm_writerId(writerId);
        comment.setCm_content(content);

       
        CommentDAO dao = new CommentDAO();
        int result = dao.insertComment(comment);
        dao.close();

        
        if (result > 0) {
            response.sendRedirect("../mvcboard/view.do?id=" + boardId);
        } else {
            
            response.sendRedirect("../mvcboard/view.do?id=" + boardId + "&error=commentFailed");
        }
    }
}
