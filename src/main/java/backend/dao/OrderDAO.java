package backend.dao;
import backend.db.DBConnect;
import backend.model.CartItem;
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
    public int createOrder(Order order) {
        String sql = "INSERT INTO orders (user_id, shipping_address_id, order_number, status, total_amount, shipping_fee, payment_method, payment_status, notes, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, order.getUserId());
            // Nếu shippingAddressId là 0 hoặc null thì set Null (tùy logic, ở đây mình set int)
            if (order.getShippingAddressId() != null) ps.setInt(2, order.getShippingAddressId());
            else ps.setNull(2, Types.INTEGER);

            ps.setString(3, order.getOrderNumber());
            ps.setString(4, "pending"); // Default status
            ps.setDouble(5, order.getTotalAmount());
            ps.setDouble(6, order.getShippingFee());
            ps.setString(7, order.getPaymentMethod());
            ps.setString(8, "pending"); // Default payment status
            ps.setString(9, order.getNotes());

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1); // Trả về ID đơn hàng vừa tạo
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void addOrderItems(int orderId, List<CartItem> items) {
        String sql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Dùng Batch Update để insert nhiều dòng 1 lúc cho nhanh
            for (CartItem item : items) {
                ps.setInt(1, orderId);
                ps.setInt(2, item.getProduct().getId());
                ps.setInt(3, item.getQuantity());
                // Lưu giá tại thời điểm mua (salePrice nếu có, ngược lại lấy price)
                double finalPrice = item.getProduct().getSalePrice() > 0 ? item.getProduct().getSalePrice() : item.getProduct().getPrice();
                ps.setDouble(4, finalPrice);
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
