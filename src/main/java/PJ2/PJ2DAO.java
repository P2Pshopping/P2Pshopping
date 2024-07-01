package PJ2;

import common.JDBConnect;

public class PJ2DAO extends JDBConnect {
	
	public PJ2DTO img(String sid) {  //게시물 출력
					//판매글 id
		PJ2DTO dto = new PJ2DTO();
		
	String query = "SELECT imgUrl_1,imgUrl_2,imgUrl_3,imgUrl_4,PRODUCTNAME ,DETAIL ,PRICE "
			+ "FROM PRODUCT 	"
			+ "WHERE PRODUCT.ID = ?" ;
			
	try{
		psmt = con.prepareStatement(query);
		psmt.setString(1, sid);
		rs = psmt.executeQuery();
		
		if(rs.next()){
		
			
			dto.setImgUrl_1(rs.getString("imgUrl_1"));
			dto.setImgUrl_2(rs.getString("imgUrl_2"));
			dto.setImgUrl_3(rs.getString("imgUrl_3"));
			dto.setImgUrl_4(rs.getString("imgUrl_4"));
			dto.setProductName(rs.getString("PRODUCTNAME"));
			dto.setDetail(rs.getString("DETAIL"));
			dto.setPrice("PRICE");
		
			
		
}													
		
		
	}catch(Exception e){
		System.out.println("사진 불러오는 중 예외 발생");
		e.printStackTrace();
	}
	return dto;
	

}
	
	
	
	
	public  PJ2DTO more()  {
		PJ2DTO dto2 = new PJ2DTO();
		
		String query = "SELECT imgUrl_1, ID FROM PRODUCT WHERE rownum<=4  ORDER BY CREATEDATE DESC";
		String[] f = new String[4];
		String[] moreid = new String[4];
		
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
	
	public PJ2DTO ADRS(String suid) {  //판매자 번호
		PJ2DTO dto3 = new PJ2DTO();
		
		String query = "SELECT ADDRESS FROM USERS WHERE USERS.ID = ?";
				
		try {
		psmt = con.prepareStatement(query);
		psmt.setString(1, suid);
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
}