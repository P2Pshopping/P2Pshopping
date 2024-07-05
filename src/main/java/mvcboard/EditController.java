package mvcboard;

import java.io.IOException;
import java.nio.file.Paths;
import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/mvcboard/edit.do")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 10)
public class EditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MVCBoardDAO dao = new MVCBoardDAO();
        String id = req.getParameter("id");
        MVCBoardDTO dto = dao.selectView(id);
        String writerName = dao.getNameByWriterId(dto.getWriterId());
        req.setAttribute("dto", dto);
        req.setAttribute("writerName", writerName);
        req.getRequestDispatcher("/Board/Edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String saveDirectory = req.getServletContext().getRealPath("/uploads");
        String originalFileName = "";

        try {
            originalFileName = FileUtil.uploadFile(req, saveDirectory);
        } catch (Exception e) {
            e.printStackTrace(); // 파일 업로드 예외 로그 출력
            JSFunction.alertBack(resp, "파일 업로드 오류입니다: " + e.getMessage());
            return;
        }

        String id = req.getParameter("id");
        String prevOfile = req.getParameter("prevOfile");
        String prevSfile = req.getParameter("prevSfile");
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String category = req.getParameter("category");

        MVCBoardDTO dto = new MVCBoardDTO();
        dto.setId(id);
        dto.setBno(category);
        dto.setTitle(title);
        dto.setContent(content);

        if (originalFileName != null && !originalFileName.isEmpty()) {
            String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
            dto.setOfile(originalFileName);
            dto.setSfile(savedFileName);
            FileUtil.deleteFile(req, "/uploads", prevSfile);
        } else {
            dto.setOfile(prevOfile);
            dto.setSfile(prevSfile);
        }

        MVCBoardDAO dao = new MVCBoardDAO();
        int result = dao.updatePost(dto);
        dao.close();

        if (result == 1) {
            resp.sendRedirect("../mvcboard/view.do?id=" + id);
        } else {
            JSFunction.alertLocation(resp, "수정에 실패했습니다.", "../mvcboard/view.do?id=" + id);
        }
    }
}
