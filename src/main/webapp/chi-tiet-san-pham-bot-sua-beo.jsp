<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm - Bột Sữa Béo</title>

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
                    <img src="assets/images/san-pham-bot-sua-beo.jpg" alt="Ảnh chính sản phẩm">
                </div>                <div class="thumbnail-images">
                <img src="assets/images/san-pham-bot-sua-beo.jpg" alt="Thumbnail 1" class="active">
                <img src="assets/images/san-pham-bot-sua-beo-1.jpg" alt="Thumbnail 2">
                <img src="assets/images/san-pham-bot-sua-beo-2.jpg" alt="Thumbnail 3">
                <img src="assets/images/san-pham-bot-sua-beo-3.jpg" alt="Thumbnail 4">
            </div>            </div>
            <div class="product-info">

                <h1>Bột Sữa Béo BOne</h1>

                <div class="price-block">

                    <span class="price">70.000 VNĐ</span>
                </div>
                <p class="short-description">
                    Bạn đang tìm kiếm một sản phẩm mang lại hương vị béo ngậy cho trà sữa và các món ăn khác? Bột Kem Béo Thái Lan B One chính là lựa chọn hoàn hảo! Với khả năng dễ dàng hòa tan, sản phẩm này mang đến trải nghiệm hương vị thơm ngon và phong cách Thái đặc trưng.

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
                    🌟 Nguyên Liệu Pha Trà Sữa Chính 🌟

                    Bột Kem Béo B One là lựa chọn hàng đầu để pha chế trà sữa, giúp tăng độ béo ngậy mà vẫn giữ nguyên hương vị đặc trưng của đồ uống yêu thích của bạn. Với thành phần chính là siro glucose, chất béo thực vật và protein sữa, sản phẩm không chứa chất bảo quản, đảm bảo an toàn cho sức khỏe.



                    📦 Các Kích Cỡ Đa Dạng 📦

                    - Gói tách 200g

                    - Gói nguyên 1kg

                    - Gói tách 500g



                    🔍 Thông Tin Bổ Sung 🔍

                    Sản phẩm không có bảo hành cho các kích cỡ này. Hãy yên tâm sử dụng và trải nghiệm hương vị tuyệt vời mà Bột Kem Béo B One mang lại cho ly trà sữa của bạn!
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
</html></title>
</head>
<body>

</body>
</html>