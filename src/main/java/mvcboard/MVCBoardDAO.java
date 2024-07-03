package mvcboard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBConnect;

public class MVCBoardDAO extends JDBConnect {
	public MVCBoardDAO() {
		super(); // 기본 생성자를 호출하여 DB에 연결
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM boards";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE ?";
		}

		try {
			psmt = con.prepareStatement(query);
			if (map.get("searchWord") != null) {
				psmt.setString(1, "%" + map.get("searchWord") + "%");
			}
			rs = psmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
		List<MVCBoardDTO> boardList = new ArrayList<>();
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

				dto.setId(rs.getString("id"));
				dto.setBno(rs.getString("bno"));
				dto.setWriterId(rs.getInt("writerId"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCreateDate(rs.getDate("createDate"));
				dto.setUpdateDate(rs.getDate("updateDate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setViews(rs.getInt("views"));
				dto.setLikes(rs.getInt("likes"));
				boardList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}

	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO boards (id, bno, writerId, title, content, ofile, sfile) "
					+ " VALUES (seq_board_num.NEXTVAL, ?, ?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getBno());
			psmt.setInt(2, dto.getWriterId());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getOfile());
			psmt.setString(6, dto.getSfile());

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
				dto.setId(rs.getString("id"));
				dto.setWriterId(rs.getInt("writerid"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCreateDate(rs.getDate("createDate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setViews(rs.getInt("views"));
				dto.setLikes(rs.getInt("likes"));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}

		return dto;
	}

	public void updateVisitCount(String id) {
		String query = "UPDATE boards SET views=views+1 WHERE id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

	public void updateLikesCount(String id) {
		String query = "UPDATE boards SET likes=likes+1 WHERE id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 좋아요 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

	public int getLikesCount(String id) {
		int likes = 0;
		String query = "SELECT likes FROM boards WHERE id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				likes = rs.getInt("likes");
			}
		} catch (Exception e) {
			System.out.println("게시물 좋아요 수 조회 중 예외 발생");
			e.printStackTrace();
		}
		return likes;
	}

	public int deletePost(String id) {
		int result = 0;
		try {
			String query = "DELETE FROM boards WHERE id=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	public int updatePost(MVCBoardDTO dto) {
		int result = 0;
		try {
			String query = "UPDATE boards SET title=?, content=?, ofile=?, sfile=? WHERE id=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			psmt.setString(5, dto.getId());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	public int getWriterIdByUsername(String username) {
		int writerId = 0;
		String query = "SELECT id FROM users  WHERE username=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, username);
			rs = psmt.executeQuery();
			if (rs.next()) {
				writerId = rs.getInt("id");
			}
		} catch (SQLException e) {
			System.out.println("작성자 ID 조회 중 예외 발생");
			e.printStackTrace();

		}
		return writerId;
	}

	public String getNameByWriterId(int writerId) {
		String name = null;
		String query = "SELECT name FROM users WHERE id = ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, writerId);
			rs = psmt.executeQuery();

			if (rs.next()) {
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return name;
	}

	public List<MVCBoardDTO> get3likes() {
		List<MVCBoardDTO> likePosts = new ArrayList<>();
		String query = "SELECT * FROM boards ORDER BY likes DESC FETCH FIRST 3 ROWS ONLY";

		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();

			while (rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				dto.setId(rs.getString("id"));
				dto.setWriterId(rs.getInt("writerId"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCreateDate(rs.getDate("createDate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setViews(rs.getInt("views"));
				dto.setLikes(rs.getInt("likes"));
				likePosts.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return likePosts;
	}

}
