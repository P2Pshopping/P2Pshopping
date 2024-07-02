package itemList;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;

public class ItemListDAO extends JDBConnect {

	 public List<ItemListDTO> selectListPage(Map<String, Object> map){
	        List<ItemListDTO> board = new Vector<ItemListDTO>();
	        String query = "SELECT u.username, p.productname, p.price, p.IMGURL_1, p.CATEGORYID "
	                     + "FROM PRODUCT p, USERS u";

			System.out.print("불러오기 시도중");
			if(map.get("searchWord") != null)
			{
				query += " WHERE " + map.get("searchField")
					  + " LIKE '%" + map.get("searchWord") + "%' ";
			}
	try{

		psmt = con.prepareStatement(query);
        rs = psmt.executeQuery();
        System.out.println("연결중");
       while (rs.next()) {
           ItemListDTO dto = new ItemListDTO();
           dto.setUsername(rs.getString("username"));
           dto.setProductName(rs.getString("productname"));
           dto.setPrice(rs.getString("price"));
           dto.setImgUrl_1(rs.getString("IMGURL_1"));
           dto.setCategoryid(rs.getString("CATEGORYID"));

           board.add(dto);
}



	}catch(Exception e){
		System.out.println("사진 불러오는 중 예외 발생");
		e.printStackTrace();
	}
	return board;


}
}