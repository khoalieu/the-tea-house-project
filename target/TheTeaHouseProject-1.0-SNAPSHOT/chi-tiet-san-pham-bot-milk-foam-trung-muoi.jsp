<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm - Bột Milk Foam</title>

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
                    <img src="assets/images/san-pham-bot-milk-foam.jpg" alt="Ảnh chính sản phẩm">
                </div>                <div class="thumbnail-images">
                <img src="assets/images/san-pham-bot-milk-foam.jpg" alt="Thumbnail 1" class="active">
                <img src="assets/images/san-pham-bot-milk-foam-1.jpg" alt="Thumbnail 2">
                <img src="assets/images/san-pham-bot-milk-foam-2.jpg" alt="Thumbnail 3">
                <img src="assets/images/san-pham-bot-milk-foam-3.jpg" alt="Thumbnail 4">
            </div>            </div>
            <div class="product-info">


                <h1>Bột Milk Foam</h1>

                <div class="price-block">
                    <span class="price">89.000 VNĐ</span>
                </div>
                <p class="short-description">
                    Điểm nổi bật không thể bỏ qua! 🥚🥛

                    - Foaming sánh mịn, giữ lâu trên bề mặt thức uống.

                    - Hương vị trứng muối thơm béo, đậm đà, mang lại trải nghiệm mới lạ cho cà phê, trà sữa và các món tráng miệng.

                    - Dễ dàng sử dụng, chỉ cần đánh bông với nước đá lạnh trong vài phút.

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
                    Chi tiết sản phẩm:

                    - Trọng lượng: 500g mỗi gói, phù hợp cho quán hoặc gia đình.

                    - Sản phẩm dạng bột tiện lợi, dễ bảo quản.



                    Thông tin thêm:

                    - Không cần thêm nguyên liệu phức tạp, chỉ cần máy đánh trứng và nước đá lạnh là có thể tạo ra lớp foam đẹp mắt.

                    - Lớp foam có màu vàng tươi, sánh mịn, không nổi bọt, giữ được lâu trên bề mặt thức uống.

                    - Phù hợp làm topping cho cà phê, trà sữa hoặc sốt cho bánh.

                    - Bảo quản nơi khô ráo, thoáng mát, tránh ánh nắng trực tiếp để giữ chất lượng tốt nhất.
                </p>            </div>
            <div id="tab-2" class="tab-content">
                <h3>Hướng Dẫn Sử Dụng / Cách Pha Chế</h3>
                <p class="preserve-lines">...
                </p>
            </div>
            <div id="tab-3" class="tab-content">
                <h3>Đánh Giá Của Khách Hàng</h3>
                <div class="product-reviews">

                    <div class="review-form-container">
                        <h3>Viết đánh giá của bạn</h3>

                        <form class="review-form" action="/submit-review" method="post">

                            <input type="hidden" name="product_id" value="[ID_san_pham_nay]">

                            <div class="form-group">

                                <label>Đánh giá của bạn <span class="required">*</span></label>

                                <div class="star-rating">
                                    <input type="radio" id="star5" name="rating" value="5">
                                    <label for="star5" title="Tuyệt vời"></label>

                                    <input type="radio" id="star4" name="rating" value="4">
                                    <label for="star4" title="Tốt"></label>

                                    <input type="radio" id="star3" name="rating" value="3">
                                    <label for="star3" title="Bình thường"></label>

                                    <input type="radio" id="star2" name="rating" value="2">
                                    <label for="star2" title="Tệ"></label>

                                    <input type="radio" id="star1" name="rating" value="1">
                                    <label for="star1" title="Rất tệ"></label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="comment_text">Bình luận của bạn</label>
                                <textarea id="comment_text" name="comment_text" rows="4"
                                          placeholder="Chia sẻ cảm nhận của bạn về sản phẩm..."></textarea>
                            </div>

                            <button type="submit" class="cta-button">Gửi đánh giá</button>
                        </form>
                    </div>

                    <hr class="review-divider">

                    <div class="review-list">
                        <h3>Tất cả đánh giá (2)</h3>

                        <div class="review-item">
                            <div class="review-avatar">
                                <img src="https://placehold.co/60x60/eeeeee/white?text=User" alt="Avatar">
                            </div>
                            <div class="review-content">
                                <div class="review-author">Nguyễn Văn A</div>
                                <div class="review-meta">
                                    <div class="star-rating-display">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i> </div>
                                    <span class="review-date">11/11/2025</span>
                                </div>
                                <p class="review-body">
                                    Sản phẩm rất tốt, milk foam lên vị béo ngậy, thơm mùi trứng muối. Sẽ ủng hộ shop dài dài!
                                </p>
                            </div>
                        </div>

                        <div class="review-item">
                            <div class="review-avatar">
                                <img src="https://placehold.co/60x60/eeeeee/white?text=User" alt="Avatar">
                            </div>
                            <div class="review-content">
                                <div class="review-author">Trần Thị B</div>
                                <div class="review-meta">
                                    <div class="star-rating-display">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="far fa-star"></i> </div>
                                    <span class="review-date">10/11/2025</span>
                                </div>
                                <p class="review-body">
                                    Dễ sử dụng, pha với nước lạnh là lên bọt.
                                </p>
                            </div>
                        </div>

                    </div> </div>
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