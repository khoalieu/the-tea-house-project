package backend.dao;

import backend.db.DBConnect;
import backend.model.BlogCategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class BlogCategoryDAO {

    public List<BlogCategory> getActiveCategories() {
        List<BlogCategory> list = new ArrayList<>();
        String sql = "SELECT * " +"FROM blog_categories "
        +"WHERE is_active = 1 "
        +"ORDER BY name ASC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                BlogCategory c = new BlogCategory();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setSlug(rs.getString("slug"));
                c.setDescription(rs.getString("description"));
                c.setIsActive(rs.getBoolean("is_active"));
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    // map: category_id -> count category published
    public Map<Integer, Integer> getPublishedCountMap() {
        Map<Integer, Integer> map = new HashMap<>();

        String sql =    "SELECT category_id, COUNT(*) AS cnt " +
                        "FROM blog_posts " +
                        "WHERE status = 'published' AND category_id IS NOT NULL " +
                        "GROUP BY category_id";


        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                map.put(rs.getInt("category_id"), rs.getInt("cnt"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
}
