package review;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/review/download.do")
public class ReviewDownloadController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ofile = req.getParameter("ofile");
        String sfile = req.getParameter("sfile");
//        String id = req.getParameter("id");

        // 실제 파일 다운로드 기능 구현
        FileUtil.download(req, resp, "/uploads", sfile, ofile);

        // 리뷰 조회수 증가
        ReviewDAO2 dao = new ReviewDAO2();
//        dao.updateVisitCount(Integer.parseInt(id));
        dao.close();
    }
}

