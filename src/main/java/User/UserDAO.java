package User;

import java.sql.PreparedStatement;
import java.sql.SQLException;

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
	public UserDTO getuserDTO(String uid, String upass) {
		UserDTO dto = new UserDTO(); // 회원 정보 DTO 객체 생성
		String query = "SELECT * FROM users WHERE id=? AND password=?";
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
				dto.setId(rs.getInt("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString(3));
				dto.setCreateDate(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto; // DTO 객체 반환
	}
	
	
    // 사용자 정보를 추가하는 메서드
    public boolean addUser(UserDTO user) {
        String sql = "INSERT INTO users (username, name, email, phone, address, password, kakaoId, naverId, provinceId, cityId, districtId, auth) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPhone());
            stmt.setString(5, user.getAddress());
            stmt.setString(6, user.getPassword());
            stmt.setInt(7, user.getKakaoId());
            stmt.setInt(8, user.getNaverId());
            stmt.setInt(9, user.getProvinceId());
            stmt.setInt(10, user.getCityId());
            stmt.setInt(11, user.getDistrictId());
            stmt.setString(12, user.getAuth());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}