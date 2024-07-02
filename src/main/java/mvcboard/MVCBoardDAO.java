package mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class MVCBoardDAO extends DBConnPool {
	public MVCBoardDAO() {
		super();
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM boards";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}



	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
		List<MVCBoardDTO> board = new Vector<>();

		String query = "" + " SELECT * FROM ( " + " SELECT Tb.*, ROWNUM rNum FROM ( " + " SELECT * FROM boards ";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
		}

		query += " ORDER by id DESC " + " ) Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();

				dto.setId(rs.getString(1));
				dto.setBno(rs.getInt(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setCreateDate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setViews(rs.getInt(8));
				dto.setLikes(rs.getInt(9));

				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}

		return board;
	}

	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO boards ( " + " id, writerid, title, content, ofile, sfile) " + " VALUES( "
					+ " seq_board_num.NEXTVAL,?,?,?,?,?)";

			psmt = con.prepareStatement(query);
			psmt.setInt(1, dto.getWriterId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}

	public MVCBoardDTO selectView(String id) {
		MVCBoardDTO dto = new MVCBoardDTO();
		String query = "SELECT * FROM boards WHERE id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString(1));
				dto.setWriterId(rs.getInt(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setCreateDate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setViews(rs.getInt(8));
				dto.setLikes(rs.getInt(9));
			}

		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();

		}
		return dto;
	}

	public void updateVisitCount(String id) {
		String query = "UPDATE boards SET " + " views=views+1 " + " WHERE id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

	public void updateLikesCount(String id) {
        String query = "UPDATE boards SET LIKES = LIKES + 1 WHERE ID=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            psmt.executeUpdate(); // 수정된 내용: executeQuery() 대신 executeUpdate() 사용
        } catch (Exception e) {
            System.out.println("게시물 좋아요 증가 중 예외 발생");
            e.printStackTrace();
        }
    }

    // 추천 수 조회 메서드 (필요에 따라 추가)
    public int getLikesCount(String id) {
        int likes = 0;
        String query = "SELECT LIKES FROM boards WHERE ID=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, id);
            rs = psmt.executeQuery();
            if (rs.next()) {
                likes = rs.getInt("LIKES");
            }
        } catch (Exception e) {
            System.out.println("게시물 좋아요 수 조회 중 예외 발생");
            e.printStackTrace();
        }
        return likes;
    }



	public int deletePost(String id) {
		int result=0;
		try {
			String query = "DELETE FROM boards WHERE id=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	public int updatePost(MVCBoardDTO dto) {
		int result =0;
		try {
			String query = "UPDATE mvcboard "
					+ " SET title=?,  content=?, ofile=?, sfile=? "
					+ " WHERE id=? ";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());

			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			psmt.setString(5, dto.getId());


			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	public int getWriterIdByUsername(String username) {
	    int writerId = 0;
	    String query = "SELECT id FROM users WHERE username = ?";

	    try {
	        psmt = con.prepareStatement(query);
	        psmt.setString(1, username);
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            writerId = rs.getInt("id");
	        }
	    } catch (Exception e) {
	        System.out.println("사용자 ID 조회 중 예외 발생");
	        e.printStackTrace();
	    }

	    return writerId;
	}
}