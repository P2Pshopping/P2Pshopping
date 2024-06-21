package Logins;

import common.JDBConnect;


public class LoginDAO extends JDBConnect{
	public LoginDAO(String drv, String url, String id, String pw) {
		super(drv,url,id,pw);
	}
	


	 public LoginDTO getLoginDTO(String username, String password) {
		 LoginDTO dto = new LoginDTO(); // 회원 정보 DTO 객체 생성
			String query = "SELECT * FROM USERS WHERE USERNAME = ? AND PASSWORD = ?";
			// 쿼리문 템플릿

			try {
				// 쿼리 실행
				psmt = con.prepareStatement(query); // 동적 쿼리문 준비
				psmt.setString(1, username); // 쿼리문의 첫번째 인파라미터에 값 설정
				psmt.setString(2, password); // 쿼리문의 두 번째 인파라미터에 값 설정
				rs = psmt.executeQuery(); // 쿼리문 실행

				// 결과 처리
				if (rs.next()) {
					// 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
					dto.setUsername(rs.getString("username"));
					dto.setPassword(rs.getString("password"));
				
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return dto; // DTO 객체 반환
		}
}
//	
//	private LoginDAO() {
//		
//	}
//	public static LoginDAO getInstance() {
//		if(loginDAO == null) {
//			loginDAO = new LoginDAO();
//			
//		}
//		return loginDAO;
//	}
//	public void setConnection(Connection con) {
//		this.con = con;
//	}
//	public void selectLoginMember(String username,String password) {
//		LoginDTO LoginDTO = null;
//		PreparedStatement psmt= null;
//		ResultSet rs = null;
//		
//		try {
//			psmt = con.prepareStatement(" SELECT USERNAME ,PASSWORD  FROM USERS where username=? and password =? ");
//			psmt.setString(1,username);
//			psmt.setString(2, password);
//			
//			rs = psmt.executeQuery();
//			if(rs.next()) {
//				LoginDTO= new LoginDTO();
//				LoginDTO.setUsername(rs.getString("username"));
//				LoginDTO.setPassword(rs.getString("password"));
//			}		
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//	finally {
//		try {
//			rs.close();
//			psmt.close();
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		}
//	}
//	
//	
//
//}