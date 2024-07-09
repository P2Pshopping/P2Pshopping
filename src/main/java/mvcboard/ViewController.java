package mvcboard;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 게시물 불러오기
        MVCBoardDAO dao = new MVCBoardDAO();
        String id = req.getParameter("id");

        // 조회수 증가 (좋아요 클릭이 아닌 경우에만)
        if (req.getParameter("like") == null) {
            dao.updateVisitCount(id);  // 조회수 1 증가
        }

        MVCBoardDTO dto = dao.selectView(id);

        // 작성자 이름 가져오기
        String writerName = dao.getNameByWriterId(dto.getWriterId());

        // 인기 게시글 가져오기
        List<MVCBoardDTO> likePosts = dao.get3likes();

        // 댓글 목록 가져오기
        CommentDAO commentDAO = new CommentDAO();
        List<CommentDTO> commentList = commentDAO.getCommentsByBoardId(id);

        // 댓글 작성자 이름 설정
        for (CommentDTO comment : commentList) {
            String commentWriterName = commentDAO.getWriterNameByCommentId(comment.getCm_id());
            comment.setCm_writerName(commentWriterName);
        }
        
        commentDAO.close();
        dao.close();

        // 줄바꿈 처리
        dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));

        // 첨부파일 확장자 추출 및 이미지 타입 확인
        String ext = null, fileName = dto.getSfile();
        if (fileName != null) {
            ext = fileName.substring(fileName.lastIndexOf(".") + 1);
        }
        String[] mimeStr = {"png", "jpg", "gif"};
        List<String> mimeList = Arrays.asList(mimeStr);
        boolean isImage = false;
        if (mimeList.contains(ext)) {
            isImage = true;
        }

        // 게시물(dto)와 작성자 이름(writerName), 인기 게시글(likePosts), 댓글 목록(commentList) 저장 후 뷰로 포워드
        req.setAttribute("dto", dto);
        req.setAttribute("isImage", isImage);
        req.setAttribute("writerName", writerName);
        req.setAttribute("likePosts", likePosts);
        req.setAttribute("commentList", commentList);

        req.getRequestDispatcher("/Board/View.jsp").forward(req, resp);
    }
}
