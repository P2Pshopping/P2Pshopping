package mvcboard;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@MultipartConfig
public class WriteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/Board/Write.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String saveDirectory = req.getServletContext().getRealPath("/Uploads");
        
        String originalFileName = "";
        try {
            originalFileName = FileUtil.uploadFile(req, saveDirectory);
        } catch (Exception e) {
            e.printStackTrace();
            JSFunction.alertLocation(resp, "파일 업로드 오류입니다", "../mvcboard/write.do");
            return;
        }

        MVCBoardDTO dto = new MVCBoardDTO();
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));

        MVCBoardDAO dao = new MVCBoardDAO();
        String username = req.getParameter("username");
        int writerId = dao.getWriterIdByUsername(username);
        dto.setWriterId(writerId);

        if (originalFileName != null && !originalFileName.isEmpty()) {
            String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
            dto.setOfile(originalFileName);
            dto.setSfile(savedFileName);
        }

        int result = dao.insertWrite(dto);
        dao.close();

        if (result == 1) {
            resp.sendRedirect("../mvcboard/list.do");
        } else {
            JSFunction.alertLocation(resp, "글쓰기에 실패했습니다", "../mvcboard/write.do");
        }
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> refs/heads/master
