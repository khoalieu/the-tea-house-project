<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm - Lục Trà Lài</title>

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
                    <img src="assets/images/san-pham-tra-lai.jpg" alt="Ảnh chính sản phẩm">
                </div>                <div class="thumbnail-images">
                <img src="assets/images/san-pham-tra-lai.jpg" alt="Thumbnail 1" class="active">
                <img src="assets/images/san-pham-tra-lai-1.jpg" alt="Thumbnail 2">
                <img src="assets/images/san-pham-tra-lai-2.jpg" alt="Thumbnail 3">
                <img src="assets/images/san-pham-tra-lai-3.jpg" alt="Thumbnail 4">
            </div>            </div>
            <div class="product-info">

                <h1>Lục Trà Lài</h1>

                <div class="price-block">
                    <span class="price">182.000 VNĐ</span>
                </div>
                <p class="short-description">
                    Hương Vị Đậm Đà, Thơm Ngon – Lựa Chọn Tuyệt Vời Cho Người Yêu Trà! 🍵

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
                    Trà Lộc Phát 1kg là sự lựa chọn lý tưởng dành cho những ai yêu thích vị trà đậm đà, thơm ngon đặc trưng. Sản phẩm nổi bật với vị chát nhẹ, hậu ngọt thanh và màu nước đẹp mắt, mang đến trải nghiệm thưởng thức trà tuyệt vời cho cả pha chế tại nhà lẫn kinh doanh quán nước.



                    Hai Loại Trà Đặc Sắc – Đa Dạng Lựa Chọn:

                    - Trà đen: Đậm vị, thích hợp pha trà sữa, trà trái cây và nhiều loại đồ uống giải khát.

                    - Lục trà lài: Hương lài thơm dịu, phù hợp với nhiều công thức pha chế khác nhau.



                    Ưu Điểm Nổi Bật:

                    - Hương vị đậm đà, thơm ngon khó cưỡng.

                    - Phù hợp pha chế trà sữa, trà trái cây và các loại đồ uống giải khát.

                    - Dễ dàng sử dụng cho cả quán kinh doanh và pha chế tại nhà.



                    Thông Tin Sản Phẩm:

                    - Trà được tuyển chọn từ lá trà chất lượng cao.

                    - Đảm bảo giữ trọn hương vị khi bảo quản nơi khô ráo, thoáng mát.
                </p>            </div>
            <div id="tab-2" class="tab-content">
                <h3>Hướng Dẫn Sử Dụng / Cách Pha Chế</h3>
                <p class="preserve-lines">Các công thức pha chế với Lục Trà Lài Hoàng Gia 500G

                    Công thức ủ trà

                    Cách 1.

                    - Lục Trà lài Hoàng Gia: 50gr

                    - Nước nóng 80 - 85 độ C: 2L

                    - Muối: 1 gr

                    - Thời gian ủ: 10-12 phút, đậy kín

                    - Vớt xác trà, ép cốt, cho thêm 1kg đá viên vào

                    - Cho vào bình ủ, sử dụng trong ngày, tốt nhất 5-6 tiếng sau khi làm trà.



                    Cách 2.

                    - Lục Trà Lài Hoàng Gia: 25 - 30gr

                    - Nước nóng (85 - 90 độ C): 1L

                    - Muối: 0.5gr

                    - Thời gian ủ: 10 - 12 phút

                    -Lược trà bỏ thêm Đá viên: 500gr
                </p>
            </div>
            <div id="tab-3" class="tab-content">
                <h3>Đánh Giá Của Khách Hàng</h3>
                <p>(Chưa có đánh giá nào cho sản phẩm này)</p>
            </div>        </section>
        <section class="product-related">
            <h2>Sản Phẩm Liên Quan</h2>

            <div class="product-grid">
                <div class="product-card">... (Copy 1 cái product card từ trang chủ vào đây) ...</div>
                <div class="product-card">... (Copy 1 cái product card từ trang chủ vào đây) ...</div>
                <div class="product-card">... (Copy 1 cái product card từ trang chủ vào đây) ...</div>
                <div class="product-card">... (Copy 1 cái product card từ trang chủ vào đây) ...</div>
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