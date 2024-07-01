package admin;

import java.sql.ResultSet;
import java.sql.Statement;

import common.JDBConnect;

public class ProductDAO extends JDBConnect {
    // 신규 등록 제품 수 가져오기
    public int getNewProductCount() {
        int count = 0;
        String query = "SELECT COUNT(*) FROM product WHERE TRUNC(createDate, 'MM') = TRUNC(SYSDATE, 'MM')";
        try (Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query))  {
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
}