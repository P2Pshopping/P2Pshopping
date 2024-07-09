package itemList;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class ItemListDAO extends JDBConnect {
	public ItemListDAO() {
		super();
	}

	public int getProductCount() {
		int count = 0;
		String query = "SELECT COUNT(*) FROM PRODUCT";
		try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("제품 수를 불러오는 중 예외 발생");
			e.printStackTrace();
		}
		return count;
	}

	public List<ItemListDTO> getAllproduct(int start, int end, String keyword) {
		List<ItemListDTO> product = new ArrayList<>();
		String query = "SELECT * FROM (SELECT ROWNUM rnum, p.*, u.username "
				+ "FROM PRODUCT p JOIN USERS u ON p.writerid = u.id " 
				+ "WHERE ROWNUM <= ?) WHERE rnum >= ?";
		System.out.println("쿼리문 실행: " + query);

		if (keyword != null && !keyword.equals("")) {
			query += "and productname like '%" + keyword + "%'";
		}
		try (PreparedStatement stmt = con.prepareStatement(query)) {
			stmt.setInt(1, end);
			stmt.setInt(2, start);
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					System.out.println("DB 정보 불러오기");
					ItemListDTO dto = new ItemListDTO();
					dto.setUsername(rs.getString("USERNAME"));
					dto.setProductName(rs.getString("PRODUCTNAME"));
					dto.setCategoryid(rs.getInt("CATEGORYID"));
					dto.setPrice(rs.getInt("PRICE"));
					dto.setSold(rs.getString("SOLD"));
					dto.setDetail(rs.getString("DETAIL"));
					dto.setImgUrl_1(rs.getString("IMGURL_1"));
					dto.setImgUrl_2(rs.getString("IMGURL_2"));
					dto.setImgUrl_3(rs.getString("IMGURL_3"));
					dto.setImgUrl_4(rs.getString("IMGURL_4"));
					dto.setWriterid(rs.getInt("WRITERID"));
					dto.setCreateDate(rs.getDate("CREATEDATE"));
					dto.setUpdateDate(rs.getDate("UPDATEDATE"));
					product.add(dto);
				}
			}
		} catch (Exception e) {
			System.out.println("불러오는 중 예외 발생");
			e.printStackTrace();
		}
		System.out.println("리턴하기");
		return product;
	}

}
