package mvcboard;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/like.do")
public class LikeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 사용자 세션에서 userId 가져오기
        Integer userId = (Integer) request.getSession().getAttribute("id");

        if (userId == null) {
            // 로그인되지 않은 경우 처리
            response.sendRedirect("view.do?id=" + request.getParameter("id") + "&error=notLoggedIn");
            return;
        }

        // 게시물 id 가져오기
        String boardId = request.getParameter("id");

        // DAO 객체 생성
        MVCBoardDAO dao = new MVCBoardDAO();

        // 사용자가 이미 좋아요를 눌렀는지 확인
        if (dao.isLikedByUser(boardId, userId)) {
            // 이미 좋아요를 눌렀을 경우
            response.sendRedirect("view.do?id=" + boardId + "&error=alreadyLiked");
        } else {
            // 좋아요 추가 및 게시물의 좋아요 수 증가
            dao.addLike(boardId, userId);
            response.sendRedirect("view.do?id=" + boardId + "&like=true");
        }

        // DAO 자원 정리
        dao.close();
    }
}
