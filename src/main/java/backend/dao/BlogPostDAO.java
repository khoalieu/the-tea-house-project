package backend.dao;

import backend.db.DBConnect;
import backend.model.BlogPost;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class BlogPostDAO {

    public int countAllPublished() {
        String sql = "SELECT COUNT(*) " + "FROM blog_posts "+ "WHERE status = 'published'";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<BlogPost> getAllPublished(int page, int size) {
        List<BlogPost> list = new ArrayList<>();

        String sql = "SELECT id, title, slug, excerpt, featured_image, views_count, created_at "
                      +"FROM blog_posts "
                    + "WHERE status = 'published' "
                    + "ORDER BY created_at DESC "
                    + "LIMIT ? OFFSET ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, size);
            ps.setInt(2, (page - 1) * size);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapCard(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public int countPublishedByCategorySlug(String catSlug) {
        String sql = "SELECT COUNT(*) "
                    + "FROM blog_posts bp "
                    + "JOIN blog_categories bc ON bc.id = bp.category_id "
                    + "WHERE bp.status = 'published' " + "AND bc.slug = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, catSlug);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public List<BlogPost> getPublishedByCategorySlug(String catSlug, int page, int size) {
        List<BlogPost> list = new ArrayList<>();

        String sql = "SELECT bp.id, bp.title, bp.slug, bp.excerpt, bp.featured_image, bp.views_count, bp.created_at "
                    + "FROM blog_posts bp "
                   +  "JOIN blog_categories bc ON bc.id = bp.category_id "
                   + "WHERE bp.status = 'published' "   +    "AND bc.slug = ? "
                    + "ORDER BY bp.created_at DESC "
                     +"LIMIT ? OFFSET ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, catSlug);
            ps.setInt(2, size);
            ps.setInt(3, (page - 1) * size);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapCard(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countSearchPublished(String q) {
        String sql = "SELECT COUNT(*) "
                    + "FROM blog_posts "
                    + "WHERE status = 'published' "
                    + "AND (title LIKE ? OR excerpt LIKE ? OR content LIKE ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String kw = "%" + q + "%";
            ps.setString(1, kw);
            ps.setString(2, kw);
            ps.setString(3, kw);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<BlogPost> searchPublished(String q, int page, int size) {
        List<BlogPost> list = new ArrayList<>();

        String sql = "SELECT id, title, slug, excerpt, featured_image, views_count, created_at "
                    + "FROM blog_posts "
                    + "WHERE status = 'published' "
                    + "AND (title LIKE ? OR excerpt LIKE ? OR content LIKE ?) "
                    + "ORDER BY created_at DESC "
                    + "LIMIT ? OFFSET ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String kw = "%" + q + "%";
            ps.setString(1, kw);
            ps.setString(2, kw);
            ps.setString(3, kw);
            ps.setInt(4, size);
            ps.setInt(5, (page - 1) * size);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapCard(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<BlogPost> getRecentPublishedPosts(int limit) {
        List<BlogPost> list = new ArrayList<>();

        String sql = "SELECT id, title, slug, featured_image, created_at " +
                        "FROM blog_posts " +
                        "WHERE status = 'published' " +
                        "ORDER BY created_at DESC " +
                        "LIMIT ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BlogPost p = new BlogPost();
                    p.setId(rs.getInt("id"));
                    p.setTitle(rs.getString("title"));
                    p.setSlug(rs.getString("slug"));
                    p.setFeaturedImage(rs.getString("featured_image"));
                    Timestamp ts = rs.getTimestamp("created_at");
                    if (ts != null) p.setCreatedAt(ts.toLocalDateTime());
                    list.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    private BlogPost mapCard(ResultSet rs) throws Exception {
        BlogPost b = new BlogPost();
        b.setId(rs.getInt("id"));
        b.setTitle(rs.getString("title"));
        b.setSlug(rs.getString("slug"));
        b.setExcerpt(rs.getString("excerpt"));
        b.setFeaturedImage(rs.getString("featured_image"));
        b.setViewsCount(rs.getInt("views_count"));
        Timestamp ts = rs.getTimestamp("created_at");
        if (ts != null) b.setCreatedAt(ts.toLocalDateTime());
        return b;
    }
}
