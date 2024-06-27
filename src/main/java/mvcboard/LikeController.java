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

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        String idx = req.getParameter("idx");
        MVCBoardDAO dao = new MVCBoardDAO();
        dao.updateLikesCount(idx);  // 좋아요 수 1 증가
        dao.close();
        
        // 조회수는 증가하지 않도록 하고 원래 페이지로 리다이렉트
        resp.sendRedirect("view.do?idx=" + idx + "&like=true");
    }
}
