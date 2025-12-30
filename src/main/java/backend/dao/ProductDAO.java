package backend.dao;

import backend.db.DBConnect;
import backend.model.Product;
import backend.model.enums.ProductStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public ProductDAO() {

    }

    public List<Product> getProducts(Integer categoryId, String sort,Double maxPrice, int index, int size) {
        List<Product> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder("SELECT * FROM products WHERE status = 'active' ");
        if (categoryId != null) {
            sql.append(" AND category_id = ? ");
        }
        if (maxPrice != null) {
            sql.append(" AND (CASE WHEN sale_price > 0 THEN sale_price ELSE price END) <= ? ");
        }
        // Logic sắp xếp
        if (sort != null) {
            switch (sort) {
                case "price-asc": sql.append(" ORDER BY price ASC "); break;
                case "price-desc": sql.append(" ORDER BY price DESC "); break;
                case "name-asc": sql.append(" ORDER BY name ASC "); break;
                case "newest": sql.append(" ORDER BY created_at DESC "); break;
                default: sql.append(" ORDER BY created_at DESC ");
            }
        } else {
            sql.append(" ORDER BY created_at DESC ");
        }

        sql.append(" LIMIT ? OFFSET ?");


        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            int paramIndex = 1;
            if (categoryId != null) {
                ps.setInt(paramIndex++, categoryId);
            }
            if (maxPrice != null) ps.setDouble(paramIndex++, maxPrice);

            int offset = (index - 1) * size;
            ps.setInt(paramIndex++, size);
            ps.setInt(paramIndex++, offset);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setSlug(rs.getString("slug"));
                    p.setDescription(rs.getString("description"));
                    p.setShortDescription(rs.getString("short_description"));
                    p.setPrice(rs.getDouble("price"));
                    p.setSalePrice(rs.getDouble("sale_price"));
                    p.setSku(rs.getString("sku"));
                    p.setStockQuantity(rs.getInt("stock_quantity"));
                    p.setCategoryId(rs.getInt("category_id"));
                    p.setImageUrl(rs.getString("image_url"));
                    p.setBestseller(rs.getBoolean("is_bestseller"));
                    String statusStr = rs.getString("status");
                    if (statusStr != null) {
                        try {
                            p.setStatus(ProductStatus.valueOf(statusStr.toUpperCase()));
                        } catch (IllegalArgumentException e) {
                            p.setStatus(ProductStatus.ACTIVE);
                        }
                    }

                    p.setIngredients(rs.getString("ingredients"));
                    p.setUsageInstructions(rs.getString("usage_instructions"));

                    if (rs.getTimestamp("created_at") != null) {
                        p.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                    }
                    list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countProducts(Integer categoryId, Double maxPrice) throws SQLException {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM products WHERE status = 'active' ");
        if(categoryId != null){
            sql.append(" AND category_id = ? ");
        }
        if (maxPrice != null) {
            sql.append(" AND (CASE WHEN sale_price > 0 THEN sale_price ELSE price END) <= ? ");
        }
        try(Connection conn = DBConnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            int paramIndex = 1;
            if (categoryId != null) ps.setInt(paramIndex++, categoryId);
            if (maxPrice != null) ps.setDouble(paramIndex++, maxPrice);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
