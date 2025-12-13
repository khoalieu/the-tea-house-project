<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm - Hồng Trà Shan Tuyết</title>

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
                    <img src="assets/images/san-pham-hong-tra.jpg" alt="Ảnh chính sản phẩm">
                </div>                <div class="thumbnail-images">
                <img src="assets/images/san-pham-hong-tra.jpg" alt="Thumbnail 1" class="active">
                <img src="assets/images/san-pham-hong-tra-1.jpg" alt="Thumbnail 2">
                <img src="assets/images/san-pham-hong-tra-2.jpg" alt="Thumbnail 3">
                <img src="assets/images/san-pham-hong-tra-3.jpg" alt="Thumbnail 4">
            </div>            </div>
            <div class="product-info">

                <h1>Hồng Trà Shan Tuyết</h1>

                <div class="price-block">
                    <span class="price">97.000 VNĐ</span>

                </div>
                <p class="short-description">
                    Hồng Trà Shan Tuyết Cổ Thụ- Trà rừng nguyên sinh.

                    Thức uống tăng cường sự tỉnh táo, tập trung và sáng tạo không thể thiếu cho người thường xuyên hoạt động trí óc, văn phòng, ngồi máy tính. Một ấm trà vào mỗi buổi sáng đem lại cảm giác sảng khoái cho cả một ngày dài làm việc.

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
                    Thành phần: Cùng được thu hoạch từ cây Trà Shan Tuyết và cùng cách chế biến, tuy nhiên với cách thu hoạch 1 tôm 3 lá đã đem lại năng suất thu hoạch cao hơn và giảm công thu hái nhiều hơn, đồng nghĩa với giá thành sản xuất giảm đáng kể.

                    Ưu điểm:

                    -Với cách thu hoạch nhiều lá hơn, khiến cho vị trà đậm đà hơn, phù hợp dùng trong pha chế để kết hợp các hương liệu khác mà không làm nhạt nhòa vị chuẩn của Trà Shan Tuyết.

                    -Chuẩn Trà Shan Tuyết với chi phí tối ưu nhất, phù hợp cho kinh doanh quán trà sữa, đồ uống...

                    Trà Shan Tuyết trong trà đạo thường thu hoạch 1 tôm 1 lá để có tỉ lệ búp trà cao, thưởng thức thanh tao trong trà. Nhưng cách thu hoạch này mất nhiều công sức hơn và giá trị sản xuất cao hơn nhiều.

                    Trung bình cứ ~6kg lá trà tươi sẽ sản xuất được 1kg trà khô, vậy nên hái 6kg lá và búp sẽ nhanh hơn nhiều so với hái 6kg búp.
                </p>            </div>
            <div id="tab-2" class="tab-content">
                <h3>Hướng Dẫn Sử Dụng / Cách Pha Chế</h3>
                <p class="preserve-lines">...
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
                    <img src="assets/images/san-pham-tra-bac-ha.jpg" alt="Trà Bạc Hà">
                    <h3>Trà Bạc Hà</h3>
                    <p class="price">
                        80.000 VNĐ
                    </p>
                    <a href="chi-tiet-san-pham-tra-bac-ha.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/san-pham-tra-bac-ha.jpg" alt="Trà Bạc Hà">
                    <h3>Trà Bạc Hà</h3>
                    <p class="price">
                        80.000 VNĐ
                    </p>
                    <a href="chi-tiet-san-pham-tra-bac-ha.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/san-pham-tra-bac-ha.jpg" alt="Trà Bạc Hà">
                    <h3>Trà Bạc Hà</h3>
                    <p class="price">
                        80.000 VNĐ
                    </p>
                    <a href="chi-tiet-san-pham-tra-bac-ha.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <img src="assets/images/san-pham-tra-bac-ha.jpg" alt="Trà Bạc Hà">
                    <h3>Trà Bạc Hà</h3>
                    <p class="price">
                        80.000 VNĐ
                    </p>
                    <a href="chi-tiet-san-pham-tra-bac-ha.jsp" class="cta-button">Xem Chi Tiết</a>
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