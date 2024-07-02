package admin;

import java.sql.ResultSet;
import java.sql.Statement;

import common.JDBConnect;

public class SiteTrafficDAO extends JDBConnect {
    // 방문 기록 저장하기
	 // 방문 기록 저장하기
    public void saveVisit(String pageUrl, int userId) {
        String query;
        if (userId == 0) {
            query = "INSERT INTO site_traffic (page_url, visit_date) VALUES ('" + pageUrl + "', CURRENT_TIMESTAMP)";
        } else {
            query = "INSERT INTO site_traffic (page_url, visit_date, user_id) VALUES ('" + pageUrl + "', CURRENT_TIMESTAMP, " + userId + ")";
        }
        try (Statement stmt = con.createStatement()) {
            stmt.executeUpdate(query);
            int result = stmt.executeUpdate(query);
            System.out.println("Visit recorded: " + result + " rows affected.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 전체 방문 수 가져오기
    public int getTotalVisits() {
        int count = 0;
        String query = "SELECT COUNT(*) FROM site_traffic";
        try (Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    // 특정 페이지 방문 수 가져오기
    public int getPageVisits(String pageUrl) {
        int count = 0;
        String query = "SELECT COUNT(*) FROM site_traffic WHERE page_url = '" + pageUrl + "'";
        try (Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}

