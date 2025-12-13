<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm - Trân Châu Đường Đen</title>

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
                    <img src="assets/images/san-pham-tran-chau-den-1.jpg" alt="Ảnh chính sản phẩm">
                </div>                <div class="thumbnail-images">
                <img src="assets/images/san-pham-tran-chau-den-1.jpg" alt="Thumbnail 1" class="active">
                <img src="assets/images/san-pham-tran-chau-den-2.jpg" alt="Thumbnail 2">
                <img src="assets/images/san-pham-tran-chau-den-3.jpg" alt="Thumbnail 3">
                <img src="assets/images/san-pham-tran-chau-den-4.jpg" alt="Thumbnail 4">
            </div>            </div>
            <div class="product-info">
                <span class="sale-tag">-20%</span>

                <h1>Trân Châu Đường Đen</h1>

                <div class="price-block">
                    <span class="new-price">45.000 VNĐ</span>
                    <span class="old-price">50.000 VNĐ</span>
                </div>
                <p class="short-description">
                    Trân Châu Đen Mềm Dẻo Nguyên Liệu Pha Trà Sữa Trân Châu Truyền Thống

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
                    SỰ KHÁC BIỆT GIỮA  TRÂN CHÂU ĐEN NHALAM FOOD SO VỚI CÁC LOẠI KHÁC:

                    - Trân châu thơm ngon mềm dai

                    - Đúng chuẩn hương vị Đài Loan, 100% Nguyên liệu nhập khẩu, công nghệ kĩ thuật Đài Loan.

                    - Chất lượng đảm bảo tuyệt vời – sử dụng nguồn nguyên liệu sạch, chất lượng, sản xuất theo công nghệ Đài Loan.

                    - Trân châu đen được dùng trong các món chè thập cẩm hoặc chè thái, sữa chua, đặc biệt trong trà sữa chân trâu.

                    - Thành phần: bột sắn,nước, màu caramel



                    MỘT TÚI TRÂN CHÂU ĐEN NHALAM FOOD CÓ:

                    - Trân châu đen

                    - Đóng gói: Túi 100-500g chắc chắn

                    - Thương Hiệu: NHALAM FOOD
                </p>
                <ul>                    <li>Thành phần: 100% tự nhiên...</li>
                    <li>Khối lượng tịnh: 500g</li>
                    <li>Xuất xứ: Việt Nam</li>
                </ul>            </div>
            <div id="tab-2" class="tab-content">
                <h3>Hướng Dẫn Sử Dụng / Cách Pha Chế</h3>
                <p class="preserve-lines">CÁCH NẤU TRÂN CHÂU ĐEN MỀM DẺO

                    - Bỏ trân châu đen vào nước sôi, khuấy đều tới khi hạt trân châu không dính vào nhau.

                    - Nấu 20 phút, tắt lửa và ủ thêm 20 phút.

                    - Vớt hạt trân châu ra, xả nước lạnh cho giảm nhiệt độ, ướp trân châu với nước đường cho hạt trân châu không dính vào nhau.
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