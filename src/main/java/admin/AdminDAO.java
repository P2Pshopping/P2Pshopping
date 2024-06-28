package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.realm.JNDIRealm.User;

import com.example.model.Product;
import com.example.model.Transaction;

public class AdminDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/yourdatabase";
    private String jdbcUsername = "yourusername";
    private String jdbcPassword = "yourpassword";

    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM product";
    private static final String SELECT_ALL_TRANSACTIONS = "SELECT * FROM transactions";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                users.add(new User(id, username, name, email, phone, address));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String productName = rs.getString("productName");
                int categoryId = rs.getInt("categoryId");
                double price = rs.getDouble("price");
                String detail = rs.getString("detail");
                products.add(new Product(id, productName, categoryId, price, detail));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Transaction> getAllTransactions() {
        List<Transaction> transactions = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TRANSACTIONS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int productId = rs.getInt("productId");
                int buyerId = rs.getInt("buyerId");
                int sellerId = rs.getInt("sellerId");
                transactions.add(new Transaction(id, productId, buyerId, sellerId));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return transactions;
    }
}
