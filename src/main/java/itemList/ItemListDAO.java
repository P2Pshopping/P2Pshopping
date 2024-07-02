package itemList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBConnect;

public class ItemListDAO extends JDBConnect{
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public ItemListDAO() {
        super();
    }
    
    public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM mvcboard";
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
    
    public List<ItemListDTO> getItemList(Map<String, Object> map) {
       
        List<ItemListDTO> list = new ArrayList<>();
        String sql = "SELECT username,productname,price,imgUrl_1,categoryid"
              + "FROM PRODUCT p, USERS u";
                 
        
        try {
           Statement stmt = con.createStatement();
            System.out.println("DB 연결 성공"); // 디버그 메시지

            ResultSet rs = stmt.executeQuery(sql);
            System.out.println("쿼리 실행: " + sql); // 디버그 메시지
            while (rs.next()) {
                ItemListDTO item = new ItemListDTO();
                item.setUsername(rs.getString("username"));
                item.setProductName(rs.getString("productname"));
                item.setPrice(rs.getString("price"));
                item.setImgUrl_1(rs.getString("imgUrl_1"));
                item.setCategoryid(rs.getString("categoryid"));
                list.add(item);
                System.out.println("상품목록 불러오기 성공");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("연결 중 오류 발생");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
        return list;
    }

}
