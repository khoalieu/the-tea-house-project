package backend.model;

import backend.model.enums.OrderStatus;
import backend.model.enums.PaymentStatus;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Order {
    private Integer id;
    private Integer userId;
    private Integer shippingAddressId;
    private String orderNumber;
    private OrderStatus status;
    private BigDecimal totalAmount;
    private BigDecimal shippingFee;
    private String paymentMethod;
    private PaymentStatus paymentStatus;
    private String notes;
    private LocalDateTime createdAt;

    public Order() {}

    public Order(Integer id, Integer userId, Integer shippingAddressId, String orderNumber,
                 OrderStatus status, BigDecimal totalAmount, BigDecimal shippingFee,
                 String paymentMethod, PaymentStatus paymentStatus,
                 String notes, LocalDateTime createdAt) {
        this.id = id;
        this.userId = userId;
        this.shippingAddressId = shippingAddressId;
        this.orderNumber = orderNumber;
        this.status = status;
        this.totalAmount = totalAmount;
        this.shippingFee = shippingFee;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.notes = notes;
        this.createdAt = createdAt;
    }

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Integer getUserId() { return userId; }
    public void setUserId(Integer userId) { this.userId = userId; }

    public Integer getShippingAddressId() { return shippingAddressId; }
    public void setShippingAddressId(Integer shippingAddressId) { this.shippingAddressId = shippingAddressId; }

    public String getOrderNumber() { return orderNumber; }
    public void setOrderNumber(String orderNumber) { this.orderNumber = orderNumber; }

    public OrderStatus getStatus() { return status; }
    public void setStatus(OrderStatus status) { this.status = status; }

    public BigDecimal getTotalAmount() { return totalAmount; }
    public void setTotalAmount(BigDecimal totalAmount) { this.totalAmount = totalAmount; }

    public BigDecimal getShippingFee() { return shippingFee; }
    public void setShippingFee(BigDecimal shippingFee) { this.shippingFee = shippingFee; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public PaymentStatus getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(PaymentStatus paymentStatus) { this.paymentStatus = paymentStatus; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
