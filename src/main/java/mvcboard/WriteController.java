package mvcboard;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;


public class WriteController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/Board/Write.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String saveDirectory = req.getServletContext().getRealPath("/uploads");

	    String originalFileName = "";
	    try {
	        originalFileName = FileUtil.uploadFile(req, saveDirectory);
	    } catch (IOException e) {
	        e.printStackTrace();
	        JSFunction.alertLocation(resp, "파일 업로드 중 오류가 발생했습니다.", "../mvcboard/write.do");
	        return;
	    }

	    // 파일 업로드 성공 후 데이터 처리
	    MVCBoardDTO dto = new MVCBoardDTO();
	    dto.setTitle(req.getParameter("title"));
	    dto.setContent(req.getParameter("content"));
	    dto.setBno(req.getParameter("bno"));
	    
	    // 작성자 ID 조회
	    MVCBoardDAO dao = new MVCBoardDAO();
	    String username = req.getParameter("username");
	    int writerId = dao.getWriterIdByUsername(username);
	    dto.setWriterId(writerId);

	    if (originalFileName != null && !originalFileName.isEmpty()) {
	        // 파일 이름 변경 및 DTO에 설정
	        String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
	        dto.setOfile(originalFileName);
	        dto.setSfile(savedFileName);
	    }

	    // 글 쓰기 데이터베이스에 저장
	    int result = dao.insertWrite(dto);
	    dao.close();

	    if (result == 1) {
	        resp.sendRedirect("../mvcboard/list.do");
	        System.out.println("게시물 저장 완료");
	    } else {
	        JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "../mvcboard/write.do");
	    }
	}

}

