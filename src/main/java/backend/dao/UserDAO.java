package backend.dao;

import backend.db.DBConnect;
import backend.model.User;
import backend.model.enums.UserRole; // Đảm bảo bạn đã có Enum này
import backend.util.BCryptUtils; // Import class mới tạo

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    // 1. Cập nhật hàm Đăng Ký (Register)
    public boolean register(User user) {
        String sql = "INSERT INTO users (username, email, password_hash, first_name, last_name, phone, role, is_active) VALUES (?, ?, ?, ?, ?, ?, 'customer', 1)";

        try (Connection conn = DBConnect.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());

            // Dùng BCrypt để mã hóa
            String hashedPassword = BCryptUtils.hashPassword(user.getPasswordHash());
            ps.setString(3, hashedPassword);

            ps.setString(4, user.getFirstName());
            ps.setString(5, user.getLastName());
            ps.setString(6, user.getPhone());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 2. Cập nhật hàm Đăng Nhập (CheckLogin)
    public User checkLogin(String username, String rawPassword) {
        User user = null;

        // CHỈ tìm bằng username, KHÔNG so sánh password trong SQL
        String query = "SELECT * FROM users WHERE username = ? AND is_active = 1";

        try (Connection conn = DBConnect.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Lấy mật khẩu đã mã hóa trong DB ra
                String dbHash = rs.getString("password_hash");

                // Dùng BCrypt kiểm tra xem pass nhập vào có khớp với hash không
                if (BCryptUtils.checkPassword(rawPassword, dbHash)) {
                    // Nếu khớp thì mới tạo đối tượng User trả về
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setAvatar(rs.getString("avatar"));

                    String roleStr = rs.getString("role");
                    if (roleStr != null) user.setRole(UserRole.valueOf(roleStr.toUpperCase()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}