package User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;
import common.UserDTO;
import jakarta.servlet.ServletContext;

public class UserDAO extends JDBConnect {
	// 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성한다.
	public UserDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}


	// ServletContext를 사용하는 생성자
	public UserDAO(ServletContext application) {
		super(application);
	}

	public UserDAO() {
		// 기본 생성자
	}


	// 명시한 아이디/패스워드와 일치하는 회원 정보를 반환합니다.
	public UserDTO getUserDTO(String uid, String upass) {
//		UserDTO dto = new UserDTO(); // 회원 정보 DTO 객체 생성
//		String query = "SELECT * FROM users WHERE id=? AND password=?";

		  UserDTO dto = null;
	        String query = "SELECT * FROM users WHERE username=? AND password=?";

			/*
			 * System.out.println("Executing query: " + query);
			 * System.out.println("Parameters: " + uid + ", " + upass);
			 */
		// 쿼리문 템플릿

		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query); // 동적 쿼리문 준비
			psmt.setString(1, uid); // 쿼리문의 첫번째 인파라미터에 값 설정
			psmt.setString(2, upass); // 쿼리문의 두 번째 인파라미터에 값 설정
			rs = psmt.executeQuery(); // 쿼리문 실행

			// 결과 처리
			if (rs.next()) {
				// 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장

				dto = new UserDTO();
				dto.setId(rs.getInt("id"));
				dto.setUsername(rs.getString("username"));
				dto.setPassword(rs.getString("password"));// DB에서 가져온 해시된 비밀번호
				dto.setBirth(rs.getString("birth"));

				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setKakaoId(rs.getInt("kakaoId"));
				dto.setNaverId(rs.getInt("naverId"));
				dto.setProvinceId(rs.getInt("provinceId"));
				dto.setCityId(rs.getInt("cityId"));
				dto.setDistrictId(rs.getInt("districtId"));
				dto.setAuth(rs.getString("auth"));
				/* System.out.println("User found: " + dto.getUsername()); */

			} else {
				/* System.out.println("No user found with provided credentials."); */
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto; // DTO 객체 반환
	}


	// 비밀번호 해시화 매서드
	public String hashPassword(String password) {
		try {
			// MessageDigest 인스턴스를 SHA-256 알고리즘으로 초기화.
			MessageDigest md = MessageDigest.getInstance("SHA-256");

			if (password == null) {
				/* System.out.println("Password is null"); */
			}
			// 주어진 비밀번호 문자열을 바이트 배열로 변환하여 해시 계산을 수행.
			byte[] hash = md.digest(password.getBytes());

			// 해시 값을 16진수 문자열로 변환하기 위해 StringBuilder를 사용.
			StringBuilder hexString = new StringBuilder();
			for (byte b : hash) {
				// 각 바이트를 16진수로 변환하여 StringBuilder에 추가.
				hexString.append(String.format("%02x", b));
			}
			// 최종적으로 16진수 문자열을 반환.
			return hexString.toString();
		} catch (NoSuchAlgorithmException e) {
			// SHA-256 알고리즘이 지원되지 않는 경우 발생할 수 있는 예외를 처리.
			throw new RuntimeException(e);
		}
	}


	// 사용자 정보를 추가하는 메서드
	public boolean addUser(UserDTO user) {
		String sql = "INSERT INTO users (username, name,birth,email, phone, address, password, kakaoId, naverId, provinceId, cityId, districtId, auth, createDate)"
				+ " VALUES (?, ? ,?, ?, ? ,? ,? ,? ,? ,? ,? ,? ,? ,?)";

		try (PreparedStatement stmt = con.prepareStatement(sql)) {
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getName());

			stmt.setString(3, user.getBirth());
			stmt.setString(4, user.getEmail());
			stmt.setString(5, user.getPhone());
			stmt.setString(6, user.getAddress());
			stmt.setString(7, user.getPassword());
			stmt.setInt(8, user.getKakaoId());
			stmt.setInt(9, user.getNaverId());
			stmt.setInt(10, user.getProvinceId());
			stmt.setInt(11, user.getCityId());
			stmt.setInt(12, user.getDistrictId());
			stmt.setString(13, user.getAuth());
//            stmt.setString(13, user.getTimestamp());
			stmt.setTimestamp(14, new java.sql.Timestamp(System.currentTimeMillis()));

			int rowsInserted = stmt.executeUpdate();
			return rowsInserted > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public void dbconn() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "c##musthave";
			String pwd = "1234";

			con = DriverManager.getConnection(url, id, pwd);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void dbclose() {
		try {

			close();
		} catch (Exception e) {
			e.printStackTrace();
		}


	}

	public boolean validate(UserDTO user) {
		// TODO Auto-generated method stub
		return false;
	}


	public boolean idCheck(String username) {

		boolean result = false; // 아이디 중복 여부 체크 변수


		try {

			String sql = "select username from users where username= ?";

			psmt = con.prepareStatement(sql);
			psmt.setString(1, username);
			rs = psmt.executeQuery();

			/* System.out.println(result); */
			if (rs.next()) {
				result = true; // 아이디가 중복인 경우
				/*
				 * System.out.print("rs값 = "); System.out.println(result);
				 */
			} else {
				result = false; // 사용가능한 아이디인 경우
				/*
				 * System.out.print("rs값 = "); System.out.println(result);
				 */
			}

		} catch (Exception e) {
			/*
			 * System.out.println("confirmId(): " + e);
			 * System.out.println("Error in idCheck(): " + e.getMessage());
			 */
			// 어떤메소드의 실행할때 에러가 나는지 바로 알수있다.
		} 
		return result;
	}


	public UserDTO getIdFindDTO(String name, String phone) {
//	UserDTO dto = new UserDTO(); // 회원 정보 DTO 객체 생성
//	String query = "SELECT * FROM users WHERE id=? AND password=?";
		UserDTO dto = null;
		String query = "SELECT * FROM users WHERE name =? AND phone=?";

		/*
		 * System.out.println("Executing query: " + query);
		 * System.out.println("Parameters: " + name + ", " + phone);
		 */
		// 쿼리문 템플릿

		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query); // 동적 쿼리문 준비
			psmt.setString(1, name); // 쿼리문의 첫번째 인파라미터에 값 설정
			psmt.setString(2, phone); // 쿼리문의 두 번째 인파라미터에 값 설정
			rs = psmt.executeQuery(); // 쿼리문 실행

			// 결과 처리
			if (rs.next()) {
				// 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
				dto = new UserDTO();
				dto.setId(rs.getInt("id"));
				dto.setUsername(rs.getString("username"));
				dto.setPassword(rs.getString("password"));// DB에서 가져온 해시된 비밀번호
				dto.setBirth(rs.getString("birth"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setKakaoId(rs.getInt("kakaoId"));
				dto.setNaverId(rs.getInt("naverId"));
				dto.setProvinceId(rs.getInt("provinceId"));
				dto.setCityId(rs.getInt("cityId"));
				dto.setDistrictId(rs.getInt("districtId"));
				dto.setAuth(rs.getString("auth"));
				/* System.out.println("User found: " + dto.getUsername()); */
			} else {
				/* System.out.println("No user found with provided credentials."); */
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto; // DTO 객체 반환
	}

	// 모든 사용자 정보를 가져오는 메서드
	public List<UserDTO> getAllUsers() {
		List<UserDTO> userList = new ArrayList<>();
		String query = "SELECT * FROM users";

		try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
			while (rs.next()) {
				UserDTO user = new UserDTO();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				user.setAddress(rs.getString("address"));
				user.setAuth(rs.getString("auth"));
				user.setActive(rs.getInt("active"));
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;

	}
    
	// 활성 사용자 수 가져오기
	public int getActiveUserCount() {
		int count = 0;
		String query = "SELECT COUNT(*) FROM users WHERE active = 1";
		try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)) {

//            pstmt = con.prepareStatement(query);
//            rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// 비활성 사용자 수 가져오기
	public int getInactiveUserCount() {
		int count = 0;
		String query = "SELECT COUNT(*) FROM users WHERE active = 0";
		try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
//            pstmt = con.prepareStatement(query);
//            rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	// 사용자 정보를 업데이트하는 메서드
	public boolean updateUser(UserDTO user) {
		String sql = "UPDATE users SET username = ?, name = ?, email = ?, phone = ?, address = ?, auth = ?, active = ? WHERE id = ?";
		try (PreparedStatement stmt = con.prepareStatement(sql)) {
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getName());
			stmt.setString(3, user.getEmail());
			stmt.setString(4, user.getPhone());
			stmt.setString(5, user.getAddress());
			stmt.setString(6, user.getAuth());
			stmt.setInt(7, user.getActive());
			stmt.setInt(8, user.getId());
			int rowsUpdated = stmt.executeUpdate();
			return rowsUpdated > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// 사용자 정보를 삭제하는 메서드
	public boolean deleteUser(int id) {
		String sql = "DELETE FROM users WHERE id = ?";
		try (PreparedStatement stmt = con.prepareStatement(sql)) {
			stmt.setInt(1, id);
			int rowsDeleted = stmt.executeUpdate();
			return rowsDeleted > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// 특정 사용자 정보를 ID로 가져오는 메서드
	public UserDTO getUserById(int id) {
		UserDTO user = null;
		String sql = "SELECT * FROM users WHERE id = ?";
		try (PreparedStatement stmt = con.prepareStatement(sql)) {
			stmt.setInt(1, id);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					user = new UserDTO();
					user.setId(rs.getInt("id"));
					user.setUsername(rs.getString("username"));
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
					user.setPhone(rs.getString("phone"));
					user.setAddress(rs.getString("address"));
					user.setAuth(rs.getString("auth"));
					user.setActive(rs.getInt("active"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public UserDTO getPwFindDTO(String name, String phone, String username) {
//	UserDTO dto = new UserDTO(); // 회원 정보 DTO 객체 생성
//	String query = "SELECT * FROM users WHERE id=? AND password=?";
		UserDTO dto = null;
		String query = "SELECT * FROM users WHERE username= ? AND name = ? AND phone = ?";

		/*
		 * System.out.println("Executing query: " + query);
		 * System.out.println("Parameters: " + username + ", " + name + " , " + phone);
		 */
		// 쿼리문 템플릿

		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query); // 동적 쿼리문 준비
			psmt.setString(1, username); // 쿼리문의 첫번째 인파라미터에 값 설정
			psmt.setString(2, name); // 쿼리문의 두 번째 인파라미터에 값 설정
			psmt.setString(3, phone);
			rs = psmt.executeQuery(); // 쿼리문 실행


			// 결과 처리
			if (rs.next()) {
				// 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
				dto = new UserDTO();
				dto.setId(rs.getInt("id"));
				dto.setUsername(rs.getString("username"));
				dto.setPassword(rs.getString("password"));// DB에서 가져온 해시된 비밀번호
				dto.setBirth(rs.getString("birth"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setKakaoId(rs.getInt("kakaoId"));
				dto.setNaverId(rs.getInt("naverId"));
				dto.setProvinceId(rs.getInt("provinceId"));
				dto.setCityId(rs.getInt("cityId"));
				dto.setDistrictId(rs.getInt("districtId"));
				dto.setAuth(rs.getString("auth"));
				/* System.out.println("User found: " + dto.getPassword()); */
			} else {
				/* System.out.println("No user found with provided credentials."); */
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto; // DTO 객체 반환
	}

	public boolean changePassword(String username, String newPassword) {

		boolean success = false;

		try {

			String query = "UPDATE users SET password = ? WHERE username = ?";
			/*
			 * System.out.println("Executing query: " + query);
			 * System.out.println("Parameters: " + newPassword + ", " + username);
			 */
			psmt = con.prepareStatement(query);
			psmt.setString(1, newPassword);
			psmt.setString(2, username);

			int rowsAffected = psmt.executeUpdate();
			if (rowsAffected > 0) {
				/* System.out.println("Password updated successfully for user: " + username); */
				success = true;
			} else {
				/* System.out.println("Failed to update password for user: " + username); */
			}
		} catch (SQLException e) {
			e.printStackTrace();
		
		}
		return success;
	}

	public boolean changePhone(String username, String phone) {

		boolean success = false;

		try {

			String query = "UPDATE users SET phone = ? WHERE username = ?";
			/*
			 * System.out.println("Executing query: " + query);
			 * System.out.println("Parameters: " + phone + ", " + username);
			 */
			psmt = con.prepareStatement(query);
			psmt.setString(1, phone);
			psmt.setString(2, username);

			int rowsAffected = psmt.executeUpdate();
			if (rowsAffected > 0) {
				/* System.out.println("Password updated successfully for user: " + username); */
				success = true;
			} else {
				/* System.out.println("Failed to update password for user: " + username); */
			}
		} catch (SQLException e) {
			e.printStackTrace();
		
		}
		return success;
	}
	public UserDTO productcount(String username) {
	    UserDTO dto = null;
	    String query = "SELECT COUNT(p.WRITERID) AS product_count "
	            + "FROM users u "
	            + "JOIN product p ON u.id = p.WRITERID "
	            + "WHERE u.username = ? ";
		/*
		 * System.out.println("Executing query: " + query);
		 * System.out.println("Parameters: " + username);
		 */

	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setString(1, username);
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            dto = new UserDTO();
	            dto.setProductCount(rs.getInt("product_count")); // 컬럼명 수정
				/* System.out.println("ProductCount: " + rs.getInt("product_count")); */
	        } else {
	        	dto = new UserDTO();
	        	dto.setProductCount(0);
				/* System.out.println("판매 상품이 없습니다."); */
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return dto;
	}
	public UserDTO likecount(String username) {
	    UserDTO dto = null;
	    String query = "SELECT COUNT(f.userID) AS likecount "
	            + "FROM users u "
	            + "JOIN favorite f ON u.ID = f.userid "
	            + "WHERE u.username = ? ";
	     
		/*
		 * System.out.println("Executing query: " + query);
		 * System.out.println("Parameters: " + username);
		 */

	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setString(1, username);
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            dto = new UserDTO();
	            dto.setLikeCount(rs.getInt("likecount")); // 컬럼명 수정
				/* System.out.println("likecount: " + rs.getInt("likecount")); */
	        } else {
	        	dto = new UserDTO();
	        	dto.setLikeCount(0);
				/* System.out.println("좋아요 누른 상품이 없습니다."); */
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return dto;
	}
	public UserDTO boardCount(String username) {
	    UserDTO dto = null;
	    String query = "SELECT COUNT(b.id) AS boardCount "
	            + "FROM users u "
	            + "JOIN Boards b ON u.id = b.writerid "
	            + "WHERE u.username = ? ";

		/*
		 * System.out.println("Executing query: " + query);
		 * System.out.println("Parameters: " + username);
		 */
	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setString(1, username);
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            dto = new UserDTO();
	            dto.setBoardCount(rs.getInt("boardCount")); // 컬럼명 수정
				/* System.out.println("boardcount: " + rs.getInt("boardCount")); */
	        } else {
	        	dto = new UserDTO();
	        	dto.setBoardCount(0);
				/* System.out.println("올린 게시글이 없습니다."); */
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return dto;
	}

}
