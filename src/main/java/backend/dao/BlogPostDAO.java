package backend.dao;

import backend.db.DBConnect;
import backend.model.BlogPost;
import backend.model.User;
import backend.model.enums.BlogStatus;

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
    // blog detail
    public BlogPost getPublishedBySlug(String slug) {
        String sql = "SELECT id, title, slug, excerpt, content, featured_image, " +
                "author_id, category_id, status, views_count, meta_title, meta_description, created_at " +
                "FROM blog_posts " +
                "WHERE status = 'published' AND slug = ? " +
                "LIMIT 1";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, slug);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    BlogPost b = new BlogPost();
                    b.setId(rs.getInt("id"));
                    b.setTitle(rs.getString("title"));
                    b.setSlug(rs.getString("slug"));
                    b.setExcerpt(rs.getString("excerpt"));
                    b.setContent(rs.getString("content"));
                    b.setFeaturedImage(rs.getString("featured_image"));
                    b.setAuthorId(rs.getInt("author_id"));

                    int catId = rs.getInt("category_id");
                    b.setCategoryId(rs.wasNull() ? null : catId);

                    b.setViewsCount(rs.getInt("views_count"));
                    b.setMetaTitle(rs.getString("meta_title"));
                    b.setMetaDescription(rs.getString("meta_description"));

                    String st = rs.getString("status");
                    if (st != null) b.setStatus(BlogStatus.valueOf(st.toUpperCase()));

                    Timestamp ts = rs.getTimestamp("created_at");
                    if (ts != null) b.setCreatedAt(ts.toLocalDateTime());

                    return b;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    // view
    public void incrementViews(int postId) {
        String sql = "UPDATE blog_posts " +
                "SET views_count = IFNULL(views_count, 0) + 1 " +
                "WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, postId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
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

    public int countPostsForAdmin(String q, Integer categoryId, BlogStatus status, Integer authorId) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM blog_posts bp WHERE 1=1");

        boolean hasQ = (q != null && !q.isEmpty());
        if (hasQ) {
            sql.append(" AND (bp.title LIKE ? OR bp.slug LIKE ? OR IFNULL(bp.excerpt,'') LIKE ? OR IFNULL(bp.content,'') LIKE ?)");
        }
        if (categoryId != null) sql.append(" AND bp.category_id = ?");
        if (status != null)     sql.append(" AND bp.status = ?");
        if (authorId != null)   sql.append(" AND bp.author_id = ?");

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            int idx = 1;

            if (hasQ) {
                String kw = "%" + q + "%";
                ps.setString(idx++, kw);
                ps.setString(idx++, kw);
                ps.setString(idx++, kw);
                ps.setString(idx++, kw);
            }

            if (categoryId != null) ps.setInt(idx++, categoryId);
            if (status != null)     ps.setString(idx++, status.name().toLowerCase());
            if (authorId != null)   ps.setInt(idx++, authorId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public List<BlogPost> getPostsForAdmin(String q, Integer categoryId, BlogStatus status, Integer authorId, String sort, int page, int size) {
        List<BlogPost> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT bp.*, u.username, u.email, u.first_name, u.last_name, u.avatar " +
                        "FROM blog_posts bp " +
                        "LEFT JOIN users u ON u.id = bp.author_id " +
                        "WHERE 1=1"
        );
        boolean hasQ = (q != null && !q.isEmpty());
        if (hasQ) {
            sql.append(" AND (bp.title LIKE ? OR bp.slug LIKE ? OR IFNULL(bp.excerpt,'') LIKE ? OR IFNULL(bp.content,'') LIKE ?)");
        }
        if (categoryId != null) sql.append(" AND bp.category_id = ?");
        if (status != null)     sql.append(" AND bp.status = ?");
        if (authorId != null)   sql.append(" AND bp.author_id = ?");

        if (sort == null) sort = "date_desc";
        switch (sort) {
            case "title_asc":  sql.append(" ORDER BY bp.title ASC"); break;
            case "title_desc": sql.append(" ORDER BY bp.title DESC"); break;
            case "views_asc":  sql.append(" ORDER BY bp.views_count ASC"); break;
            case "views_desc": sql.append(" ORDER BY bp.views_count DESC"); break;
            case "date_asc":   sql.append(" ORDER BY bp.created_at ASC"); break;
            case "date_desc":
            default:           sql.append(" ORDER BY bp.created_at DESC"); break;
        }

        sql.append(" LIMIT ? OFFSET ?");

        if (page < 1) page = 1;
        int offset = (page - 1) * size;

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            int idx = 1;

            if (hasQ) {
                String kw = "%" + q + "%";
                ps.setString(idx++, kw);
                ps.setString(idx++, kw);
                ps.setString(idx++, kw);
                ps.setString(idx++, kw);
            }

            if (categoryId != null) ps.setInt(idx++, categoryId);
            if (status != null)     ps.setString(idx++, status.name().toLowerCase());
            if (authorId != null)   ps.setInt(idx++, authorId);

            ps.setInt(idx++, size);
            ps.setInt(idx++, offset);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BlogPost p = new BlogPost();
                    p.setId(rs.getInt("id"));
                    p.setTitle(rs.getString("title"));
                    p.setSlug(rs.getString("slug"));
                    p.setExcerpt(rs.getString("excerpt"));

                    String st = rs.getString("status");
                    if (st != null) p.setStatus(BlogStatus.valueOf(st.toUpperCase()));

                    Integer aid = (Integer) rs.getObject("author_id");
                    p.setAuthorId(aid);

                    if (aid != null) {
                        User au = new User();
                        au.setId(aid);
                        au.setUsername(rs.getString("username"));
                        au.setEmail(rs.getString("email"));
                        au.setFirstName(rs.getString("first_name"));
                        au.setLastName(rs.getString("last_name"));
                        au.setAvatar(rs.getString("avatar"));
                        p.setAuthor(au);
                    }

                    int catId = rs.getInt("category_id");
                    p.setCategoryId(rs.wasNull() ? null : catId);

                    p.setViewsCount(rs.getInt("views_count"));
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
}

