package backend.dao;

import backend.db.DBConnect;
import backend.model.Product;
import backend.model.Promotion;
import backend.model.enums.DiscountType;
import backend.model.enums.ProductStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PromotionDAO {


    public List<Promotion> getActivePromotions() {
        List<Promotion> list = new ArrayList<>();
        String sql = "SELECT * FROM promotions WHERE is_active = 1 AND start_date <= NOW() AND end_date >= NOW()";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Promotion p = new Promotion();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImageUrl(rs.getString("image_url"));
                p.setDiscountType(DiscountType.valueOf(rs.getString("discount_type")));
                p.setDiscountValue(rs.getDouble("discount_value"));
                p.setStartDate(rs.getTimestamp("start_date").toLocalDateTime());
                p.setEndDate(rs.getTimestamp("end_date").toLocalDateTime());
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductsByPromotionId(int promoId, int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.*, pr.discount_type, pr.discount_value " +
                "FROM products p " +
                "JOIN promotion_items pi ON p.id = pi.product_id " +
                "JOIN promotions pr ON pi.promotion_id = pr.id " +
                "WHERE pr.id = ? AND p.status = 'active'"+"LIMIT ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, promoId);
            ps.setInt(2, limit);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price")); // Giá gốc
                p.setImageUrl(rs.getString("image_url"));

                String type = rs.getString("discount_type");
                double value = rs.getDouble("discount_value");
                double originalPrice = rs.getDouble("price");
                double salePrice = originalPrice;

                if ("PERCENT".equals(type)) {
                    salePrice = originalPrice * (1 - value / 100.0);
                } else if ("FIXED_AMOUNT".equals(type)) {
                    salePrice = originalPrice - value;
                }

                if (salePrice < 0) salePrice = 0;

                p.setSalePrice(salePrice);

                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public String getPromotionName(int promoId) {
        String sql = "SELECT name FROM promotions WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, promoId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Chương Trình Khuyến Mãi";
    }
}