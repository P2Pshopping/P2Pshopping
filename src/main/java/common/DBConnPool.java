package common;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public DBConnPool() {
		try {
			//커넥션 풀datasource 얻기
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
			
			//커넥션 풀을 통해 연결 얻기
			con = source.getConnection();
			
			System.out.println("DB 커넥션 풀 연결 성공");
		}
		catch(Exception e) {
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
	}
	
	//연결 해재(자원 반납)
	public void close() {
		try {
			if(rs !=null)rs.close();
			if(stmt !=null)stmt.close();
			if(psmt !=null)psmt.close();
			if(con !=null)con.close();// 자동으로 커넥션 풀로 반납됨
			
			System.out.println("DB 커넥션 풀 자원 반납");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}

















