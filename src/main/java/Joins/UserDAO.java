package Joins;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Joins.UserDTO;
import jakarta.servlet.ServletContext;
import utils.JDBConnect;

public class UserDAO extends JDBConnect {

    public UserDAO(String drv, String url, String id, String pw) {
        super(drv, url, id, pw);
    }

    // ServletContext를 사용하는 생성자
    public UserDAO(ServletContext application) {
        super(application);
    }

    public UserDTO getUserDTO(String username, String password) {
  //  	UserDTO dto = new UserDTO(); // 회원 정보 DTO 객체 생성
//		String query = "SELECT * FROM users WHERE id=? AND password=?";
		  UserDTO dto = null;
	        String query = "SELECT * FROM users WHERE username=? AND password=?";
		
		
        System.out.println("Executing query: " + query);
        System.out.println("Parameters: " + username + ", " + password);
		// 쿼리문 템플릿

		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query); // 동적 쿼리문 준비
			psmt.setString(1, username); // 쿼리문의 첫번째 인파라미터에 값 설정
			psmt.setString(2, password); // 쿼리문의 두 번째 인파라미터에 값 설정
			rs = psmt.executeQuery(); // 쿼리문 실행

//            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    dto = new UserDTO();
                    dto.setId(rs.getInt("id"));
                    dto.setName(rs.getString("name"));
                    dto.setBirth(rs.getString("birth"));
                    dto.setUsername(rs.getString("username"));
                    dto.setPassword(rs.getString("password"));
                    dto.setEmail(rs.getString("email"));
                    dto.setPhone(rs.getString("phone"));
                    dto.setAddress(rs.getString("address"));
                    dto.setKakaoId(rs.getInt("kakaoId"));
                    dto.setNaverId(rs.getInt("naverId"));
                    dto.setProvinceId(rs.getInt("provinceId"));
                    dto.setCityId(rs.getInt("cityId"));
                    dto.setDistrictId(rs.getInt("districtId"));
                    dto.setAuth(rs.getString("auth"));
                    dto.setCreateDate(rs.getTimestamp("createDate"));
                    System.out.println("User found: " + dto.getUsername());
                } else {
                    System.out.println("No user found with provided credentials.");
           //     }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dto;
    }

    public boolean addUser(UserDTO user) {
        String sql = "INSERT INTO users (name, birth, username, password, email, phone, address, kakaoId, naverId, provinceId, cityId, districtId, auth, createDate) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getBirth());
            stmt.setString(3, user.getUsername());
            stmt.setString(4, user.getPassword());
            stmt.setString(5, user.getEmail());
            stmt.setString(6, user.getPhone());
            stmt.setString(7, user.getAddress());
            stmt.setInt(8, user.getKakaoId());
            stmt.setInt(9, user.getNaverId());
            stmt.setInt(10, user.getProvinceId());
            stmt.setInt(11, user.getCityId());
            stmt.setInt(12, user.getDistrictId());
            stmt.setString(13, user.getAuth());
            stmt.setTimestamp(14, user.getCreateDate());
            
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}