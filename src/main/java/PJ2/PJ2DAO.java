package PJ2;

import common.JDBConnect;

public class PJ2DAO extends JDBConnect {
	
	public PJ2DTO img(String sid2) {  //게시물 출력
					//판매글 id
		PJ2DTO dto = new PJ2DTO();
		
	String query = "SELECT imgUrl_1,imgUrl_2,imgUrl_3,imgUrl_4,PRODUCTNAME ,DETAIL ,PRICE,WRITERID "
			+ "FROM PRODUCT 	"
			+ "WHERE PRODUCT.ID = ?" ;
			
	try{
		psmt = con.prepareStatement(query);
		psmt.setString(1, sid2);
		rs = psmt.executeQuery();
		
		if(rs.next()){
		
			
			dto.setImgUrl_1(rs.getString("imgUrl_1"));
			dto.setImgUrl_2(rs.getString("imgUrl_2"));
			dto.setImgUrl_3(rs.getString("imgUrl_3"));
			dto.setImgUrl_4(rs.getString("imgUrl_4"));
			dto.setProductName(rs.getString("PRODUCTNAME"));
			dto.setDetail(rs.getString("DETAIL"));
			dto.setPrice(rs.getInt("PRICE"));
			dto.setWriterid(rs.getInt("WRITERID"));
		
			
		
}													
		
		
	}catch(Exception e){
		System.out.println("사진 불러오는 중 예외 발생");
		e.printStackTrace();
	}
	return dto;
	

}

	public PJ2DTO findid(String username) {
		PJ2DTO dto6 = new PJ2DTO();
		
		String query = "SELECT ID FROM USERS WHERE USERNAME=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, username);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto6.setUserid(rs.getInt("ID"));
			}
		}catch(Exception e) {
			System.out.println("구매자 id 확인 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto6;
		 
	}
	
	public PJ2DTO findSellerName(int sellerid) {
		PJ2DTO dto7 = new PJ2DTO();
		
		String query = "SELECT USERNAME FROM USERS WHERE ID=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, sellerid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto7.setSellername(rs.getString("USERNAME"));
			}
		}catch(Exception e) {
			System.out.println("판매자 이름 찾는 중 예외 발생");
			e.printStackTrace();
		}
		return dto7;
	}
	
	public  PJ2DTO more()  {
		PJ2DTO dto2 = new PJ2DTO();
		
		String query = "SELECT imgUrl_1, ID FROM PRODUCT WHERE rownum<=4  ORDER BY CREATEDATE DESC";
		String[] f = new String[4];  //최신글 4개의 사진
		String[] moreid = new String[4];  //최신글 4개의 아이디
		
		try {
			psmt = con.prepareStatement(query);	
			rs = psmt.executeQuery();
			int i =0;
			
			while(rs.next()){
				f[i]=(rs.getString("imgUrl_1"));
				moreid[i]=rs.getString("ID");
				i++;
			}
			dto2.setF(f);
			dto2.setMoreid(moreid);
		}catch(Exception e) {
			System.out.print("추가 글 불러오는 중 예외 발생");
			e.printStackTrace();
		}
		return dto2;
	}
	
	
	public PJ2DTO favorite(String bid) {
		PJ2DTO dto5 = new PJ2DTO();
		
		String query = "SELECT * FROM FAVORITE WHERE USERID=?";
		String[] favoritesid = new String[100];
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, bid);
			rs = psmt.executeQuery();
			int i =0;
		
		while(rs.next()) {
			favoritesid[i] = rs.getString("PRODUCTID");   //이게 제품글 고유 번호
			i++;
		}
		}catch(Exception e) {
			System.out.println("찜한 제품 번호 가져오는 중 예외 발생");
			e.printStackTrace();
		}
		
		String query2 = "SELECT id,imgUrl_1,PRODUCTNAME,PRICE FROM PRODUCT WHERE ID = ?";
		int[] favoritenum = new int[100];
		String[] favoriteimg = new String[100];
		String[] favoritename = new String[100];
		int[] favoriteprice = new int[100];
		
		try {
			psmt = con.prepareStatement(query2);
			
			
			for(int i=0; i<100; i++) {
			psmt.setString(1, favoritesid[i]);
			rs= psmt.executeQuery();	
		if(rs.next()) {
			favoritenum[i]= rs.getInt("id");
			favoriteimg[i] = rs.getString("imgUrl_1"); 
			favoritename[i] = rs.getString("PRODUCTNAME"); 
			favoriteprice[i] = rs.getInt("PRICE"); 
		}
		dto5.setFavoritenum(favoritenum);
		dto5.setFavoriteimg(favoriteimg);
		dto5.setFavoritename(favoritename);
		dto5.setFavoriteprice(favoriteprice);
		}
		}catch(Exception e) {
			System.out.println("찜한 제품 번호 가져오고 찜 목록 가져오는 중 예외 발생");
			e.printStackTrace();
		
		}
		return dto5;
	
	}
	
	
	
	
	
	
	public PJ2DTO desc(String bid) {
	    PJ2DTO dto5 = new PJ2DTO();

	    String query = "SELECT p.ID, p.imgUrl_1, p.PRODUCTNAME, p.PRICE " +
	                   "FROM FAVORITE f " +
	                   "JOIN PRODUCT p ON f.PRODUCTID = p.ID " +
	                   "WHERE f.USERID = ? " +
	                   "ORDER BY p.PRICE DESC";
	    int[] favoritenum = new int[100];
	    String[] favoriteimg = new String[100];
	    String[] favoritename = new String[100];
	    int[] favoriteprice = new int[100];

	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setString(1, bid);
	        rs = psmt.executeQuery();

	        int i = 0;
	        while (rs.next() && i < 100) {
	            favoritenum[i] = rs.getInt("ID");
	            favoriteimg[i] = rs.getString("imgUrl_1");
	            favoritename[i] = rs.getString("PRODUCTNAME");
	            favoriteprice[i] = rs.getInt("PRICE");
	            i++;
	        }
	        dto5.setFavoritenum(favoritenum);
	        dto5.setFavoriteimg(favoriteimg);
	        dto5.setFavoritename(favoritename);
	        dto5.setFavoriteprice(favoriteprice);

	    } catch (Exception e) {
	        System.out.println("찜 목록 가져오는 중 예외 발생");
	        e.printStackTrace();
	    }

	    return dto5;
	}

	public PJ2DTO asc(String bid) {
	    PJ2DTO dto5 = new PJ2DTO();

	    String query = "SELECT p.ID, p.imgUrl_1, p.PRODUCTNAME, p.PRICE " +
	                   "FROM FAVORITE f " +
	                   "JOIN PRODUCT p ON f.PRODUCTID = p.ID " +
	                   "WHERE f.USERID = ? " +
	                   "ORDER BY p.PRICE ASC";
	    int[] favoritenum = new int[100];
	    String[] favoriteimg = new String[100];
	    String[] favoritename = new String[100];
	    int[] favoriteprice = new int[100];

	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setString(1, bid);
	        rs = psmt.executeQuery();

	        int i = 0;
	        while (rs.next() && i < 100) {
	            favoritenum[i] = rs.getInt("ID");
	            favoriteimg[i] = rs.getString("imgUrl_1");
	            favoritename[i] = rs.getString("PRODUCTNAME");
	            favoriteprice[i] = rs.getInt("PRICE");
	            i++;
	        }
	        dto5.setFavoritenum(favoritenum);
	        dto5.setFavoriteimg(favoriteimg);
	        dto5.setFavoritename(favoritename);
	        dto5.setFavoriteprice(favoriteprice);

	    } catch (Exception e) {
	        System.out.println("찜 목록 가져오는 중 예외 발생");
	        e.printStackTrace();
	    }

	    return dto5;
	}
	
	public PJ2DTO ADRS(int suid) {  //판매자 번호
		PJ2DTO dto3 = new PJ2DTO();
		
		String query = "SELECT ADDRESS FROM USERS WHERE USERS.ID = ?";
				
		try {
		psmt = con.prepareStatement(query);
		psmt.setInt(1, suid);
		rs = psmt.executeQuery();
		
			if(rs.next()){
		
			
			dto3.setAddress(rs.getString("ADDRESS"));
			}
		}catch(Exception e) {
			System.out.print("주소 가져오는 중 예외 발생");
			e.printStackTrace();
		}
		return dto3;
}
	
	
	
	
	public int like(String sid, String bid) {
		int result = 0;					         //구매자 id
		
		String query = "Insert into FAVORITE(USERID, PRODUCTID,CREATEDATE) "
				+ " VALUES(?,?,SYSDATE)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,bid);
			psmt.setString(2, sid);
			result = psmt.executeUpdate();
		}catch(Exception e){
			System.out.println("찜 시도 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	


	public int likedelete(String sid, String bid) {
		int result = 0;
	
		String query = "DELETE FROM FAVORITE WHERE userid=? and productid= ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, bid);
			psmt.setString(2, sid);
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("찜 해제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public PJ2DTO likesearch(int sid,int bid) { //판매글 번호, 구매자 번호
		PJ2DTO dto4 = new PJ2DTO();
		
		String query = "SELECT * FROM FAVORITE WHERE USERID = ? AND PRODUCTID = ? ";
				
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, bid);
			psmt.setInt(2, sid);
			rs = psmt.executeQuery();
		
		if(rs.next()) {
			dto4.setLikeSearch("1");
		}else {
			dto4.setLikeSearch("0");
		}
		}catch(Exception e) {
			System.out.println("찜 확인 중 예외 발생");
			e.printStackTrace();
			
		}
		return dto4;
	}
	

	
	public int sell(int sid) {  //판매글 번호 , 구매자 이름
		int result = 0;
	
		String query ="UPDATE PRODUCT SET SOLD= '1' WHERE PRODUCT.ID = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, sid);
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("판매 완료 중 예외 발생");
			e.printStackTrace();
		}
		return result;
		
	}
	
	
	@SuppressWarnings("null")
	public int sell2(int sid, String bidname) {
	    int result = 0;
	    int bid = 0;
	    int sellerid = 0;
	    
	    String selleridquery = "SELECT WRITERID FROM PRODUCT WHERE PRODUCT.ID = ?";
	    
	    try {
	    	psmt =con.prepareStatement(selleridquery);
	    	psmt.setInt(1, sid);
	    	rs = psmt.executeQuery();
	    	
	    	if(rs.next()){
	    		sellerid = rs.getInt("WRITERID");
	    	}
	    
	    
	    // 구매자 이름을 이용해 사용자 ID 조회
	    String query = "SELECT ID FROM USERS WHERE USERS.USERNAME = ?";
	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setString(1, bidname);
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            bid = rs.getInt("ID");

	            // 이미 판매된 상품인지 확인
	            String checkQuery = "SELECT COUNT(*) AS cnt FROM TRANSACTIONS WHERE PRODUCTID = ?";
	            psmt = con.prepareStatement(checkQuery);
	            psmt.setInt(1, sid);
	            rs = psmt.executeQuery();

	            if (rs.next() && rs.getInt("cnt") > 0) {
	                // 이미 판매된 상품이면
	                return -1; 
	            } else {
	              
	                String insertQuery = "INSERT INTO TRANSACTIONS(BUYERID,PRODUCTID,SELLERID) VALUES(?, ?, ?)";
	                psmt = con.prepareStatement(insertQuery);
	                psmt.setInt(1, bid);
	                psmt.setInt(2, sid);
	                psmt.setInt(3, sellerid);
	                result = psmt.executeUpdate();
	                return result; 
	            }
	        } else {
	         
	            return 0; 
	        }
	    } catch (Exception e) {
	        System.out.println("판매 완료 중 예외 발생");
	        e.printStackTrace();
	        return 0; 
	}
	
	}catch (Exception e) {
        System.out.println("판매 완료 중 예외 발생");
        e.printStackTrace();
        return 0; 
}
	}
}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * public boolean handleLike(String sellerid, String userid) { boolean isLiked =
	 * false; con = null; PreparedStatement psmt = null;
	 * 
	 * try {
	 * 
	 * con = getConnection();// getConnection 메서드는 데이터베이스 연결을 설정하는 코드입니다. 이에 대한 구현은
	 * 생략하였습니다.
	 * 
	 * // Check if the like exists String selectQuery =
	 * "SELECT * FROM likes WHERE sellerid = ? AND userid = ?"; psmt =
	 * con.prepareStatement(selectQuery); psmt.setString(1, sellerid);
	 * psmt.setString(2, userid); ResultSet rs = psmt.executeQuery();
	 * 
	 * if (rs.next()) { // Already liked, so unlike String deleteQuery =
	 * "DELETE FROM likes WHERE sellerid = ? AND userid = ?"; psmt =
	 * con.prepareStatement(deleteQuery); psmt.setString(1, sellerid);
	 * psmt.setString(2, userid); psmt.executeUpdate(); isLiked = false; } else { //
	 * Not liked, so like String insertQuery =
	 * "INSERT INTO likes (sellerid, userid) VALUES (?, ?)"; psmt =
	 * con.prepareStatement(insertQuery); psmt.setString(1, sellerid);
	 * psmt.setString(2, userid); psmt.executeUpdate(); isLiked = true; } } catch
	 * (SQLException e) { e.printStackTrace(); } finally { // Close resources if
	 * (psmt != null) { try { psmt.close(); } catch (SQLException e) {
	 * e.printStackTrace(); } } if (con != null) { try { con.close(); } catch
	 * (SQLException e) { e.printStackTrace(); } } } return isLiked; }
	 * 
	 * 
	 * 
	 * public Connection getConnection() throws SQLException { String url =
	 * "jdbc:oracle:thin:@localhost:1521:xe"; String id = "c##musthave"; String pwd
	 * = "1234"; return DriverManager.getConnection(url, id, pwd); }
	 */
