package admin;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class CategoryDAO extends JDBConnect {
    public CategoryDAO(ServletContext application) {
        super(application);
    }

    // 모든 카테고리를 가져오는 메서드
    public List<CategoryDTO> getAllCategories() {
        List<CategoryDTO> categories = new ArrayList<>();
        String query = "SELECT * FROM category";

        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                CategoryDTO category = new CategoryDTO();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setUrl(rs.getString("url"));

                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

    // 카테고리 추가 메서드
    public void addCategory(CategoryDTO category) {
        String query = "INSERT INTO category (name, url) VALUES (?, ?)";

        try {
            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, category.getName());
            psmt.setString(2, category.getUrl());
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 카테고리 수정 메서드
    public void updateCategory(CategoryDTO category) {
        String query = "UPDATE category SET name = ?, url = ? WHERE id = ?";

        try {
            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, category.getName());
            psmt.setString(2, category.getUrl());
            psmt.setInt(3, category.getId());
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 카테고리 삭제 메서드
    public void deleteCategory(int id) {
        String query = "DELETE FROM category WHERE id = ?";

        try {
            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setInt(1, id);
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
