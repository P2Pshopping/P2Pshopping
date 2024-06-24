package board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class BoardDAO extends DBConnPool {
	public BoardDAO() {
		super();
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String qr = "SELECT COUNT(*) FROM BOARDS ";
		if(map.get("searchWord") != null) {
			qr += " WHERE " + map.get("searchField") + " "
					+ " likes '%" + map.get("searchWord") + "%' ";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(qr);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<BoardDTO> selectListPage(Map<String, Object> map) {
	    List<BoardDTO> board = new Vector<BoardDTO>();

	    String query = "SELECT * FROM ( " +
	                   "  SELECT Tb.*, ROWNUM rNum FROM ( " +
	                   "    SELECT * FROM boards ";

	    if (map.get("searchWord") != null) {
	        query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
	    }

	    query += " ORDER by id DESC " +
	             "  ) Tb " +
	             ") " +
	             " WHERE rNum BETWEEN ? AND ?";

	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setString(1, map.get("start").toString());
	        psmt.setString(2, map.get("end").toString());
	        rs = psmt.executeQuery();

	        while (rs.next()) {
	            BoardDTO dto = new BoardDTO();
	            dto.setId(rs.getInt("id"));
	            dto.setBno(rs.getInt("bno"));
	            dto.setWriterId(rs.getString("writerId"));
	            dto.setTitle(rs.getString("title"));
	            dto.setDetail(rs.getString("detail"));
	            dto.setCreateDate(rs.getDate("createDate"));
	            dto.setUpdateDate(rs.getDate("updateDate"));
	            dto.setImgUrl_1(rs.getString("imgUrl_1"));
	            dto.setImgUrl_2(rs.getString("imgUrl_2"));
	            dto.setImgUrl_3(rs.getString("imgUrl_3"));
	            dto.setImgUrl_4(rs.getString("imgUrl_4"));
	            dto.setLikes(rs.getInt("likes"));
	            dto.setViews(rs.getInt("views"));
	            dto.setPass(rs.getString("pass"));
	            board.add(dto);
	        }
	    } catch (Exception e) {
	        System.out.println("게시물 조회 중 예외 발생");
	        e.printStackTrace();
	    }

	    return board;
	}

	public int insertWrite(BoardDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO board ( " + " id,bno,writerId,title,detail,createDate,updateDate,imgUrl_1,imgUrl_2,imgUrl_3,imgUrl_4) " + " VALUES( "
					+ " seq_board_num.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?)";

			psmt = con.prepareStatement(query);
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}

	public BoardDTO selectView(int id) {
		BoardDTO dto = new BoardDTO();
		String query = "SELECT * FROM board WHERE id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				
			}

		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();

		}
		return dto;
	}

	public void updateVisitCount(int id) {
		String query = "UPDATE mvcboard SET " + " visitcount=visitcount+1 " + " WHERE id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, id);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

	public void downCountPlus(int id) {
		String sql = "UPDATE mvcboard SET " + " downcount=downcount+1 " + " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, id);
			psmt.executeUpdate();
		} catch (Exception e) {
		}
	}
	
	public boolean confirmPassword(String pass, int id) {
		boolean isCorr = true;
		try {
			String sql = "SELECT COUNT(*) FROM mvcboard WHERE pass=? AND id=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setInt(2, id);
			rs=psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) {
				isCorr = false;
			}
		}
		catch(Exception e) {
			isCorr = false;
			e.printStackTrace();
		}
		return isCorr;
	}
	public int deletePost(int id) {
		int result=0;
		try {
			String query = "DELETE FROM mvcboard WHERE id=?";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, id);
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int updatePost(BoardDTO dto) {
		int result =0;
		try {
			String query = "UPDATE mvcboard "
					+ " SET title=?, name=?, content=?, ofile=?, sfile=? "
					+ " WHERE idx=? ane pass=?";
			
			psmt = con.prepareStatement(query);
		
			
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
