package itemList;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class ItemListDAO extends JDBConnect {
    public ItemListDAO() {
        super();
    }

    public List<ItemListDTO> getAllproduct() {
        List<ItemListDTO> product = new ArrayList<>();
        String query = "SELECT p.*, u.username FROM PRODUCT p,USERS u";
        System.out.println("쿼리문 실행");

        try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                System.out.println("DB정보 불러오기");
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
            System.out.println("불러오는 중 예외 발생");
            e.printStackTrace();
        }
        System.out.println("리턴하기");
        return product;
    }
}
