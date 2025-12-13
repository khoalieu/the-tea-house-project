<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán - Mộc Trà</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
    <main>
        <section class="checkout-page">
            <div class="container">
                <h1 class="checkout-title">Thanh toán</h1>

                <form class="checkout-form" action="hoa-don.jsp" method="get"> <!-- sửa action sau này xóa và mở comment dòng dưới -->
                <!-- <form class="checkout-form" action="checkout" method="post"> -->
                    <input type="hidden" name="subtotal" value="310000">

                    <div class="checkout-layout">
                        <!-- cột trái : thông tin giao hàng -->
                        <div class="checkout-left">
                            <div class="checkout-card">
                                <h2 class="checkout-card__title">Thông tin giao hàng</h2>

                                <!-- address default -->
                                <div class="address-book-box">
                                    <h3 style="font-size: 16px; margin-bottom: 15px; color: #333;">Sổ địa chỉ</h3>

                                    <div class="address-list">
                                        <label class="address-option">
                                            <input type="radio" name="selectedAddress" value="default" checked>
                                            <div class="address-content">
                                                <strong class="address-label">Sử dụng thông tin và địa chỉ mặc định</strong>
                                                <div class="address-detail">
                                                    <span>Nguyễn Văn A - 0888 531 015</span><br>
                                                    <span>123 Đường Trà, Phường Trà Thảo, TP. Trà Sữa</span>
                                                </div>
                                                <span class="badge-default">Mặc định</span>
                                            </div>
                                        </label>

                                        <label class="address-option">
                                            <input type="radio" name="selectedAddress" value="2">
                                            <div class="address-content">
                                                <strong class="address-label">Văn phòng</strong>
                                                <div class="address-detail">
                                                    <span>Nguyễn Văn A - 0909 123 456</span><br>
                                                    <span>45 Đường Pha Chế, Phường Công Thức, TP. Trà Sữa</span>
                                                </div>
                                            </div>
                                        </label>

                                        <label class="address-option">
                                            <input type="radio" name="selectedAddress" value="new">
                                            <div class="address-content">
                                                <strong class="address-label">Giao đến địa chỉ khác</strong>
                                                <div class="address-detail">
                                                    <span>Nhập thông tin địa chỉ mới bên dưới...</span>
                                                </div>
                                            </div>
                                        </label>
                                    </div>
                                </div>

                                <!-- địa chỉ nhập tay (nếu không mặc định) -->
                                <div class="manual-address">
                                    <div class="form-row form-row--2">
                                        <div class="form-field">
                                            <label for="fullName">Họ và tên <span class="required">*</span></label>
                                            <input type="text" id="fullName" name="fullName"
                                                   placeholder="Nguyễn Văn A" required>
                                        </div>
                                        <div class="form-field">
                                            <label for="phoneNumber">Số điện thoại <span class="required">*</span></label>
                                            <input type="tel" id="phoneNumber" name="phoneNumber"
                                                   placeholder="0888 531 015" required>
                                        </div>
                                    </div>

                                    <div class="form-row form-row--3">
                                        <div class="form-field">
                                            <label for="province">Tỉnh / Thành phố</label>
                                            <select id="province" name="province">
                                                <option value="">-- Chọn tỉnh / thành --</option>
                                                <!-- servelet/database load data later -->
                                            </select>
                                        </div>
                                        <div class="form-field">
                                            <label for="ward">Phường / Xã</label>
                                            <select id="ward" name="ward">
                                                <option value="">-- Chọn phường / xã --</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-field">
                                            <label for="addressLine">Địa chỉ cụ thể <span class="required">*</span></label>
                                            <input type="text" id="addressLine" name="addressLine"
                                                   placeholder="Số nhà, tên đường, tòa nhà..." required>
                                        </div>
                                    </div>
                                </div>

                                <!-- Checkbox chia sẻ vị trí -->
                                <div class="form-row form-row--inline">
                                    <label class="checkbox-field">
                                        <input type="checkbox" id="shareLocation" name="shareLocation" value="true">
                                        <span>Chia sẻ vị trí hiện tại của tôi để định vị địa chỉ chính xác hơn</span>
                                    </label>
                                </div>

                                <!-- Ghi chú giao hàng -->
                                <div class="form-row">
                                    <div class="form-field">
                                        <label for="note">Ghi chú khi giao hàng</label>
                                        <textarea id="note" name="note" rows="3"
                                                  placeholder="Ví dụ: Gọi trước khi giao, giao giờ hành chính,..."></textarea>
                                    </div>
                                </div>
                                    <!-- thông tin đơn hàng and payment (bên pahir ) -->
                                <div class="checkout-card">
                                    <h2 class="checkout-card__title">Phương thức giao hàng</h2>

                                    <div class="shipping-methods">
                                        <label class="shipping-option">
                                            <input type="radio"
                                                name="shippingMethod"
                                                value="standard"
                                                checked>
                                            <div class="shipping-option__content">
                                                <div class="shipping-option__top">
                                                    <span class="shipping-option__name">Tiêu chuẩn</span>
                                                    <span class="shipping-option__price">+ 20.000đ</span>
                                                </div>
                                                <div class="shipping-option__desc">Giao trong 3-5 ngày làm việc.</div>
                                            </div>
                                        </label>

                                        <label class="shipping-option">
                                            <input type="radio"
                                                name="shippingMethod"
                                                value="express">
                                            <div class="shipping-option__content">
                                                <div class="shipping-option__top">
                                                    <span class="shipping-option__name">Nhanh</span>
                                                    <span class="shipping-option__price">+ 35.000đ</span>
                                                </div>
                                                <div class="shipping-option__desc">Giao trong 1-2 ngày làm việc.</div>
                                            </div>
                                        </label>

                                        <label class="shipping-option">
                                            <input type="radio"
                                                name="shippingMethod"
                                                value="instant">
                                            <div class="shipping-option__content">
                                                <div class="shipping-option__top">
                                                    <span class="shipping-option__name">Hỏa tốc</span>
                                                    <span class="shipping-option__price">+ 60.000đ</span>
                                                </div>
                                                <div class="shipping-option__desc">Giao trong 2-4 giờ (nội thành).</div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- CỘT PHẢI: ĐƠN HÀNG  + THANH TOÁN -->
                        <div class="checkout-right">
                            <!-- ĐƠN HÀNG CỦA BẠN (TỪ GIỎ HÀNG) -->
                            <div class="checkout-card">
                                <h2 class="checkout-card__title">Đơn hàng của bạn</h2>

                                <div class="order-items">
                                    <!--
                                        Sau này Servlet:
                                        - Lấy giỏ hàng (cart) từ session                               -->
                                    <!-- ITEM DEMO 1 -->
                                    <div class="order-item">
                                        <input type="hidden" name="productId" value="101">
                                        <input type="hidden" name="quantity" value="1">

                                        <div class="order-item__thumb">
                                            <img src="assets/images/san-pham-tra-hoa-cuc-2.jpg" alt="Trà Hoa Cúc">
                                        </div>
                                        <div class="order-item__info">
                                            <div class="order-item__name">Trà Hoa Cúc Sấy Khô</div>
                                            <div class="order-item__meta">Số lượng: 1</div>
                                        </div>
                                        <div class="order-item__price">120.000đ</div>
                                    </div>

                                    <!-- ITEM DEMO 2 -->
                                    <div class="order-item">
                                        <input type="hidden" name="productId" value="202">
                                        <input type="hidden" name="quantity" value="2">

                                        <div class="order-item__thumb">
                                            <img src="assets/images/san-pham-tra-gung-mat-ong-1.jpg" alt="Trà Gừng Mật Ong">
                                        </div>
                                        <div class="order-item__info">
                                            <div class="order-item__name">Trà Gừng Mật Ong</div>
                                            <div class="order-item__meta">Số lượng: 2</div>
                                        </div>
                                        <div class="order-item__price">190.000đ</div>
                                    </div>
                                </div>

                                <div class="order-summary">
                                    <div class="order-summary__row">
                                        <span>Tạm tính</span>
                                        <!-- Sau này Servlet set text này = tổng tiền sản phẩm -->
                                        <span>310.000đ</span>
                                    </div>
                                    <div class="order-summary__row">
                                        <span>Phí vận chuyển</span>
                                        <!-- Servlet tính theo shippingMethod -->
                                        <span>20.000đ</span>
                                    </div>
                                    <div class="order-summary__row order-summary__row--total">
                                        <span>Tổng cộng</span>
                                        <!-- Tổng = tạm tính + phí vận chuyển -->
                                        <span>330.000đ</span>
                                    </div>
                                </div>
                            </div>

                            <!-- PHƯƠNG THỨC THANH TOÁN -->
                            <div class="checkout-card">
                                <h2 class="checkout-card__title">Phương thức thanh toán</h2>

                                <div class="payment-methods">
                                    <label class="payment-option">
                                        <input type="radio" name="paymentMethod" value="momo" checked>
                                        <div class="payment-option__content">
                                            <span class="payment-option__name">
                                                <i class="fa-solid fa-mobile-screen"></i> Ví MoMo
                                            </span>
                                            <p class="payment-option__desc">
                                                Sau khi đặt hàng, hệ thống sẽ hiển thị QR / số điện thoại để bạn thanh toán bằng MoMo.
                                            </p>
                                        </div>
                                    </label>

                                    <label class="payment-option">
                                        <input type="radio" name="paymentMethod" value="cod">
                                        <div class="payment-option__content">
                                            <span class="payment-option__name">
                                                <i class="fa-solid fa-box"></i> Thanh toán khi nhận hàng (COD)
                                            </span>
                                            <p class="payment-option__desc">
                                                Bạn thanh toán trực tiếp cho shipper khi nhận hàng.
                                            </p>
                                        </div>
                                    </label>

                                    <label class="payment-option">
                                        <input type="radio" name="paymentMethod" value="bank">
                                        <div class="payment-option__content">
                                            <span class="payment-option__name">
                                                <i class="fa-solid fa-building-columns"></i> Chuyển khoản ngân hàng
                                            </span>
                                            <p class="payment-option__desc">
                                                Thông tin số tài khoản và nội dung chuyển khoản sẽ được hiển thị sau khi đặt hàng thành công.
                                            </p>
                                        </div>
                                    </label>
                                </div>
                            </div>

                            <!-- NÚT THANH TOÁN -->
                            <div class="checkout-submit">
                                <!-- Sau này Servlet set đúng tổng tiền vào đây -->
                                <button type="submit" class="btn btn-primary checkout-submit__btn">
                                    Thanh toán 330.000đ
                                </button>
                                <p class="checkout-submit__note">
                                    Bằng cách nhấn "Thanh toán", bạn đồng ý với
                                    <a href="dieu-khoan-dich-vu.jsp">Điều khoản dịch vụ</a> của Mộc Trà.
                                </p>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </main>

    <!-- FOOTER -->
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function () {

        const addressRadios = document.querySelectorAll('input[name="selectedAddress"]');
        const manualAddressForm = document.querySelector(".manual-address");

        const manualInputs = manualAddressForm.querySelectorAll("input, select, textarea");

        function updateFormState() {
            const selected = document.querySelector('input[name="selectedAddress"]:checked');

            if (selected && selected.value === "new") {

                manualAddressForm.classList.remove("disabled");

                manualInputs.forEach(input => {
                    input.disabled = false;
                });

                const firstInput = manualAddressForm.querySelector('input');
                if(firstInput) firstInput.focus();

            } else {

                manualAddressForm.classList.add("disabled");

                manualInputs.forEach(input => {
                    input.disabled = true;
                });
            }
        }
        addressRadios.forEach(radio => {
            radio.addEventListener("change", updateFormState);
        });
        updateFormState();
    });
</script>

</html>
