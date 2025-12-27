package backend.dao;
import backend.db.DBConnect;
import backend.model.BlogPost;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BlogPostDAO {

    public BlogPostDAO() {}

    private boolean hasQ(String q) {
        return q != null && !q.trim().isEmpty();
    }
        // blog + search + pagination
    public List<BlogPost> getBlogs(String q, int page, int size) {
        List<BlogPost> list = new ArrayList<>();

        String sql = "SELECT * FROM blog_posts " +
                "WHERE status = 'published' ";
        if (hasQ(q)) {
            sql += "AND (title LIKE ? OR excerpt LIKE ? OR content LIKE ?) ";
        }
        sql += "ORDER BY created_at DESC LIMIT ? OFFSET ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            int index = 1;

            if (hasQ(q)) {
                String kw = "%" + q.trim() + "%";
                ps.setString(index++, kw);
                ps.setString(index++, kw);
                ps.setString(index++, kw);
            }

            ps.setInt(index++, size);
            ps.setInt(index++, (page - 1) * size);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BlogPost b = new BlogPost();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setSlug(rs.getString("slug"));
                b.setExcerpt(rs.getString("excerpt"));
                b.setFeaturedImage(rs.getString("featured_image"));
                b.setViewsCount(rs.getInt("views_count"));
                b.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public int countBlogs(String q) {

        String sql = "SELECT COUNT(*) FROM blog_posts " +
                "WHERE status = 'published' ";
        if (hasQ(q)) {
            sql += "AND (title LIKE ? OR excerpt LIKE ? OR content LIKE ?) ";
        }

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (hasQ(q)) {
                String kw = "%" + q.trim() + "%";
                ps.setString(1, kw);
                ps.setString(2, kw);
                ps.setString(3, kw);
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}
