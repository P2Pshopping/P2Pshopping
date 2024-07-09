package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import common.DBConnPool;
import mvcboard.MVCBoardDTO;

//<paging>
// 1. DBConnPool 클래스의 getConnection() 메서드를 추가하여 
//Connection 객체를 가져오는 메서드를 구현. DBConnPool 클래스는 다음과 같아야

// 2. 이제 DBConnPool의 getConnection() 메서드를 사용하여 ReviewDAO2 클래스에서 Connection을 얻어오도록 하자.
public class ReviewDAO2 extends DBConnPool {

	public ReviewDAO2() {
		super(); // 기본 생성자를 호출하여 DB에 연결
	}

	

	public List<ReviewDTO> selectReviews(int start, int end) {
		List<ReviewDTO> reviews = new ArrayList<>();
		String query = "SELECT * FROM (SELECT ROWNUM AS rnum, A.* FROM (SELECT * FROM review ORDER BY createDate DESC) A WHERE ROWNUM <= ?) WHERE rnum >= ?";
		try {
//          <<<각 메서드에서 Connection 객체를 사용할 때 getConnection() 메서드를 통해 항상 유효한 연결을 얻도록 수정
			 psmt = getConnection().prepareStatement(query);
			psmt.setInt(1, end);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ReviewDTO review = new ReviewDTO();
				review.setId(rs.getInt("id"));
				review.setTransactionId(rs.getInt("transactionId"));
				review.setTitle(rs.getString("title"));
				review.setDetail(rs.getString("detail"));
				review.setRating(rs.getInt("rating"));
				review.setOfile(rs.getString("ofile"));
				review.setSfile(rs.getString("sfile"));
				review.setViews(rs.getInt("views"));
				review.setLikes(rs.getInt("likes"));
				review.setCreateDate(rs.getTimestamp("createDate"));
				review.setUpdateDate(rs.getTimestamp("updateDate"));
				reviews.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(); // 자원 해제
		}
		System.out.println("Reviews retrieved: " + reviews.size());
		return reviews;
	}


	
    public int getReviewCount() {
        int count = 0;
        String query = "SELECT COUNT(*) FROM review";
             try {
//          <<<각 메서드에서 Connection 객체를 사용할 때 getConnection() 메서드를 통해 항상 유효한 연결을 얻도록 수정
            psmt = getConnection().prepareStatement(query);
            rs = psmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(); // 자원 해제
        }
        System.out.println("Total reviews count: " + count);
        return count;
    }




//    // 모든 리뷰 가져오기
//    public List<ReviewDTO> getAllReviews() {
//        List<ReviewDTO> reviews = new ArrayList<>();
//        String sql = "SELECT r.id, r.title, r.detail, r.rating, r.ofile, r.sfile, "
//                   + "t.transaction_date, s.name AS sellerName, b.name AS buyerName, p.productName "
//                   + "FROM review r "
//                   + "JOIN transactions t ON r.transactionId = t.id "
//                   + "JOIN users s ON t.sellerId = s.id "
//                   + "JOIN users b ON t.buyerId = b.id "
//                   + "JOIN product p ON t.productId = p.id";
//        try {
//            psmt = con.prepareStatement(sql);
//            rs = psmt.executeQuery();
//            while (rs.next()) {
//                ReviewDTO review = new ReviewDTO();
//                review.setId(rs.getInt("id"));
//                review.setTitle(rs.getString("title"));
//                review.setDetail(rs.getString("detail"));
//                review.setRating(rs.getInt("rating"));
//                review.setOfile(rs.getString("ofile"));
//                review.setSfile(rs.getString("sfile"));
//                review.setTransactionDate(rs.getTimestamp("transaction_date"));
//                review.setSellerName(rs.getString("sellerName"));
//                review.setBuyerName(rs.getString("buyerName"));
//                review.setProductName(rs.getString("productName"));
//                reviews.add(review);
//            }
//            System.out.println("Reviews fetched: " + reviews.size()); // 디버깅 출력
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            close();
//        }
//        return reviews;
//    }

	// 리뷰 수 조회
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM review";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE ?";
		}

        try {
            if (con == null || con.isClosed()) {
                con = getConnection();
            }
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
        } finally {
            close();
        }
        return totalCount;
    }

	// 페이징 처리된 리뷰 목록 조회
	public List<ReviewDTO> selectListPage(Map<String, Object> map) {
		List<ReviewDTO> reviewList = new ArrayList<>();
		String query = "" + " SELECT * FROM ( " + " SELECT Tb.*, ROWNUM rNum FROM ( " + " SELECT * FROM review ";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
		}

		query += " ORDER by id DESC " + " ) Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?";

        try {
            if (con == null || con.isClosed()) {
                con = getConnection();
            }
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();

			while (rs.next()) {
				ReviewDTO review = new ReviewDTO();
				review.setId(rs.getInt("id"));
				review.setTransactionId(rs.getInt("transactionId"));
				review.setTitle(rs.getString("title"));
				review.setDetail(rs.getString("detail"));
				review.setRating(rs.getInt("rating"));
				review.setOfile(rs.getString("ofile"));
				review.setSfile(rs.getString("sfile"));
				review.setViews(rs.getInt("views"));
				review.setLikes(rs.getInt("likes"));
				reviewList.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return reviewList;
	}

	// 리뷰 작성
	public int insertReview(ReviewDTO review) {
		int result = 0;
		String sql = "INSERT INTO review (transactionId, title, detail, rating, ofile, sfile, writerId, createDate, updateDate) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, SYSDATE, SYSDATE)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, review.getTransactionId());
			psmt.setString(2, review.getTitle());
			psmt.setString(3, review.getDetail());
			psmt.setInt(4, review.getRating());
			psmt.setString(5, review.getOfile());
			psmt.setString(6, review.getSfile());
			psmt.setInt(7, review.getWriterId());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 리뷰 수정
	public int updateReview(ReviewDTO review) {
		int result = 0;
		String sql = "UPDATE review SET title = ?, detail = ?, rating = ?, ofile = ?, sfile = ?, updateDate = SYSDATE WHERE id = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, review.getTitle());
			psmt.setString(2, review.getDetail());
			psmt.setInt(3, review.getRating());
			psmt.setString(4, review.getOfile());
			psmt.setString(5, review.getSfile());
			psmt.setInt(6, review.getId());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 리뷰 하나 가져오기
	public ReviewDTO getReviewById(int id) {
		ReviewDTO review = null;
		String sql = "SELECT r.id, r.transactionId, r.title, r.detail, r.rating, r.ofile, r.sfile, "
				+ "r.views, r.likes, r.writerID, r.createDate, r.updateDate, "
				+ "t.transaction_date, s.name AS sellerName, b.name AS buyerName, p.productName " + "FROM review r "
				+ "JOIN transactions t ON r.transactionId = t.id " + "JOIN users s ON t.sellerId = s.id "
				+ "JOIN users b ON t.buyerId = b.id " + "JOIN product p ON t.productId = p.id " + "WHERE r.id = ?";
		try {
			 psmt = getConnection().prepareStatement(sql);
//			psmt = con.prepareStatement(sql);
			psmt.setInt(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				review = new ReviewDTO();
				review.setId(rs.getInt("id"));
				review.setWriterId(rs.getInt("writerId"));
				review.setTransactionId(rs.getInt("transactionId"));
				review.setTitle(rs.getString("title"));
				review.setDetail(rs.getString("detail"));
				review.setRating(rs.getInt("rating"));
				review.setOfile(rs.getString("ofile"));
				review.setSfile(rs.getString("sfile"));
				review.setViews(rs.getInt("views"));
				review.setLikes(rs.getInt("likes"));
				review.setCreateDate(rs.getTimestamp("createDate"));
				review.setUpdateDate(rs.getTimestamp("updateDate"));
				review.setTransactionDate(rs.getTimestamp("transaction_date"));
				review.setSellerName(rs.getString("sellerName"));
				review.setBuyerName(rs.getString("buyerName"));
				review.setProductName(rs.getString("productName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return review;
	}

	// 리뷰 삭제
	public int deleteReview(int id) {
		int result = 0;
		String sql = "DELETE FROM review WHERE id = ?";
		try {
			psmt = getConnection().prepareStatement(sql);
//			psmt = con.prepareStatement(sql);
			psmt.setInt(1, id);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 조회수 증가
//	public void updateVisitCount(int id) {
//		String query = "UPDATE review SET views = views + 1 WHERE id = ?";
//		try {
////			psmt = con.prepareStatement(query);
//			psmt = getConnection().prepareStatement(query);
//			psmt.setInt(1, id);
//			psmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//	}
	
	// 조회수 증가
    public void updateVisitCount(int id) {
        String query = "UPDATE review SET views = views + 1 WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement psmt = conn.prepareStatement(query)) {
            psmt.setInt(1, id);
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//	public void updateLikesCount(String id) {
//		String query = "UPDATE boards SET likes=likes+1 WHERE id=?";
//		try {
//			psmt = con.prepareStatement(query);
//			psmt.setString(1, id);
//			psmt.executeUpdate();
//		} catch (Exception e) {
//			System.out.println("게시물 좋아요 증가 중 예외 발생");
//			e.printStackTrace();
//		}
//	}
	
	// 좋아요 증가
//	public void updateLikesCount(int id) {
//		String query = "UPDATE review SET likes = likes + 1 WHERE id = ?";
//		try {
//			psmt = getConnection().prepareStatement(query);
////			psmt = con.prepareStatement(query);
//			psmt.setInt(1, id);
//			psmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("게시물 좋아요 증가 중 예외 발생");
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//	}

	// 좋아요 증가
    public void updateLikesCount(int id) {
        String query = "UPDATE review SET likes = likes + 1 WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement psmt = conn.prepareStatement(query)) {
            psmt.setInt(1, id);
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	// 좋아요 수 조회
	public int getLikesCount(int id) {
		int likes = 0;
		String query = "SELECT likes FROM review WHERE id = ?";
		try {
			psmt = getConnection().prepareStatement(query);
//			psmt = con.prepareStatement(query);
			psmt.setInt(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				likes = rs.getInt("likes");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return likes;
	}
//////////////////////////////////////
	public int getWriterIdByUsername(String username) {
		int writerId = 0;
		String query = "SELECT id FROM users  WHERE username=?";
		try {
			psmt = getConnection().prepareStatement(query);
//			psmt = con.prepareStatement(query);
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
			psmt = getConnection().prepareStatement(query);
//			psmt = con.prepareStatement(query);
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
	
	public List<ReviewDTO> get3likes() {
		List<ReviewDTO> likePosts = new ArrayList<>();
		String query = "SELECT * FROM review ORDER BY likes DESC FETCH FIRST 3 ROWS ONLY";

		try {
			psmt = getConnection().prepareStatement(query);
//			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setId(rs.getInt("id"));
				dto.setWriterId(rs.getInt("writerId"));
				dto.setTitle(rs.getString("title"));
				dto.setDetail(rs.getString("detail"));
				dto.setCreateDate(rs.getTimestamp("createDate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setViews(rs.getInt("views"));
				dto.setLikes(rs.getInt("likes"));
				likePosts.add(dto);
			}
	        System.out.println("Number of popular posts fetched: " + likePosts.size()); // 디버깅 로그 추가
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return likePosts;
	}
	
	
//	// 추가: 자원 해제 메서드
    private void closeResource(ResultSet rs, PreparedStatement psmt, Connection con) {
        try {
            if (rs != null) rs.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 기존 close 메서드 수정
    @Override
    public void close() {
        try {
            if (rs != null) rs.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}