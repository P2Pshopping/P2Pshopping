package Logins;

import java.lang.reflect.Member;
import java.sql.Connection;
import utils.JDBConnect;
public class LoginService {
	public Member getLoginMember(String username,String password) {
		LoginDAO loginDAO = LoginDAO.getInstance();
		Connection con = getConnection();
		loginDAO.setConnection(con);
		Member loginMember = loginDAO.selectLoginMember(username,password);
		con.close();
		return loginMember;
	}

	
}
