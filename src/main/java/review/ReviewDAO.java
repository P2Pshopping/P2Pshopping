package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import common.DBConnPool;

public class ReviewDAO extends DBConnPool {

    public ReviewDAO() {
        super(); // 기본 생성자를 호출하여 DB에 연결
    }

    public List<ReviewDTO> selectReviews() {
        List<ReviewDTO> reviews = new ArrayList<>();
        String query = "SELECT * FROM review ORDER BY createDate DESC";
        try {
            psmt = con.prepareStatement(query);
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
        return reviews;
    }
}

