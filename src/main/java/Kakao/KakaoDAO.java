package Kakao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class KakaoDAO extends JDBConnect {
	public KakaoDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}

	public KakaoDAO(ServletContext application) {
        super(application);
	}
	public KakaoDTO getKakaoDTO(String uname, String upass) {
//		UserDTO dto = new UserDTO(); // 회원 정보 DTO 객체 생성
//		String query = "SELECT * FROM users WHERE id=? AND password=?";
		KakaoDTO dto = null;
	        String query = "SELECT * FROM users WHERE username=? AND password=?";


			/*
			 * System.out.println("Executing query: " + query);
			 * System.out.println("Parameters: " + uname + ", " + upass);
			 */
		// 쿼리문 템플릿

		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query); // 동적 쿼리문 준비
			psmt.setString(1, uname); // 쿼리문의 첫번째 인파라미터에 값 설정
			psmt.setString(2, upass); // 쿼리문의 두 번째 인파라미터에 값 설정
			rs = psmt.executeQuery(); // 쿼리문 실행

			// 결과 처리
			if (rs.next()) {
				// 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
				  dto = new KakaoDTO();

                dto.setUsername(rs.getString("username"));
                dto.setPassword(rs.getString("password"));// DB에서 가져온 해시된 비밀번호
                dto.setKakaoId(rs.getInt("kakaoId"));

                System.out.println("User found: " + dto.getUsername());
			} else {
                System.out.println("No user found with provided credentials.");
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto; // DTO 객체 반환
	}

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
	    public boolean addKakao(KakaoDTO kuser) {
	        String sql = "INSERT INTO users (username,  password, kakaoId,createDate) " +
	                     "VALUES (?, ?, ?, ?)";

	        try (PreparedStatement stmt = con.prepareStatement(sql)) {
	            stmt.setString(1, kuser.getUsername());
	            stmt.setString(2, kuser.getPassword());
	            stmt.setInt(3, kuser.getKakaoId());
//	            stmt.setString(13, kuser.getTimestamp());
	            stmt.setTimestamp(4, new java.sql.Timestamp(System.currentTimeMillis()));

	            int rowsInserted = stmt.executeUpdate();
	            return rowsInserted > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }

	}




}
