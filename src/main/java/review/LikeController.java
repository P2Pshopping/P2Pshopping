package review;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/review/like.do")
public class LikeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
    	int id = Integer.parseInt(req.getParameter("id"));
//        String id = req.getParameter("id");
        ReviewDAO2 dao = new ReviewDAO2();
        dao.updateLikesCount(id);  // 좋아요 수 1 증가
        dao.close();

        // 조회수는 증가하지 않도록 하고 원래 페이지로 리다이렉트
        resp.sendRedirect("view?id=" + id + "&like=true");
    }
}
