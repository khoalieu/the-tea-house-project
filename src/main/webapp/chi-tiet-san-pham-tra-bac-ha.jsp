<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm - Trà Bạc Hà</title>

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
                    <img src="assets/images/san-pham-tra-bac-ha.jpg" alt="Ảnh chính sản phẩm">
                </div>                <div class="thumbnail-images">
                <img src="assets/images/san-pham-tra-bac-ha.jpg" alt="Thumbnail 1" class="active">
                <img src="assets/images/san-pham-tra-bac-ha-1.jpg" alt="Thumbnail 2">
                <img src="assets/images/san-pham-tra-bac-ha-2.jpg" alt="Thumbnail 3">
                <img src="assets/images/san-pham-tra-bac-ha-3.jpg" alt="Thumbnail 4">
            </div>            </div>
            <div class="product-info">

                <h1>Trà Bạc Hà</h1>

                <div class="price-block">

                    <span class="price">80.000 VNĐ</span>
                </div>
                <p class="short-description">
                    Trà Lá Bạc Hà -  Giảm stress và thư giãn tinh thần  - Tăng cường sự tập trung - Giảm các triệu chứng dị ứng theo mùa

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
                    QUY TRÌNH SẢN XUẤT TRÀ HOA BẠC HÀ PHIÊN BẢN ĐẶC BIỆT GOTAFARM:

                    * Khi đến thời kỳ thu hoạch, Trà ngọn đầu cành được tuyển chọn từ những ngọn đầu cành có bông

                    * Bạc hà được canh tác tại các vườn thành viên Gotafarm theo định hướng tự nhiên, không sử dụng hóa chất và phân bón hóa học, không dùng chất kích thích tăng trưởng.

                    * Đến thời kỳ thu hái, ngọn hoa được hái bằng tay 100% để đảm bảo từng chiếc búp lá được nguyên vẹn, không rách nát.

                    * Ngọn trà được rửa sạch bằng nước nhiều lần và sấy khô trong điều kiện sạch sẽ đảm bảo an toàn vệ sinh thực phẩm (sấy phòng lạnh)

                    THÀNH PHẦN TRONG MỖI HŨ TRÀ:

                    + Ngọn hoa Bạc Hà: 100%

                    CÔNG DỤNG CỦA TRÀ HOA BẠC HÀ GOTAFARM:

                    + Giúp hơi thở tươi mát

                    + Hạ nhiệt cơ thể, giảm sốt

                    + Sát khuẩn đường họng, giảm triệu chứng ho

                    + Hỗ trợ hệ tiêu hóa tiết ra enzyme tiêu hóa tốt hơn
                </p>            </div>
            <div id="tab-2" class="tab-content">
                <h3>Hướng Dẫn Sử Dụng / Cách Pha Chế</h3>
                <p class="preserve-lines">Cho 1 ngọn Trà Hoa Bạc Hà Gotafarm vào tách hoặc ấm (từ 300ml-500ml nước tùy khẩu vị), đổ nước vừa đun sôi, để cho trà ngấm sau 5 phút thì lọc bã trà để thưởng thức. Có thể pha kèm với Lá Cỏ Ngọt để tăng vị ngon cho trà. Nếu không dùng Cỏ Ngọt, khi trà nguội bớt thì thêm đường hoặc mật ong. Có thể pha thêm nước lần nữa. Cho thêm đá lạnh sẽ rất ngon.

                    Có thể kết hợp Trà Hoa Bạc Hà với các loại trà thảo mộc khác như tía tô, hoa hồng, hoa cúc, gừng, sả chanh,.... uống đều rất ngon.
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