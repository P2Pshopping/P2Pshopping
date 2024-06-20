package Logins;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserController {
	private LoginDAO loginDAO;
	
	public UserController() {
		loginDAO = new LoginDAO();
	}
	public void login(HttpServletRequest request,HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		boolean result = loginDAO.isUserExist(username,password);
		
		if(result) {
			request.setAttribute("message", "로그인에 성공하였습니다.");
		}
		else {
			request.setAttribute("message", "로그인에 실패하였습니다.");
		}
		loginDAO.close();
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
	try {
		dispatcher.forward(request,response);
		
	}catch (ServletException e) {
		e.printStackTrace();
	}catch (IOException e) {
		e.printStackTrace();
	}
	
	}
}
