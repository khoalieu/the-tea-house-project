package backend.dao;

import backend.db.DBConnect;
import backend.model.User;
import backend.model.enums.UserRole;
import org.mindrot.jbcrypt.BCrypt; // Import thư viện BCrypt

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class UserDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // 1. Kiểm tra đăng nhập (LOGIC MỚI)
    public User checkLogin(String username, String password) {
        try {
            // Bước 1: Chỉ tìm user theo username (không so sánh pass trong SQL)
            String query = "SELECT * FROM users WHERE username = ? AND is_active = 1";
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Bước 2: Lấy mật khẩu đã mã hóa (hash) từ Database
                String storedHash = rs.getString("password_hash");

                // Bước 3: Dùng BCrypt để kiểm tra mật khẩu nhập vào có khớp với hash không
                boolean isVerified = BCrypt.checkpw(password, storedHash);

                if (isVerified) {
                    // Nếu đúng mật khẩu -> Tạo object User trả về
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));

                    // Xử lý Role (Enum) an toàn hơn
                    try {
                        user.setRole(UserRole.valueOf(rs.getString("role").toUpperCase()));
                    } catch (Exception e) {
                        user.setRole(UserRole.CUSTOMER); // Default nếu lỗi
                    }

                    return user;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu sai tên đăng nhập hoặc sai mật khẩu
    }

    // 2. Kiểm tra user tồn tại (Giữ nguyên)
    public boolean checkUserExist(String username, String email) {
        try {
            String query = "SELECT id FROM users WHERE username = ? OR email = ?";
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, email);
            rs = ps.executeQuery();
            if (rs.next()) return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 3. Đăng ký tài khoản (Dùng BCrypt để mã hóa)
    public void register(String username, String email, String password, String phone) {
        try {
            // Bước 1: Mã hóa mật khẩu bằng BCrypt
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

            // Bước 2: Lưu vào Database
            String query = "INSERT INTO users (username, email, password_hash, phone, role, is_active, created_at) VALUES (?, ?, ?, ?, 'customer', 1, NOW())";
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, hashedPassword); // Lưu chuỗi hash
            ps.setString(4, phone);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    // 4. Lấy map user theo postId (Dùng trong hiển thị comment)
    public Map<Integer, User> getUserMapByPostId(int postId) {
        Map<Integer, User> map = new HashMap<>();

        String sql = "SELECT DISTINCT u.id, u.first_name, u.last_name, u.avatar "
                + "FROM users u "
                + "JOIN blog_comments bc ON bc.user_id = u.id "
                + "WHERE bc.post_id = ?";

        try (Connection c = new DBConnect().getConnection();
             PreparedStatement p = c.prepareStatement(sql)) {

            p.setInt(1, postId);

            try (ResultSet r = p.executeQuery()) {
                while (r.next()) {
                    User u = new User();
                    u.setId(r.getInt("id"));
                    u.setFirstName(r.getString("first_name"));
                    u.setLastName(r.getString("last_name"));
                    u.setAvatar(r.getString("avatar"));
                    map.put(u.getId(), u);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return map;
    }


}