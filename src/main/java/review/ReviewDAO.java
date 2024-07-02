package review;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import common.DBConnPool;

public class ReviewDAO {
    private Connection con;
    private PreparedStatement psmt;
    private ResultSet rs;

    public ReviewDAO() {
        try {
            DBConnPool dbPool = new DBConnPool();
            con = dbPool.con;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<ReviewDTO> getAllReviews() {
        List<ReviewDTO> reviews = new ArrayList<>();
        String sql = "SELECT r.id, r.title, r.detail, r.rating, r.ofile, r.sfile, "
                   + "t.transaction_date, s.name AS sellerName, b.name AS buyerName, p.productName "
                   + "FROM review r "
                   + "JOIN transactions t ON r.transactionId = t.id "
                   + "JOIN users s ON t.sellerId = s.id "
                   + "JOIN users b ON t.buyerId = b.id "
                   + "JOIN product p ON t.productId = p.id";
        try {
            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();
            while (rs.next()) {
                ReviewDTO review = new ReviewDTO();
                review.setId(rs.getInt("id"));
                review.setTitle(rs.getString("title"));
                review.setDetail(rs.getString("detail"));
                review.setRating(rs.getInt("rating"));
                review.setOfile(rs.getString("ofile"));
                review.setSfile(rs.getString("sfile"));
                review.setTransactionDate(rs.getTimestamp("transaction_date"));
                review.setSellerName(rs.getString("sellerName"));
                review.setBuyerName(rs.getString("buyerName"));
                review.setProductName(rs.getString("productName"));
                reviews.add(review);
            }
            System.out.println("Reviews fetched: " + reviews.size()); // 디버깅 출력
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return reviews;
    }

    // 리뷰 작성
    public int insertReview(ReviewDTO review) {
        int result = 0;
        String sql = "INSERT INTO review (transactionId, title, detail, rating, ofile, sfile, createDate, updateDate) "
                   + "VALUES (?, ?, ?, ?, ?, ?, SYSDATE, SYSDATE)";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, review.getTransactionId());
            psmt.setString(2, review.getTitle());
            psmt.setString(3, review.getDetail());
            psmt.setInt(4, review.getRating());
            psmt.setString(5, review.getOfile());
            psmt.setString(6, review.getSfile());
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
                   + "t.transaction_date, s.name AS sellerName, b.name AS buyerName, p.productName "
                   + "FROM review r "
                   + "JOIN transactions t ON r.transactionId = t.id "
                   + "JOIN users s ON t.sellerId = s.id "
                   + "JOIN users b ON t.buyerId = b.id "
                   + "JOIN product p ON t.productId = p.id "
                   + "WHERE r.id = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, id);
            rs = psmt.executeQuery();
            if (rs.next()) {
                review = new ReviewDTO();
                review.setId(rs.getInt("id"));
                review.setTransactionId(rs.getInt("transactionId"));
                review.setTitle(rs.getString("title"));
                review.setDetail(rs.getString("detail"));
                review.setRating(rs.getInt("rating"));
                review.setOfile(rs.getString("ofile"));
                review.setSfile(rs.getString("sfile"));
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
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, id);
            result = psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return result;
    }

    // 자원 해제
    public void close() {
        try {
            if (rs != null) rs.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
