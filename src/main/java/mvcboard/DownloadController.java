package mvcboard;

import fileupload.FileUtil;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/download.do")
/**
 * Servlet implementation class DownloadController
 */

public class DownloadController extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ofile = req.getParameter("ofile");
		String sfile = req.getParameter("sfile");
		String id = req.getParameter("id");

		FileUtil.download(req, resp, "/uploads", sfile, ofile);

		MVCBoardDAO dao = new MVCBoardDAO();
		
		dao.close();

	}

}
