package itemList;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
//    public List<ItemListDTO> getAllproduct() {
//        List<ItemListDTO> product = new ArrayList<>();
//        String query = "SELECT p.*, u.username FROM PRODUCT p JOIN USERS u ON p.writerid = u.id";
//        System.out.println("쿼리문 실행");
//
//        try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)) {

    public List<ItemListDTO> selectProducts(int start, int end) {
        List<ItemListDTO> product = new ArrayList<>();
        String query = "SELECT * FROM (SELECT ROWNUM rnum, p.*, u.username " +
                       "FROM PRODUCT p JOIN USERS u ON p.writerid = u.id " +
                       "WHERE ROWNUM <= ?) WHERE rnum >= ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, end);
            pstmt.setInt(2, start);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ItemListDTO dto = new ItemListDTO();
                dto.setUsername(rs.getString("username"));
                dto.setProductName(rs.getString("productName"));
                dto.setCategoryid(rs.getInt("categoryid"));
                dto.setPrice(rs.getInt("price"));
                dto.setSold(rs.getString("sold"));
                dto.setDetail(rs.getString("detail"));
                dto.setImgUrl_1(rs.getString("imgUrl_1"));
                dto.setImgUrl_2(rs.getString("imgUrl_2"));
                dto.setImgUrl_3(rs.getString("imgUrl_3"));
                dto.setImgUrl_4(rs.getString("imgUrl_4"));
                dto.setWriterid(rs.getInt("writerid"));
                dto.setCreateDate(rs.getDate("createDate"));
                dto.setUpdateDate(rs.getDate("updateDate"));
                product.add(dto);
            }
        } catch (Exception e) {
            System.out.println("제품을 불러오는 중 예외 발생");
            e.printStackTrace();
        }
        return product;
    }
}
