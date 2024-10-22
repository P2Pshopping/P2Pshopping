package PJ2;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DetailController")
public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String sid = request.getParameter("sid");
		    String bid = request.getParameter("bid");
		    int sid2 = Integer.parseInt(sid);
		    int bid2 = Integer.parseInt(bid);
		    PJ2DAO dao = new PJ2DAO();
		    PJ2DTO dto = dao.likesearch(sid2, bid2);
		  
		    
		    if (dto.getLikeSearch()=="0") {
		        int result = dao.like(sid, bid); // DAO의 like 메서드 호출
		        response.getWriter().write("찜하기!");  
		    } else {
		    	int result = dao.likedelete(sid, bid);
		        response.getWriter().write("찜해제!");
		    }
		    
	 }

	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    // 클라이언트에서 전송한 데이터 가져오기
		    String action = request.getParameter("action");
		    int sid = Integer.parseInt(request.getParameter("sid"));
		    String bidname = request.getParameter("bidname");

		    PJ2DAO db = new PJ2DAO();
		    try {
		        if ("sell".equals(action)) {
		            int result = db.sell(sid);
		            if (result > 0) {
		                // sell 메서드 실행 성공
		                // sell2 메서드 실행
		                result = db.sell2(sid, bidname);
		                if (result > 0) {
		                    // sell2 메서드 실행 성공
		                    response.getWriter().write("success");
		                } else if (result == -1) {
		                    response.getWriter().write("duplicate");
		                } else {
		                    response.getWriter().write("error");
		                }
		            } else {
		                response.getWriter().write("error");
		            }
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        response.getWriter().write("error");
		    }
	 }
}