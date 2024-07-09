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
}
		