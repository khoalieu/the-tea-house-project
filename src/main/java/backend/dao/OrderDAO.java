package backend.dao;
import backend.db.DBConnect;
import backend.model.Order;
import backend.model.enums.OrderStatus;
import backend.model.enums.PaymentStatus;
import java.sql.*;
import java.util.*;
public class OrderDAO {
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY created_at DESC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setOrderNumber(rs.getString("order_number"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                if (rs.getTimestamp("created_at") != null)
                    o.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());

                try {
                    o.setStatus(OrderStatus.valueOf(rs.getString("status").toUpperCase()));
                } catch (Exception e) { o.setStatus(OrderStatus.PENDING); }

                try {
                    o.setPaymentStatus(PaymentStatus.valueOf(rs.getString("payment_status").toUpperCase()));
                } catch (Exception e) { o.setPaymentStatus(PaymentStatus.PENDING); }

                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
