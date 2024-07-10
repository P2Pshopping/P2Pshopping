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
	        String query = "SELECT * FROM ("
	                     + "    SELECT ROWNUM rnum, p.*, u.username "
	                     + "    FROM PRODUCT p "
	                     + "    JOIN USERS u ON p.writerid = u.id "
	                     + "    WHERE p.sold IS NULL ";

	        if (keyword != null && !keyword.isEmpty()) {
	            query += "AND p.productname LIKE ? ";
	        }

	        query += "    AND ROWNUM <= ? "
	               + ") WHERE rnum >= ? "
	               + "ORDER BY createdate DESC";

	        System.out.println("쿼리문 실행: " + query);

	        try (PreparedStatement stmt = con.prepareStatement(query)) {
	            int paramIndex = 1;
	            if (keyword != null && !keyword.isEmpty()) {
	                stmt.setString(paramIndex++, "%" + keyword + "%");
	            }
	            stmt.setInt(paramIndex++, end);
	            stmt.setInt(paramIndex, start);

	            try (ResultSet rs = stmt.executeQuery()) {
	                while (rs.next()) {
	                    System.out.println("DB 정보 불러오기");
	                    ItemListDTO dto = new ItemListDTO();
	                    dto.setProductid(rs.getString("ID"));
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
	
	public List<ItemListDTO> getAllpopular(int start, int end, String keyword) {
		List<ItemListDTO> product = new ArrayList<>();
		String query = "SELECT * FROM (\r\n"
				+ "    SELECT ROWNUM rnum, inner_query.*, u.username\r\n"
				+ "    FROM (\r\n"
				+ "        SELECT p.PRODUCTID, COUNT(f.PRODUCTID) AS count\r\n"
				+ "        FROM PRODUCT p\r\n"
				+ "        JOIN FAVORITE f ON p.ID = f.PRODUCTID\r\n"
				+ "        GROUP BY p.PRODUCTID\r\n"
				+ "        ORDER BY count DESC\r\n"
				+ "    ) inner_query\r\n"
				+ "    JOIN USERS u ON inner_query.writerid = u.id\r\n"
				+ "    WHERE ROWNUM <= ? AND inner_query.sold IS NULL\r\n"
				+ ") \r\n"
				+ "WHERE rnum >= ?";
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
					dto.setProductid(rs.getString("ID"));
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
					dto.setVisit(rs.getInt("VISIT"));
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

//    public ItemListDAO() {
//       super();
//    }

//    public int getProductCount() {
//       int count = 0;
//       String query = "SELECT COUNT(*) FROM PRODUCT";
//       try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
//          if (rs.next()) {
//             count = rs.getInt(1);
//          }
//       } catch (Exception e) {
//          System.out.println("제품 수를 불러오는 중 예외 발생");
//          e.printStackTrace();
//       }
//       return count;
//    }

//    public List<ItemListDTO> getAllproduct(int start, int end, String keyword) {
//       List<ItemListDTO> product = new ArrayList<>();
//       String query = "SELECT * FROM (SELECT ROWNUM rnum, p.*, u.username "
//             + "FROM PRODUCT p JOIN USERS u ON p.writerid = u.id " 
//             + "WHERE ROWNUM <= ?) WHERE rnum >= ?"
//             + "ORDER BY CREATEDATE DESC";
//       System.out.println("쿼리문 실행: " + query);

//       if (keyword != null && !keyword.equals("")) {
//          query += "and productname like '%" + keyword + "%'";
//       }
//       try (PreparedStatement stmt = con.prepareStatement(query)) {
//          stmt.setInt(1, end);
//          stmt.setInt(2, start);
//          try (ResultSet rs = stmt.executeQuery()) {
//             while (rs.next()) {
//                System.out.println("DB 정보 불러오기");
//                ItemListDTO dto = new ItemListDTO();
//                dto.setProductid(rs.getString("ID"));
//                dto.setUsername(rs.getString("USERNAME"));
//                dto.setProductName(rs.getString("PRODUCTNAME"));
//                dto.setCategoryid(rs.getInt("CATEGORYID"));
//                dto.setPrice(rs.getInt("PRICE"));
//                dto.setSold(rs.getString("SOLD"));
//                dto.setDetail(rs.getString("DETAIL"));
//                dto.setImgUrl_1(rs.getString("IMGURL_1"));
//                dto.setImgUrl_2(rs.getString("IMGURL_2"));
//                dto.setImgUrl_3(rs.getString("IMGURL_3"));
//                dto.setImgUrl_4(rs.getString("IMGURL_4"));
//                dto.setWriterid(rs.getInt("WRITERID"));
//                dto.setCreateDate(rs.getDate("CREATEDATE"));
//                dto.setUpdateDate(rs.getDate("UPDATEDATE"));
//                product.add(dto);
//             }
//          }
//       } catch (Exception e) {
//          System.out.println("불러오는 중 예외 발생");
//          e.printStackTrace();
//       }
//       System.out.println("리턴하기");
//       return product;
//    }
   
//    public List<ItemListDTO> getAllpopular(int start, int end, String keyword) {
//       List<ItemListDTO> product = new ArrayList<>();
//       String query = "SELECT * FROM (SELECT ROWNUM rnum, p.*, u.username "
//             + "FROM PRODUCT p JOIN USERS u ON p.writerid = u.id " 
//             + "WHERE ROWNUM <= ?) WHERE rnum >= ? "
//             + "ORDER BY CREATEDATE DESC";
//       System.out.println("쿼리문 실행: " + query);

//       if (keyword != null && !keyword.equals("")) {
//          query += "and productname like '%" + keyword + "%'";
//       }
//       try (PreparedStatement stmt = con.prepareStatement(query)) {
//          stmt.setInt(1, end);
//          stmt.setInt(2, start);
//          try (ResultSet rs = stmt.executeQuery()) {
//             while (rs.next()) {
//                System.out.println("DB 정보 불러오기");
//                ItemListDTO dto = new ItemListDTO();
//                dto.setProductid(rs.getString("ID"));
//                dto.setUsername(rs.getString("USERNAME"));
//                dto.setProductName(rs.getString("PRODUCTNAME"));
//                dto.setCategoryid(rs.getInt("CATEGORYID"));
//                dto.setPrice(rs.getInt("PRICE"));
//                dto.setSold(rs.getString("SOLD"));
//                dto.setDetail(rs.getString("DETAIL"));
//                dto.setImgUrl_1(rs.getString("IMGURL_1"));
//                dto.setImgUrl_2(rs.getString("IMGURL_2"));
//                dto.setImgUrl_3(rs.getString("IMGURL_3"));
//                dto.setImgUrl_4(rs.getString("IMGURL_4"));
//                dto.setWriterid(rs.getInt("WRITERID"));
//                dto.setCreateDate(rs.getDate("CREATEDATE"));
//                dto.setUpdateDate(rs.getDate("UPDATEDATE"));
//                product.add(dto);
//             }
//          }
//       } catch (Exception e) {
//          System.out.println("불러오는 중 예외 발생");
//          e.printStackTrace();
//       }
//       System.out.println("리턴하기");
//       return product;
//    }

}