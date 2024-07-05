package mvcboard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class CommentDAO extends JDBConnect {

	public CommentDAO() {
		super(); // DB 연결을 위한 초기화
	}

	public List<CommentDTO> getCommentsByBoardId(String boardId) {
		List<CommentDTO> comments = new ArrayList<>();
		try {

			String sql = "SELECT * FROM BOARD_COMMENT WHERE cm_board = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, boardId);

			rs = psmt.executeQuery();
			while (rs.next()) {
				CommentDTO comment = new CommentDTO();
				comment.setCm_id(rs.getInt("cm_id"));
				comment.setCm_board(rs.getString("cm_board"));
				comment.setCm_writerId(rs.getString("cm_writerId"));
				comment.setCm_createDate(rs.getDate("cm_createDate"));
				comment.setCm_content(rs.getString("cm_content"));
				comments.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return comments;
	}

	public int insertComment(CommentDTO comment) {
		int result = 0;
		try {

			String sql = "INSERT INTO BOARD_COMMENT (cm_board, cm_writerId, cm_createDate, cm_content) VALUES (?, ?, sysdate, ?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, comment.getCm_board());
			psmt.setString(2, comment.getCm_writerId());
			psmt.setString(3, comment.getCm_content());

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int deleteComment(int commentId) {
		int result = 0;
		try {

			String sql = "DELETE FROM BOARD_COMMENT WHERE cm_id = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, commentId);

			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 기타 필요한 메서드들 추가 가능
}
