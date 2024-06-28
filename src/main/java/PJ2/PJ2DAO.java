package PJ2;

import java.util.List;
import java.util.Vector;

import common.JDBConnect;

public class PJ2DAO extends JDBConnect {
	
	public PJ2DTO img(String id) {
		
		PJ2DTO dto = new PJ2DTO();
		
	String query = "SELECT imgUrl_1,imgUrl_2,imgUrl_3,imgUrl_4,PRODUCTNAME ,DETAIL ,PRICE "
			+ "FROM PRODUCT 	"
			+ "WHERE PRODUCT.ID = ?" ;
			
	try{
		psmt = con.prepareStatement(query);
		psmt.setString(1, id);
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
}
