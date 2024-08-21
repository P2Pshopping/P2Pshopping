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
	    StringBuilder query = new StringBuilder("SELECT * FROM (SELECT ROWNUM rnum, p.*, u.username "
	            + "FROM PRODUCT p JOIN USERS u ON p.writerid = u.id "
	            + "WHERE ROWNUM <= ? AND p.sold IS NULL ");

	    if (keyword != null && !keyword.isEmpty()) {
	        query.append("AND p.productname LIKE ? ");
	    }

	    query.append("ORDER BY p.id DESC) WHERE rnum >= ?");

	    System.out.println("쿼리문 실행: " + query.toString());

	    try (PreparedStatement stmt = con.prepareStatement(query.toString())) {
	        int paramIndex = 1;
	        stmt.setInt(paramIndex++, end);

	        if (keyword != null && !keyword.isEmpty()) {
	            stmt.setString(paramIndex++, "%" + keyword + "%");
	        }

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
	    String baseQuery = "SELECT ROWNUM rnum, p.*, u.username "
	            + "FROM PRODUCT p "
	            + "JOIN USERS u ON p.writerid = u.id "
	            + "JOIN (SELECT PRODUCTID, COUNT(*) as count FROM FAVORITE GROUP BY PRODUCTID) f "
	            + "ON p.ID = f.PRODUCTID ";

	    if (keyword != null && !keyword.isEmpty()) {
	        baseQuery += "WHERE p.productname LIKE ? ";
	    }

	    String query = "SELECT * FROM (" + baseQuery + "ORDER BY f.count DESC, p.CREATEDATE DESC) "
	            + "WHERE rnum BETWEEN ? AND ?";

	    System.out.println("쿼리문 실행: " + query);

	    try (PreparedStatement stmt = con.prepareStatement(query)) {
	        int paramIndex = 1;

	        if (keyword != null && !keyword.isEmpty()) {
	            stmt.setString(paramIndex++, "%" + keyword + "%");
	        }

	        stmt.setInt(paramIndex++, start);
	        stmt.setInt(paramIndex, end);

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