package sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DBConnPool;

public class SellDAO {
    private Connection con;
    private PreparedStatement psmt;
    private ResultSet rs;

    public SellDAO() {
        DBConnPool dbPool = new DBConnPool();
        this.con = dbPool.con;
    }

    public void saveProduct(String productName, int categoryId, int subCategoryId, int price, String detail,
            String photo1, String photo2, String photo3, String photo4, int writerId, String roadAddrPart1,
            String addrDetail, String latitude, String longitude) throws SQLException {
        String sql = "INSERT INTO product (id, productName, categoryId, subCategoryId, price, detail, "
                + "imgUrl_1, imgUrl_2, imgUrl_3, imgUrl_4, "
                + "writerId, roadAddrPart1, addrDetail, latitude, longitude) "
                + "VALUES (seq_board_num.nextval,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, productName);
            psmt.setInt(2, categoryId);
            psmt.setInt(3, subCategoryId);
            psmt.setInt(4, price);
            psmt.setString(5, detail);
            psmt.setString(6, photo1);
            psmt.setString(7, photo2);
            psmt.setString(8, photo3);
            psmt.setString(9, photo4);
            psmt.setInt(10, writerId);
            psmt.setString(11, roadAddrPart1);
            psmt.setString(12, addrDetail);
            psmt.setString(13, latitude);
            psmt.setString(14, longitude);
            psmt.executeUpdate();
        } finally {
            closeResources();
        }
    }

    public int getCategoryId(String categoryName) throws SQLException {
        String sql = "SELECT id FROM category WHERE name = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, categoryName);
            rs = psmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            } else {
                throw new SQLException("Category not found: " + categoryName);
            }
        } finally {
            closeResultSetAndStatement();
        }
    }

    public int getSubcategoryId(String subCategoryName) throws SQLException {
        String sql = "SELECT id FROM subCategory WHERE name = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, subCategoryName);
            rs = psmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            } else {
                throw new SQLException("Subcategory not found: " + subCategoryName);
            }
        } finally {
            closeResultSetAndStatement();
        }
    }

    public int getUserId(String email) throws SQLException {
        String sql = "SELECT id FROM users WHERE email = ?";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, email);
            rs = psmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            } else {
                throw new SQLException("User not found: " + email);
            }
        } finally {
            closeResultSetAndStatement();
        }
    }

    private void closeResultSetAndStatement() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (psmt != null) {
                psmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void closeResources() {
        closeResultSetAndStatement();
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
