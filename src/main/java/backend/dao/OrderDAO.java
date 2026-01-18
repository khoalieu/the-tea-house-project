package backend.dao;

import backend.db.DBConnect;
import backend.model.CartItem;
import backend.model.Order;
import backend.model.OrderItem;
import backend.model.Product; // Cần import Product
import backend.model.UserAddress;
import backend.model.enums.OrderStatus;
import backend.model.enums.PaymentStatus;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    // 1. Lấy danh sách đơn hàng theo UserID (Kèm địa chỉ và items)
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> list = new ArrayList<>();
        // Query lấy thông tin đơn hàng + địa chỉ (LEFT JOIN để tránh lỗi nếu địa chỉ bị xóa)
        String sql = "SELECT o.*, a.full_name, a.phone_number, a.street_address, a.ward, a.province " +
                "FROM orders o " +
                "LEFT JOIN user_addresses a ON o.shipping_address_id = a.id " +
                "WHERE o.user_id = ? " +
                "ORDER BY o.created_at DESC";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("user_id"));
                o.setShippingAddressId(rs.getInt("shipping_address_id"));
                o.setOrderNumber(rs.getString("order_number"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setShippingFee(rs.getDouble("shipping_fee"));
                o.setPaymentMethod(rs.getString("payment_method"));

                // --- Xử lý Date ---
                Timestamp ts = rs.getTimestamp("created_at");
                if (ts != null) {
                    o.setCreatedAt(Timestamp.valueOf(ts.toLocalDateTime()));
                }

                // --- Xử lý Enum Status (Database String -> Java Enum) ---
                try {
                    String statusStr = rs.getString("status");
                    if (statusStr != null) {
                        o.setStatus(OrderStatus.valueOf(statusStr.toUpperCase()));
                    } else {
                        o.setStatus(OrderStatus.PENDING);
                    }
                } catch (IllegalArgumentException e) {
                    o.setStatus(OrderStatus.PENDING);
                }

                // --- Xử lý Enum PaymentStatus ---
                try {
                    String payStatusStr = rs.getString("payment_status");
                    if (payStatusStr != null) {
                        o.setPaymentStatus(PaymentStatus.valueOf(payStatusStr.toUpperCase()));
                    } else {
                        o.setPaymentStatus(PaymentStatus.PENDING);
                    }
                } catch (IllegalArgumentException e) {
                    o.setPaymentStatus(PaymentStatus.PENDING);
                }

                // --- Xử lý hiển thị địa chỉ (Ghép chuỗi tạm vào Notes để hiển thị bên JSP) ---
                String fullName = rs.getString("full_name");
                if (fullName != null) {
                    String phone = rs.getString("phone_number");
                    String street = rs.getString("street_address");
                    String ward = rs.getString("ward");
                    String province = rs.getString("province");

                    String fullAddr = String.format("<strong>%s - %s</strong><br>%s, %s, %s",
                            fullName, phone, street, ward, province);
                    o.setNotes(fullAddr); // Lưu tạm chuỗi địa chỉ đã format vào note
                } else {
                    o.setNotes("Địa chỉ đã bị xóa hoặc không tồn tại.");
                }

                // --- Lấy danh sách sản phẩm con ---
                o.setItems(getOrderItems(o.getId()));

                list.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2. Tạo đơn hàng mới
    public int createOrder(Order order) {
        String sql = "INSERT INTO orders (user_id, shipping_address_id, order_number, status, total_amount, shipping_fee, payment_method, payment_status, notes, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, order.getUserId());

            if (order.getShippingAddressId() != null) {
                ps.setInt(2, order.getShippingAddressId());
            } else {
                ps.setNull(2, Types.INTEGER);
            }

            ps.setString(3, order.getOrderNumber());

            // Lưu Enum dưới dạng String thường
            ps.setString(4, OrderStatus.PENDING.name().toLowerCase());

            ps.setDouble(5, order.getTotalAmount());
            ps.setDouble(6, order.getShippingFee());
            ps.setString(7, order.getPaymentMethod());

            // Lưu Enum Payment
            ps.setString(8, PaymentStatus.PENDING.name().toLowerCase());

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
    // 3. Thêm chi tiết đơn hàng (Batch Insert)
    public void addOrderItems(int orderId, List<CartItem> items) {
        String sql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            for (CartItem item : items) {
                ps.setInt(1, orderId);
                ps.setInt(2, item.getProduct().getId());
                ps.setInt(3, item.getQuantity());

                // Logic lấy giá Sale nếu có
                double finalPrice = item.getProduct().getSalePrice() > 0 ?
                        item.getProduct().getSalePrice() :
                        item.getProduct().getPrice();

                ps.setDouble(4, finalPrice);
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 4. Hàm phụ trợ lấy Items cho phương thức getOrdersByUserId
    private List<OrderItem> getOrderItems(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        String sql = "SELECT oi.*, p.name, p.image_url " +
                "FROM order_items oi " +
                "JOIN products p ON oi.product_id = p.id " +
                "WHERE oi.order_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                OrderItem item = new OrderItem();
                item.setId(rs.getInt("id")); // Lấy ID của item nếu cần
                item.setOrderId(orderId);
                item.setProductId(rs.getInt("product_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));

                Product p = new Product();
                p.setId(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setImageUrl(rs.getString("image_url"));

                item.setProduct(p);
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }
    public Order getOrderById(int orderId) {
        Order o = null;
        String sql = "SELECT o.*, a.full_name, a.phone_number, a.street_address, a.ward, a.province " +
                "FROM orders o " +
                "LEFT JOIN user_addresses a ON o.shipping_address_id = a.id " +
                "WHERE o.id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                o = new Order();
                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("user_id"));
                o.setShippingAddressId(rs.getInt("shipping_address_id"));
                o.setOrderNumber(rs.getString("order_number"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setShippingFee(rs.getDouble("shipping_fee"));
                o.setPaymentMethod(rs.getString("payment_method"));
                Timestamp ts = rs.getTimestamp("created_at");
                if (ts != null) {
                    o.setCreatedAt(Timestamp.valueOf(ts.toLocalDateTime()));
                }
                try {
                    String statusStr = rs.getString("status");
                    o.setStatus(statusStr != null ? OrderStatus.valueOf(statusStr.toUpperCase()) : OrderStatus.PENDING);
                } catch (Exception e) { o.setStatus(OrderStatus.PENDING); }
                try {
                    String payStatusStr = rs.getString("payment_status");
                    o.setPaymentStatus(payStatusStr != null ? PaymentStatus.valueOf(payStatusStr.toUpperCase()) : PaymentStatus.PENDING);
                } catch (Exception e) { o.setPaymentStatus(PaymentStatus.PENDING); }
                String fullName = rs.getString("full_name");
                if (fullName != null) {
                    String phone = rs.getString("phone_number");
                    String street = rs.getString("street_address");
                    String ward = rs.getString("ward");
                    String province = rs.getString("province");
                    String fullAddr = String.format("%s - %s<br>%s, %s, %s",
                            fullName, phone, street, ward, province);
                    o.setNotes(fullAddr);
                } else {
                    o.setNotes(rs.getString("notes"));
                }
                o.setItems(getOrderItems(o.getId()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return o;
    }
}