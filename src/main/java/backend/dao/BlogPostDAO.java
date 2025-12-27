package backend.dao;

import backend.db.DBConnect;
import backend.model.BlogPost;
import backend.model.enums.BlogStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BlogPostDAO {

    // Lấy blog published, phân trang
    public List<BlogPost> getPublishedBlogs(int page, int pageSize) {
        List<BlogPost> list = new ArrayList<>();

        int offset = (page - 1) * pageSize;

        String sql =
                "SELECT * FROM blog_posts " +
                        "WHERE status = 'published' " +
                        "ORDER BY created_at DESC " +
                        "LIMIT ? OFFSET ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, pageSize);
            ps.setInt(2, offset);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BlogPost p = new BlogPost();
                    p.setId(rs.getInt("id"));
                    p.setTitle(rs.getString("title"));
                    p.setSlug(rs.getString("slug"));
                    p.setExcerpt(rs.getString("excerpt"));
                    p.setFeaturedImage(rs.getString("featured_image"));
                    p.setViewsCount(rs.getInt("views_count"));

                    if (rs.getTimestamp("created_at") != null) {
                        p.setCreatedAt(
                                rs.getTimestamp("created_at").toLocalDateTime()
                        );
                    }

                    list.add(p);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Đếm tổng blog published
    public int countPublishedBlogs() {
        String sql = "SELECT COUNT(*) FROM blog_posts WHERE status = 'published'";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
