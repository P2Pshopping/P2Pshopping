package board;

import java.io.IOException;

import board.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import board.JSFunction;

/**
 * Servlet implementation class WriteController
 */
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/Board/Write.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws  ServletException, IOException{
		BoardDTO dto = new BoardDTO();
		dto.setTitle(req.getParameter("title"));
		dto.setDetail(req.getParameter("detail"));
		
	}
}
