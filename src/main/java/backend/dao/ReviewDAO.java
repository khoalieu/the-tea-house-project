package backend.dao;

import backend.db.DBConnect;
import backend.dto.ReviewDTO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
    public List<ReviewDTO> getReviewsByProductId(int productId) {
        List<ReviewDTO> list = new ArrayList<>();
        String sql = "SELECT r.*, u.username, u.avatar " +
                "FROM product_reviews r " +
                "JOIN users u ON r.user_id = u.id " +
                "WHERE r.product_id = ? " +
                "ORDER BY r.created_at DESC";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                String avatar = rs.getString("avatar");
                if (avatar == null || avatar.isEmpty()) avatar = "assets/images/user-default.png";

                ReviewDTO review = new ReviewDTO(
                        rs.getString("username"),
                        avatar,
                        rs.getInt("rating"),
                        rs.getString("comment_text"),
                        rs.getTimestamp("created_at").toLocalDateTime()
                );
                list.add(review);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}