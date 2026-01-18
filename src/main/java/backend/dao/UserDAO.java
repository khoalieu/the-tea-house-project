package backend.dao;

import backend.db.DBConnect;
import backend.model.User;
import backend.model.enums.UserGender;
import backend.model.enums.UserRole;
import org.mindrot.jbcrypt.BCrypt; // Import thư viện BCrypt

import java.sql.*;
import java.util.*;

public class UserDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // 1. Kiểm tra đăng nhập (LOGIC MỚI)
    public User checkLogin(String username, String password) {
        try {
            String query = "SELECT * FROM users WHERE username = ? AND is_active = 1";
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                String storedHash = rs.getString("password_hash");
                boolean isVerified = BCrypt.checkpw(password, storedHash);

                if (isVerified) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setPhone(rs.getString("phone"));
                    java.sql.Timestamp ts = rs.getTimestamp("dateOfBirth"); // Lưu ý: tên cột trong DB của bạn là 'dateOfBirth' (theo file SQL bạn gửi)
                    if (ts != null) {
                        user.setDateOfBirth(ts.toLocalDateTime());
                    }
                    String genderStr = rs.getString("gender");
                    if (genderStr != null) {
                        try {
                            // Database lưu chữ thường ('male'), Enum Java chữ hoa ('MALE') -> Cần toUpperCase()
                            user.setGender(UserGender.valueOf(genderStr.toUpperCase()));
                        } catch (IllegalArgumentException e) {
                            user.setGender(UserGender.OTHER);
                        }
                    }
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
        return null;
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

    public boolean updateProfile(String firstname, String lastname, String phone, String dob, String gender, int userId) throws SQLException {
        // 1. Sửa câu Query: Xóa dấu phẩy trước WHERE và thêm phone
        String query = "UPDATE users SET first_name = ?, last_name = ?, phone = ?, dateOfBirth = ?, gender = ? WHERE id = ?";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, phone);

            if (dob != null && !dob.trim().isEmpty()) {
                ps.setDate(4, java.sql.Date.valueOf(dob));
            } else {
                ps.setNull(4, java.sql.Types.DATE);
            }
            if (gender != null) {
                ps.setString(5, gender.toLowerCase());
            } else {
                ps.setString(5, "other");
            }
            ps.setInt(6, userId);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            System.err.println("Lỗi updateProfile: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean changePassword(int userId, String newPassword) {
        // Mã hóa mật khẩu mới trước khi lưu
        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt(12));
        String query = "UPDATE users SET password_hash = ? WHERE id = ?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, hashedPassword);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkPassword(int userId, String oldPassword) {
        String query = "SELECT password_hash FROM users WHERE id = ?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                String currentHash = rs.getString("password_hash");
                return BCrypt.checkpw(oldPassword, currentHash);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<User> getAllAdminUsers() {
        List<User> list = new ArrayList<>();
        String sql =
                "SELECT id, username, first_name, last_name , email " +
                        "FROM users " +
                        "WHERE role IN ('admin','editor') " +
                        "ORDER BY username";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setFirstName(rs.getString("first_name"));
                u.setLastName(rs.getString("last_name"));
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public User getById(int id) {
        String sql = "SELECT id, username, email, first_name, last_name, avatar, role FROM users WHERE id=? LIMIT 1";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return map(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Map<Integer, User> getMapByIds(Collection<Integer> ids) {
        Map<Integer, User> map = new HashMap<>();
        if (ids == null || ids.isEmpty()) return map;

        StringJoiner sj = new StringJoiner(",", "(", ")");
        for (int i = 0; i < ids.size(); i++) sj.add("?");

        String sql = "SELECT id, username, email, first_name, last_name, avatar, role FROM users WHERE id IN " + sj;
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            int idx = 1;
            for (Integer id : ids) ps.setInt(idx++, id);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    User u = map(rs);
                    map.put(u.getId(), u);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    private User map(ResultSet rs) throws Exception {
        User u = new User();
        u.setId(rs.getInt("id"));
        u.setUsername(rs.getString("username"));
        u.setEmail(rs.getString("email"));
        u.setFirstName(rs.getString("first_name"));
        u.setLastName(rs.getString("last_name"));
        u.setAvatar(rs.getString("avatar"));

        String role = rs.getString("role");
        if (role != null) u.setRole(UserRole.valueOf(role.trim().toUpperCase()));

        return u;
    }

    // tim user id trong email
    public Integer findUserIdByEmail(String email) {
        String sql = "SELECT id FROM users WHERE email = ? LIMIT 1";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}