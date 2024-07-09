package itemList;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class ItemListDAO extends JDBConnect {
    public ItemListDAO() {
        super();
    }
    
    public int countProduct() {
        int itemCount = 0;  // 아이템 수를 저장할 변수를 초기화합니다.
        String countItemQuery = "SELECT COUNT(*) FROM PRODUCT";  // 제품 수를 계산하는 SQL 쿼리입니다.

        try (PreparedStatement stmt = con.prepareStatement(countItemQuery)) {  // SQL 문을 준비합니다.
            try (ResultSet rs = stmt.executeQuery()) {  // 쿼리를 실행하고 결과 집합을 가져옵니다.
                if (rs.next()) {  // 결과가 있는 경우, 수를 가져옵니다.
                    itemCount = rs.getInt(1);  // 결과 집합의 첫 번째 열에서 수를 가져옵니다.
                }
            }
        } catch (SQLException e) {  // 발생하는 SQL 예외를 잡습니다.
            System.out.println("제품 수를 계산하는 중 오류가 발생했습니다.");  // 오류 메시지를 출력합니다.
            e.printStackTrace();  // 디버깅을 위해 스택 트레이스를 출력합니다.
        }

        return itemCount;  // 아이템 수를 반환합니다.
    }

    
    public List<ItemListDTO> getAllproduct(int page, int pageSize) {
        List<ItemListDTO> product = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String query = "SELECT * FROM ( " +
                       "  SELECT p.*, u.USERNAME, ROW_NUMBER() OVER (ORDER BY p.id) as rnum " +
                       "  FROM PRODUCT p " +
                       "  JOIN USERS u ON p.WRITERID = u.id " +
                       ") WHERE rnum BETWEEN ? AND ?";
        System.out.println("쿼리문 실행: " + query);

        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, offset + 1);
            stmt.setInt(2, offset + pageSize);
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
