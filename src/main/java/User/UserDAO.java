package User;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    
    
	// 명시한 아이디/패스워드와 일치하는 회원 정보를 반환합니다.
	public UserDTO getUserDTO(String uid, String upass) {
//		UserDTO dto = new UserDTO(); // 회원 정보 DTO 객체 생성
//		String query = "SELECT * FROM users WHERE id=? AND password=?";
		  UserDTO dto = null;
	        String query = "SELECT * FROM users WHERE username=? AND password=?";
		
		
        System.out.println("Executing query: " + query);
        System.out.println("Parameters: " + uid + ", " + upass);
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
                dto.setNickname(rs.getString("nickname"));
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
                System.out.println("User found: " + dto.getUsername());
			} else {
                System.out.println("No user found with provided credentials.");
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto; // DTO 객체 반환
	}
							
	
	
	//비밀번호 해시화 매서드
	public String hashPassword(String password) {
	    try {
	        // MessageDigest 인스턴스를 SHA-256 알고리즘으로 초기화.
	        MessageDigest md = MessageDigest.getInstance("SHA-256");

	        if(password == null) {
        		System.out.println("Password is null");
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
        String sql = "INSERT INTO users (username, name,nickname,birth,email, phone, address, password, kakaoId, naverId, provinceId, cityId, districtId, auth, createDate) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getName());
            stmt.setString(3,user.getNickname());
            stmt.setString(4,user.getBirth());
            stmt.setString(5, user.getEmail());
            stmt.setString(6, user.getPhone());
            stmt.setString(7, user.getAddress());
            stmt.setString(8, user.getPassword());
            stmt.setInt(9, user.getKakaoId());
            stmt.setInt(10, user.getNaverId());
            stmt.setInt(11, user.getProvinceId());
            stmt.setInt(12, user.getCityId());
            stmt.setInt(13, user.getDistrictId());
            stmt.setString(14, user.getAuth());
//            stmt.setString(13, user.getTimestamp());
            stmt.setTimestamp(15, new java.sql.Timestamp(System.currentTimeMillis()));
            
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

	public boolean validate(UserDTO user) {
		// TODO Auto-generated method stub
		return false;
	}
    

}
