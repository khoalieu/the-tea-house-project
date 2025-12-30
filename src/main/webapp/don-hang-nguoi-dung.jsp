<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đơn Hàng Gần Đây - Mộc Trà</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="user-dashboard-page">
<jsp:include page="common/header.jsp"></jsp:include>
    <div class="container">
        <jsp:include page="common/user-sidebar.jsp">
            <jsp:param name="activePage" value="don-hang"/>
        </jsp:include>
        <main class="main-content">
            <div class="orders-header">
                <h2 class="page-title" style="margin-bottom: 0;">Đơn Hàng Gần Đây</h2>
                
                <div class="orders-filter">
                    <button class="filter-btn active" data-status="all">Tất cả</button>
                    <button class="filter-btn" data-status="pending">Chờ xử lý</button>
                    <button class="filter-btn" data-status="completed">Hoàn thành</button>
                    <button class="filter-btn" data-status="cancelled">Đã hủy</button>
                </div>
            </div>

            <div class="orders-list">
                <!-- Order 1 - Pending -->
                <div class="order-card" data-status="pending">
                    <div class="order-card-header">
                        <div>
                            <div class="order-number">Đơn hàng #ORD-2025-001</div>
                            <div class="order-date">
                                <i class="fa-regular fa-calendar"></i> 15/11/2025, 14:30
                            </div>
                        </div>
                        <div class="order-status">
                            <span class="status-badge status-pending">Chờ xử lý</span>
                            <span class="status-badge payment-pending">Chưa thanh toán</span>
                        </div>
                    </div>
                    
                    <div class="order-card-body">
                        <div class="order-items">
                            <div class="order-item">
                                <img src="assets/images/san-pham-tra-gung-mat-ong.jpg" alt="Trà Gừng Mật Ong" class="item-image">
                                <div class="item-details">
                                    <div class="item-name">Trà Gừng Mật Ong Nguyên Chất</div>
                                    <div class="item-quantity">Số lượng: 2</div>
                                    <div class="item-price">120.000₫</div>
                                </div>
                            </div>
                            
                            <div class="order-item">
                                <img src="assets/images/san-pham-tra-hoa-cuc.jpg" alt="Trà Hoa Cúc" class="item-image">
                                <div class="item-details">
                                    <div class="item-name">Trà Hoa Cúc Khô Cao Cấp</div>
                                    <div class="item-quantity">Số lượng: 1</div>
                                    <div class="item-price">85.000₫</div>
                                </div>
                            </div>
                        </div>

                        <div class="order-summary">
                            <div class="summary-row">
                                <span>Tạm tính:</span>
                                <span>205.000₫</span>
                            </div>
                            <div class="summary-row">
                                <span>Phí vận chuyển:</span>
                                <span>30.000₫</span>
                            </div>
                            <div class="summary-row">
                                <span>Tổng cộng:</span>
                                <span>235.000₫</span>
                            </div>
                        </div>

                        <div class="shipping-address">
                            <strong><i class="fa-solid fa-location-dot"></i> Địa chỉ giao hàng:</strong>
                            Nguyễn Văn A - 0123456789<br>
                            123 Đường ABC, Phường XYZ, TP. Hồ Chí Minh
                        </div>

                        <div class="order-footer">
                            <div style="font-size: 13px; color: #666;">
                                <i class="fa-solid fa-credit-card"></i> Thanh toán: <strong>COD</strong>
                            </div>
                            <div class="order-actions">
                                <button class="btn-action btn-outline" onclick="viewOrderDetail('ORD-2025-001')">
                                    <i class="fa-solid fa-eye"></i> Chi tiết
                                </button>
                                <button class="btn-action btn-secondary" onclick="cancelOrder('ORD-2025-001')">
                                    <i class="fa-solid fa-times"></i> Hủy đơn
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Order 2 - Completed -->
                <div class="order-card" data-status="completed">
                    <div class="order-card-header">
                        <div>
                            <div class="order-number">Đơn hàng #ORD-2025-002</div>
                            <div class="order-date">
                                <i class="fa-regular fa-calendar"></i> 10/11/2025, 09:15
                            </div>
                        </div>
                        <div class="order-status">
                            <span class="status-badge status-completed">Hoàn thành</span>
                            <span class="status-badge payment-paid">Đã thanh toán</span>
                        </div>
                    </div>
                    
                    <div class="order-card-body">
                        <div class="order-items">
                            <div class="order-item">
                                <img src="assets/images/san-pham-tra-atiso.jpg" alt="Trà Atiso" class="item-image">
                                <div class="item-details">
                                    <div class="item-name">Trà Atiso Đà Lạt Cao Cấp</div>
                                    <div class="item-quantity">Số lượng: 3</div>
                                    <div class="item-price">270.000₫</div>
                                </div>
                            </div>
                        </div>

                        <div class="order-summary">
                            <div class="summary-row">
                                <span>Tạm tính:</span>
                                <span>270.000₫</span>
                            </div>
                            <div class="summary-row">
                                <span>Phí vận chuyển:</span>
                                <span>25.000₫</span>
                            </div>
                            <div class="summary-row">
                                <span>Tổng cộng:</span>
                                <span>295.000₫</span>
                            </div>
                        </div>

                        <div class="shipping-address">
                            <strong><i class="fa-solid fa-location-dot"></i> Địa chỉ giao hàng:</strong>
                            Nguyễn Văn A - 0123456789<br>
                            123 Đường ABC, Phường XYZ, TP. Hồ Chí Minh
                        </div>

                        <div class="order-footer">
                            <div style="font-size: 13px; color: #666;">
                                <i class="fa-solid fa-credit-card"></i> Thanh toán: <strong>Chuyển khoản</strong>
                            </div>
                            <div class="order-actions">
                                <button class="btn-action btn-outline" onclick="viewOrderDetail('ORD-2025-002')">
                                    <i class="fa-solid fa-eye"></i> Chi tiết
                                </button>
                                <button class="btn-action btn-primary" onclick="reorder('ORD-2025-002')">
                                    <i class="fa-solid fa-rotate"></i> Mua lại
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Order 3 - Cancelled -->
                <div class="order-card" data-status="cancelled">
                    <div class="order-card-header">
                        <div>
                            <div class="order-number">Đơn hàng #ORD-2025-003</div>
                            <div class="order-date">
                                <i class="fa-regular fa-calendar"></i> 05/11/2025, 16:45
                            </div>
                        </div>
                        <div class="order-status">
                            <span class="status-badge status-cancelled">Đã hủy</span>
                            <span class="status-badge payment-pending">Chưa thanh toán</span>
                        </div>
                    </div>
                    
                    <div class="order-card-body">
                        <div class="order-items">
                            <div class="order-item">
                                <img src="assets/images/san-pham-tra-bac-ha.jpg" alt="Trà Bạc Hà" class="item-image">
                                <div class="item-details">
                                    <div class="item-name">Trà Bạc Hà Thanh Mát</div>
                                    <div class="item-quantity">Số lượng: 1</div>
                                    <div class="item-price">75.000₫</div>
                                </div>
                            </div>
                        </div>

                        <div class="order-summary">
                            <div class="summary-row">
                                <span>Tạm tính:</span>
                                <span>75.000₫</span>
                            </div>
                            <div class="summary-row">
                                <span>Phí vận chuyển:</span>
                                <span>30.000₫</span>
                            </div>
                            <div class="summary-row">
                                <span>Tổng cộng:</span>
                                <span style="text-decoration: line-through; color: #999;">105.000₫</span>
                            </div>
                        </div>

                        <div class="shipping-address">
                            <strong><i class="fa-solid fa-info-circle"></i> Lý do hủy:</strong>
                            Khách hàng thay đổi ý định mua hàng
                        </div>

                        <div class="order-footer">
                            <div style="font-size: 13px; color: #666;">
                                <i class="fa-solid fa-credit-card"></i> Thanh toán: <strong>COD</strong>
                            </div>
                            <div class="order-actions">
                                <button class="btn-action btn-outline" onclick="viewOrderDetail('ORD-2025-003')">
                                    <i class="fa-solid fa-eye"></i> Chi tiết
                                </button>
                                <button class="btn-action btn-primary" onclick="reorder('ORD-2025-003')">
                                    <i class="fa-solid fa-rotate"></i> Đặt lại
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Empty State (Hidden by default, show when no orders) -->
            <div class="empty-state" style="display: none;">
                <i class="fa-solid fa-cart-shopping"></i>
                <h3>Chưa có đơn hàng nào</h3>
                <p>Bạn chưa có đơn hàng nào. Hãy bắt đầu mua sắm ngay!</p>
                <button class="btn-action btn-primary" onclick="window.location.href='san-pham.jsp'">
                    <i class="fa-solid fa-shopping-bag"></i> Mua sắm ngay
                </button>
            </div>
        </main>

    </div>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>
</body>
</html>
