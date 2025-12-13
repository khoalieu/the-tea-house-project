<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm - Trà Atiso</title>

    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<main class="main-content">
    <div class="container">
        <section class="product-detail-layout">

            <div class="product-gallery">
                <div class="main-image">
                    <img src="assets/images/san-pham-tra-atiso.jpg" alt="Ảnh chính sản phẩm">
                </div>                <div class="thumbnail-images">
                <img src="assets/images/san-pham-tra-atiso.jpg" alt="Thumbnail 1" class="active">
                <img src="assets/images/san-pham-tra-atiso-1.jpg" alt="Thumbnail 2">
                <img src="assets/images/san-pham-tra-atiso-2.jpg" alt="Thumbnail 3">
                <img src="assets/images/san-pham-tra-atiso-3.jpg" alt="Thumbnail 4">
            </div>            </div>
            <div class="product-info">
                <span class="sale-tag">-20%</span>

                <h1>Trà Atiso Túi Lọc</h1>

                <div class="price-block">
                    <span class="new-price">60.000 VNĐ</span>
                    <span class="old-price">70.000 VNĐ</span>
                </div>
                <p class="short-description">
                    Trà Atiso  Ladophar Gói 100 Túi Lọc Giúp Tăng Cường Sức Khỏe Lá Gan Của Bạn

                </p>

                <div class="quantity-selector">
                    <label for="quantity">Số lượng:</label>
                    <input type="number" id="quantity" value="1" min="1">
                </div>
                <a href="#" class="cta-button add-to-cart-btn">Thêm vào giỏ hàng</a>
            </div>
        </section>
        <section class="product-description-tabs">
            <div class="tab-headers">
                <button class="tab-link active" data-tab="tab-1">Mô Tả Chi Tiết</button>
                <button class="tab-link" data-tab="tab-2">Hướng Dẫn Sử Dụng</button>
                <button class="tab-link" data-tab="tab-3">Đánh Giá</button>
            </div>
            <div id="tab-1" class="tab-content active">
                <h3>Mô Tả Sản Phẩm</h3>
                <p class="preserve-lines">
                    🔰 Thông tin sản phẩm:

                    - Xuất Xứ: Việt Nam

                    - Quy Cách: Gói 100 gói lọc

                    - HSD: 24 tháng

                    Trà Atiso là sản phẩm truyền thống từ Atiso với hương thơm từ Atiso với vị ngọt hoàn toàn tự nhiên nay được bổ sung thêm thành phần cao Atiso giúp tăng cường hiệu quả phòng ngừa và bảo vệ gan mật.
                    Thành phần:

                    Atiso ……………………………….1,65 g

                    Cao Atiso tinh chế …………0,04 g

                    Phụ liệu: Cỏ ngọt …………….0,31 g

                    Công dụng

                    • Mát gan,thông mật, lợi tiểu

                    • Dùng tốt trong những trường hợp: Yếu gan,nổi mể đay, vàng da.

                    • Dùng được cho người bị tiểu đường.
                </p>
                <ul>                    <li>Thành phần: 100% tự nhiên...</li>
                    <li>Khối lượng tịnh: 500g</li>
                    <li>Xuất xứ: Việt Nam</li>
                </ul>            </div>
            <div id="tab-2" class="tab-content">
                <h3>Hướng Dẫn Sử Dụng / Cách Pha Chế</h3>
                <p class="preserve-lines">Cách dùng:

                    Nhúng túi trà vào ly nước sôi (150-200 ml), chờ 3 đến 5 phút.

                    Có thể pha thêm đường tùy ý.

                    Ngày uống 1 - 2 lần, mỗi lần 1-2 túi lọc.
                </p>
            </div>
            <div id="tab-3" class="tab-content">
                <h3>Đánh Giá Của Khách Hàng</h3>
                <p>(Chưa có đánh giá nào cho sản phẩm này)</p>
            </div>        </section>
        <section class="product-related">
            <h2>Sản Phẩm Liên Quan</h2>

            <div class="product-grid">
                <div class="product-card">
                    <img src="assets/images/san-pham-tra-lai.jpg" alt="Lục Trà Lài">
                    <h3>Lục Trà Lài</h3>
                    <p class="price">
                        182.000 VNĐ
                    </p>
                    <a href="chi-tiet-san-pham-tra-lai.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/san-pham-tra-lai.jpg" alt="Lục Trà Lài">
                    <h3>Lục Trà Lài</h3>
                    <p class="price">
                        182.000 VNĐ
                    </p>
                    <a href="chi-tiet-san-pham-tra-lai.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/san-pham-tra-lai.jpg" alt="Lục Trà Lài">
                    <h3>Lục Trà Lài</h3>
                    <p class="price">
                        182.000 VNĐ
                    </p>
                    <a href="chi-tiet-san-pham-tra-lai.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/san-pham-tra-lai.jpg" alt="Lục Trà Lài">
                    <h3>Lục Trà Lài</h3>
                    <p class="price">
                        182.000 VNĐ
                    </p>
                    <a href="chi-tiet-san-pham-tra-lai.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
            </div>        </section>
    </div></main>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>

<script>
    // Đoạn script này giúp các Tab hoạt động (không bắt buộc nhưng nên có)
    document.addEventListener('DOMContentLoaded', function() {
        const tabLinks = document.querySelectorAll('.tab-link');
        const tabContents = document.querySelectorAll('.tab-content');

        tabLinks.forEach(link => {
            link.addEventListener('click', function() {
                const tabId = this.getAttribute('data-tab');

                // Xóa active khỏi tất cả link và content
                tabLinks.forEach(item => item.classList.remove('active'));
                tabContents.forEach(item => item.classList.remove('active'));

                // Thêm active vào link và content được click
                this.classList.add('active');
                document.getElementById(tabId).classList.add('active');
            });
        });
    });
</script>

</body>
</html>