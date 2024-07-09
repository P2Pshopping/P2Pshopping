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
			
	        if (con != null) {
                System.out.println("DB 커넥션 풀 연결 성공");
            } else {
                System.out.println("DB 커넥션 풀 연결 실패: Connection is null");
            }


        } catch (Exception e) {
            System.out.println("DB 커넥션 풀 연결 실패");
            e.printStackTrace();
        }
    }

    // 연결을 얻는 메서드 추가
	//	<<<getConnection() 메서드는 con 객체가 null이거나 닫혀있으면 새로운 연결을 가져오는 로직을 포함
    public Connection getConnection() throws SQLException {
        if (con == null || con.isClosed()) {
            try {
                Context initCtx = new InitialContext();
                Context ctx = (Context) initCtx.lookup("java:comp/env");
                DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");
                con = source.getConnection();
            } catch (NamingException e) {
                e.printStackTrace();
            }
        }
        return con;
    }

    // 연결 해제(자원 반납)
    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close(); // 자동으로 커넥션 풀로 반납됨

            System.out.println("DB 커넥션 풀 자원 반납");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

