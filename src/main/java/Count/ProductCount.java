package Count;

import java.io.IOException;
import User.UserDAO;
import common.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ProductCnt.do") 
public class ProductCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UserDTO dto;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
	    String username = (String) session.getAttribute("username");
	  
	    
	    		// 판매 상품 갯수
	    	UserDAO dao = new UserDAO();
	    	 dto = dao.productcount(username);
	    	Integer productCount = dto.getProductCount();
	    	   if (dto != null) {
	    		   if (productCount == null || productCount == 0) {
	    			    // Null 또는 0일 때 처리할 로직
	    			    // 예를 들어 기본값으로 0을 설정하는 경우
	    			    dto.setProductCount(0);
	    			}
	               session.setAttribute("productCount", dto.getProductCount());
	               System.out.println(" 이름 : " + username + " 총 상품 수 : " + dto.getProductCount());
	               
	               // 세션에 저장된 데이터를 다시 사용할 수 있는 예제
	               int storedProductCount = (int) session.getAttribute("productCount");
	               System.out.println("Product Count from session: " + storedProductCount);
	               
	               // 세션에 저장된 데이터를 이용하여 다른 로직을 수행할 수 있음
	               // 예: 다른 서블릿으로 리다이렉트하거나 클라이언트에게 응답을 보낼 수 있음
	               
	               response.getWriter().write("총 갯수 : " + storedProductCount);
	           } else {
	               System.out.println("실패  " + username);
	           }

	    	   			// 찜목록 수
	    	   	dto = dao.likecount(username);
	    	   	Integer likeCount = dto.getLikeCount();
	    	    if (dto != null) {
		    		   if (likeCount == null || likeCount == 0) {
		    			    // Null 또는 0일 때 처리할 로직
		    			    // 예를 들어 기본값으로 0을 설정하는 경우
		    			    dto.setLikeCount(0);
		    			}
		               session.setAttribute("likeCount", dto.getLikeCount());
		               System.out.println(" 이름 : " + username + " 총 좋아요 수 : " + dto.getLikeCount());
		               
		               // 세션에 저장된 데이터를 다시 사용할 수 있는 예제
		               int storedLikeCount = (int) session.getAttribute("likeCount");
		               System.out.println("Like Count from session: " + storedLikeCount);
		               
		               // 세션에 저장된 데이터를 이용하여 다른 로직을 수행할 수 있음
		               // 예: 다른 서블릿으로 리다이렉트하거나 클라이언트에게 응답을 보낼 수 있음
		               
		               response.getWriter().write("총 갯수 : " + storedLikeCount);
		           } else {
		               System.out.println("실패  " + username);
		           }
		    	    
		  			// 찜목록 수
	    	   	dto = dao.boardCount(username);
	    	   	Integer BoardCount = dto.getBoardCount();
	    	    if (dto != null) {
		    		   if (BoardCount == null || BoardCount == 0) {
		    			    // Null 또는 0일 때 처리할 로직
		    			    // 예를 들어 기본값으로 0을 설정하는 경우
		    			    dto.setBoardCount(0);
		    			}
		               session.setAttribute("boardCount", dto.getBoardCount());
		               System.out.println(" 이름 : " + username + " 총 게시글 수 : " + dto.getBoardCount());
		               
		               // 세션에 저장된 데이터를 다시 사용할 수 있는 예제
		               int storedBoardCount = (int) session.getAttribute("boardCount");
		               System.out.println("Board Count from session: " + storedBoardCount);
		               
		               // 세션에 저장된 데이터를 이용하여 다른 로직을 수행할 수 있음
		               // 예: 다른 서블릿으로 리다이렉트하거나 클라이언트에게 응답을 보낼 수 있음
		               
		               response.getWriter().write("총 게시글 수 : " + storedBoardCount);
		           } else {
		               System.out.println("실패  " + username);
		           }
	    	    
	    	    
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
