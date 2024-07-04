package admin;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class ReviewDAO extends JDBConnect {
    // 최근 리뷰 가져오기
    public List<ReviewDTO> getRecentReviews() {
        List<ReviewDTO> reviews = new ArrayList<>();
        String query = "SELECT * FROM review ORDER BY createDate DESC FETCH FIRST 5 ROWS ONLY";
        try (Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query))  {
//            pstmt = con.prepareStatement(query);
//            rs = pstmt.executeQuery();
            while (rs.next()) {
                ReviewDTO review = new ReviewDTO();
                review.setId(rs.getInt("id"));
//                review.setSellerId(rs.getInt("sellerId"));
//                review.setBuyerId(rs.getInt("buyerId"));
//                review.setProductId(rs.getInt("productId"));
                review.setTitle(rs.getString("title"));
                review.setRating(rs.getInt("rating"));
                review.setCreateDate(rs.getTimestamp("createDate"));
                reviews.add(review);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reviews;
    }
}
