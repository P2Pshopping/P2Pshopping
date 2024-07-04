package itemList;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import common.JDBConnect;

public class ItemListDAO extends JDBConnect {
    public ItemListDAO() {
        super();
    }

    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM PRODUCT p";

        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " LIKE ?";
        }

        try (PreparedStatement psmt = con.prepareStatement(query)) {
            if (map.get("searchWord") != null) {
                psmt.setString(1, "%" + map.get("searchWord") + "%");
            }
            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    totalCount = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            System.out.println("카운트 오류 발생");
            e.printStackTrace();
        }

        return totalCount;
    }

    public ArrayList<ItemListDTO> selectListPage(Map<String, Object> map) {
        ArrayList<ItemListDTO> board = new ArrayList<ItemListDTO>();
        String query =" SELECT * FROM PRODUCT p " ;
        		
        		//"SELECT * FROM (SELECT Tb.*, ROW_NUMBER() OVER (ORDER BY id) rnum FROM PRODUCT Tb";
        
		/*
		 * if (map.get("searchWord") != null) { query += " WHERE " +
		 * map.get("searchField") + " LIKE ?"; } query +=
		 * ") WHERE rnum BETWEEN ? AND ?";
		 */

        try (PreparedStatement psmt = con.prepareStatement(query)) {
//            int paramIndex = 1;
			/*
			 * if (map.get("searchWord") != null) { psmt.setString(paramIndex++, "%" +
			 * map.get("searchWord") + "%"); } psmt.setInt(paramIndex++, (int)
			 * map.get("start")); psmt.setInt(paramIndex, (int) map.get("end"));
			 */

            try (ResultSet rs = psmt.executeQuery()) {
                while (rs.next()) {
                    ItemListDTO dto = new ItemListDTO();
                    dto.setId(rs.getInt("id"));
                    dto.setProductName(rs.getString("productname"));
                    dto.setCategoryid(rs.getInt("categoryid"));
                    dto.setPrice(rs.getInt("price"));
                    dto.setDetail(rs.getString("detail"));
                    dto.setImgUrl_1(rs.getString("imgUrl_1"));
                    dto.setWriterid(rs.getInt("writerid"));
                    

                    board.add(dto);
                }
            }
        } catch (SQLException e) {
            System.out.println("사진 불러오는 중 예외 발생");
            e.printStackTrace();
        }

        return board;

    }
}