package backend.dao;

import backend.db.DBConnect;
import backend.model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.*;

public class CategoryDAO {

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM categories WHERE is_active = 1"; //lấy danh mục đang hoạt động

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Map<Integer, String> getActiveCategories() {
        Map<Integer, String> map = new LinkedHashMap<>();
        String sql = "SELECT id, name FROM categories WHERE is_active = 1 ORDER BY parent_id IS NULL DESC, parent_id ASC, name ASC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) map.put(rs.getInt("id"), rs.getString("name"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
}