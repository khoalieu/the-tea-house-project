package backend.dao;

import backend.db.DBConnect;
import backend.model.Product;
import backend.model.enums.ProductStatus;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public ProductDAO() {

    }

    public List<Product> getProducts(Integer categoryId, Integer promotionId, String sort, Double maxPrice, int index, int size) {
        List<Product> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder("SELECT * FROM products WHERE status = 'active' ");
        if (categoryId != null) {
            sql.append(" AND category_id = ? ");
        }
        if (maxPrice != null) {
            sql.append(" AND (CASE WHEN sale_price > 0 THEN sale_price ELSE price END) <= ? ");
        }
        if (promotionId != null) sql.append(" AND pi.promotion_id = ? ");

        if (sort != null) {
            switch (sort) {
                case "price-asc":
                    sql.append(" ORDER BY price ASC ");
                    break;
                case "price-desc":
                    sql.append(" ORDER BY price DESC ");
                    break;
                case "name-asc":
                    sql.append(" ORDER BY name ASC ");
                    break;
                case "newest":
                    sql.append(" ORDER BY created_at DESC ");
                    break;
                default:
                    sql.append(" ORDER BY created_at DESC ");
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

    public int countProducts(Integer categoryId, Integer promotionId, Double maxPrice) throws SQLException {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM products WHERE status = 'active' ");
        if (categoryId != null) {
            sql.append(" AND category_id = ? ");
        }
        if (maxPrice != null) {
            sql.append(" AND (CASE WHEN sale_price > 0 THEN sale_price ELSE price END) <= ? ");
        }
        if (promotionId != null) sql.append(" AND pi.promotion_id = ? ");
        try (Connection conn = DBConnect.getConnection();
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

    public Product getProductById(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
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
                return p;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<Product> getRelatedProducts(int categoryId, int currentProductId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products WHERE category_id = ? AND id != ? AND status = 'active' ORDER BY RAND() LIMIT 4";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            ps.setInt(2, currentProductId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setSalePrice(rs.getDouble("sale_price"));
                p.setImageUrl(rs.getString("image_url"));
                p.setSlug(rs.getString("slug"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public int insertProduct(Product p) {
        String sql = "INSERT INTO products (name, slug, description, short_description, price, sale_price, " +
                "sku, stock_quantity, category_id, image_url, is_bestseller, status, " +
                "ingredients, usage_instructions, created_at) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, p.getName());
            ps.setString(2, p.getSlug());
            ps.setString(3, p.getDescription());
            ps.setString(4, p.getShortDescription());
            ps.setDouble(5, p.getPrice());
            ps.setDouble(6, p.getSalePrice());
            ps.setString(7, p.getSku());
            ps.setInt(8, p.getStockQuantity());

            if (p.getCategoryId() != null) ps.setInt(9, p.getCategoryId());
            else ps.setNull(9, java.sql.Types.INTEGER);

            ps.setString(10, p.getImageUrl());
            ps.setBoolean(11, p.isBestseller());
            ps.setString(12, p.getStatus() != null ? p.getStatus().name().toLowerCase() : "active");
            ps.setString(13, p.getIngredients());
            ps.setString(14, p.getUsageInstructions());
            ps.setTimestamp(15, Timestamp.valueOf(p.getCreatedAt()));

            int rows = ps.executeUpdate();
            if (rows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) return rs.getInt(1); // Trả về ID mới
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    public void insertProductImage(int productId, String imageUrl, String altText, int sortOrder) {
        String sql = "INSERT INTO product_images (product_id, image_url, alt_text, sort_order) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            ps.setString(2, imageUrl);
            ps.setString(3, altText);
            ps.setInt(4, sortOrder);    // Lưu thứ tự sắp xếp

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void decreaseStock(int productId, int quantityPurchased) {
        String sql = "UPDATE products SET stock_quantity = stock_quantity - ? WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, quantityPurchased);
            ps.setInt(2, productId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

