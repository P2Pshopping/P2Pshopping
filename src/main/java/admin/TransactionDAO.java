package admin;

import java.sql.ResultSet;
import java.sql.Statement;

import common.JDBConnect;

public class TransactionDAO extends JDBConnect {
    // 오늘 거래 수 가져오기
    public int getTodayTransactionCount() {
        int count = 0;
        String query = "SELECT COUNT(*) FROM transactions WHERE TRUNC(transaction_date) = TRUNC(SYSDATE)";
        try (Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {
//            pstmt = con.prepareStatement(query);
//            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    // 이번 주 거래 수 가져오기
    public int getWeekTransactionCount() {
        int count = 0;
        String query = "SELECT COUNT(*) FROM transactions WHERE TRUNC(transaction_date) BETWEEN TRUNC(NEXT_DAY(SYSDATE - 7, 1)) AND TRUNC(SYSDATE)";
        try (Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {
//            pstmt = con.prepareStatement(query);
//            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    // 이번 달 거래 수 가져오기
    public int getMonthTransactionCount() {
        int count = 0;
        String query = "SELECT COUNT(*) FROM transactions WHERE TRUNC(transaction_date, 'MM') = TRUNC(SYSDATE, 'MM')";
        try (Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {
//            pstmt = con.prepareStatement(query);
//            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
