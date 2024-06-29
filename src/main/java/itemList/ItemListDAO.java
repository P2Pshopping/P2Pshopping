package itemList;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemListDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public ItemListDAO() {
        try {
            String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
            String dbID = "c##musthave";
            String dbPassword = "1234";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<ItemListDTO> getItemList() {
        List<ItemListDTO> list = new ArrayList<>();
        String SQL = "SELECT * FROM items";
        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ItemListDTO item = new ItemListDTO();
                item.setUsername(rs.getString("username"));
                item.setName(rs.getString("name"));
                item.setPrice(rs.getString("price"));
                item.setImgUrl_1(rs.getString("imgUrl_1"));
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
        return list;
    }
}
