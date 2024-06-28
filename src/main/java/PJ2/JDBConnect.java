package PJ2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	// 기본 생성자
	public JDBConnect() {
		// 데이터베이스 연결 설정
		try {
			// JDBC 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");

			// DB에 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "c##musthave";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);

			System.out.println("DB 연결 성공(기본 생성자)");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 매개변수를 통한 두 번째  생성자
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			// JDBC 드라이버 로드
			Class.forName(driver);
			// DB에 연결
			con = DriverManager.getConnection(url, id, pwd);

			System.out.println("DB 연결 성공(인수 생성자 1)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//	// 세 번째 생성자 196ㅔ	
//	public void close() {
//		try {
//			if (rs != null) rs.close();
//			if(stmt != null) stmt.close();
//			if(psmt != null) psmt.close();
//			if(con != null) con.close();
//			
//			System.out.println("JDBC 자원 해제");
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//}
		
	   // ServletContext를 사용하는 생성자
	public JDBConnect(ServletContext application) {
		try {
			//DB에 연결
			String driver = application.getInitParameter("OracleDriver");
			String url = application.getInitParameter("OracleURL");
			String id= application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			
			//JDBC 드라이버 로드
			Class.forName(driver);
			// 데이터베이스 연결
			con = DriverManager.getConnection(url,id,pwd);
			
			System.out.println("DB 연결 성공(인수 생성자 2)");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	// 연결 해재(자원 반납)
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();

			System.out.println("JDBC 자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
