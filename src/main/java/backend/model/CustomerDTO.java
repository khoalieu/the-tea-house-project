package backend.model;

import java.time.LocalDateTime;

public class CustomerDTO {
    private User user;            // Chứa thông tin cơ bản (Tên, Email, SĐT...)
    private String fullAddress;   // Địa chỉ ghép từ bảng address
    private int totalOrders;      // Tổng số đơn hàng
    private double totalSpent;    // Tổng chi tiêu
    private LocalDateTime lastPurchase; // Ngày mua gần nhất

    public CustomerDTO() {}

    public CustomerDTO(User user, String fullAddress, int totalOrders, double totalSpent, LocalDateTime lastPurchase) {
        this.user = user;
        this.fullAddress = fullAddress;
        this.totalOrders = totalOrders;
        this.totalSpent = totalSpent;
        this.lastPurchase = lastPurchase;
    }

    // Getters and Setters
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public String getFullAddress() { return fullAddress; }
    public void setFullAddress(String fullAddress) { this.fullAddress = fullAddress; }

    public int getTotalOrders() { return totalOrders; }
    public void setTotalOrders(int totalOrders) { this.totalOrders = totalOrders; }

    public double getTotalSpent() { return totalSpent; }
    public void setTotalSpent(double totalSpent) { this.totalSpent = totalSpent; }

    public LocalDateTime getLastPurchase() { return lastPurchase; }
    public void setLastPurchase(LocalDateTime lastPurchase) { this.lastPurchase = lastPurchase; }

    // Helper để hiển thị định dạng tiền tệ hoặc xử lý null address
    public String getDisplayAddress() {
        return (fullAddress == null || fullAddress.isEmpty()) ? "Chưa cập nhật" : fullAddress;
    }
}