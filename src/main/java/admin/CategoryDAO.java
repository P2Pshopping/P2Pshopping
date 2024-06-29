package admin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;
import admin.CategoryDTO;
import jakarta.servlet.ServletContext;

public class CategoryDAO extends JDBConnect {
    public CategoryDAO(ServletContext application) {
        super(application);
    }

    // 모든 카테고리를 가져오는 메서드
    public List<CategoryDTO> getAllCategories() {
        List<CategoryDTO> categories = new ArrayList<>();
        String query = "SELECT * FROM category";
        
        System.out.println("DB 연결 시도 중..."); // 디버그 메시지

        try {
            Statement stmt = con.createStatement();
            System.out.println("DB 연결 성공"); // 디버그 메시지

            ResultSet rs = stmt.executeQuery(query);
            System.out.println("쿼리 실행: " + query); // 디버그 메시지

            while (rs.next()) {
                CategoryDTO category = new CategoryDTO();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setUrl(rs.getString("url"));
                
                categories.add(category);
            }
            System.out.println("카테고리 목록 불러오기 성공"); // 디버그 메시지
        } catch (SQLException e) {
            System.out.println("DB 연결 실패 또는 쿼리 실행 오류"); // 디버그 메시지
            e.printStackTrace();
        }

        return categories;
    }

    // 카테고리 추가/수정/삭제 메서드들...
}
