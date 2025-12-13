<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hóa đơn - Mộc Trà</title>

    <!-- Giữ nguyên link giống các trang khác -->
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<!-- TOP BAR -->
<jsp:include page="common/header.jsp"></jsp:include>
<main>
    <section class="invoice-page">
        <div class="container">

            <!-- TIÊU ĐỀ + MÃ HÓA ĐƠN + THỜI GIAN -->
            <div class="invoice-header">
                <div class="invoice-header-left">
                    <h1 class="invoice-title">Hóa đơn thanh toán</h1>
                    <p class="invoice-subtitle">
                        Cảm ơn bạn đã tin tưởng Mộc Trà. Dưới đây là thông tin chi tiết đơn hàng của bạn.
                    </p>
                </div>
                <div class="invoice-header-right">
                    <!-- Sau này servlet fill -->
                    <p><strong>Mã hóa đơn:</strong> <span id="invoiceCode">MT-20241115-001</span></p>
                    <p><strong>Thời gian xuất hóa đơn:</strong>
                        <span id="invoiceDateTime">15/11/2025 14:32</span>
                    </p>
                </div>
            </div>

            <!-- 1 CỘT: CÁC THẺ XẾP DỌC -->
            <div class="invoice-column">

                <!-- THÔNG TIN KHÁCH HÀNG -->
                <div class="checkout-card invoice-card">
                    <h2 class="checkout-card__title">Thông tin khách hàng</h2>
                    <div class="invoice-info">
                        <!-- Sau này servlet fill các span -->
                        <p><strong>Người nhận:</strong>
                            <span id="customerName">Nguyễn Văn A</span>
                        </p>
                        <p><strong>Số điện thoại:</strong>
                            <span id="customerPhone">0888 531 015</span>
                        </p>
                        <p><strong>Email (nếu có):</strong>
                            <span id="customerEmail">nguyenvana@example.com</span>
                        </p>
                    </div>
                </div>

                <!-- ĐỊA CHỈ & GIAO HÀNG -->
                <div class="checkout-card invoice-card">
                    <h2 class="checkout-card__title">Địa chỉ & giao hàng</h2>
                    <div class="invoice-info">
                        <p><strong>Địa chỉ giao hàng:</strong></p>
                        <p class="invoice-address" id="shippingAddress">
                            123 Đường Trà, Phường Trà Thảo, TP. Trà Sữa, Việt Nam
                        </p>

                        <p><strong>Phương thức giao hàng:</strong>
                            <span class="pill pill-shipping" id="shippingMethod">
                                Giao tiêu chuẩn (3-5 ngày)
                            </span>
                        </p>

                        <p><strong>Phí vận chuyển:</strong>
                            <span id="shippingFee">20.000đ</span>
                        </p>

                    </div>
                </div>

                <!-- PHƯƠNG THỨC THANH TOÁN -->
                <div class="checkout-card invoice-card">
                    <h2 class="checkout-card__title">Hình thức thanh toán</h2>
                    <div class="invoice-info">
                        <p><strong>Phương thức:</strong>
                            <span class="pill pill-payment" id="paymentMethod">
                                Ví MoMo
                            </span>
                        </p>
                        <p><strong>Trạng thái thanh toán:</strong>
                            <span id="paymentStatus">Đã thanh toán</span>
                        </p>
                    </div>
                </div>

                <!-- DANH SÁCH SẢN PHẨM + TỔNG TIỀN -->
                <div class="checkout-card invoice-card">
                    <h2 class="checkout-card__title">Danh sách sản phẩm</h2>

                    <div class="invoice-table-wrapper">
                        <table class="invoice-table">
                            <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Đơn giá</th>
                                <th>Thành tiền</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- Sau này servlet loop qua danh sách items -->
                            <!-- Ví dụ JSP:
                            <c:forEach var="item" items="${orderItems}">
                              <tr>...</tr>
                            </c:forEach>
                            -->
                            <tr>
                                <td>
                                    <span class="invoice-product-name">Trà Hoa Cúc Sấy Khô</span>
                                </td>
                                <td>1</td>
                                <td>120.000đ</td>
                                <td>120.000đ</td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="invoice-product-name">Trà Gừng Mật Ong</span>
                                </td>
                                <td>2</td>
                                <td>95.000đ</td>
                                <td>190.000đ</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="order-summary invoice-summary">
                        <div class="order-summary__row">
                            <span>Tạm tính</span>
                            <span id="invoiceSubtotal">310.000đ</span>
                        </div>
                        <div class="order-summary__row">
                            <span>Phí vận chuyển</span>
                            <span id="invoiceShippingFee">20.000đ</span>
                        </div>
                        <div class="order-summary__row order-summary__row--total">
                            <span>Tổng cộng</span>
                            <span id="invoiceTotal">330.000đ</span>
                        </div>
                    </div>
                </div>

                <!-- NÚT HÀNH ĐỘNG -->
                <div class="invoice-actions">
                    <a href="san-pham.jsp" class="btn btn-secondary">
                        Tiếp tục mua sắm
                    </a>
                    <a href="don-hang-nguoi-dung.jsp" class="btn btn-primary">
                        Xem lịch sử đơn hàng
                    </a>
                </div>

            </div>
        </div>
    </section>
</main>

<!-- FOOTER -->
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>
</div>
</body>
</html>
