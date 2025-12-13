<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Săn Deal Giá Hời - Mộc Trà</title>

    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/promotion.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<main class="main-content">

    <section class="promo-hero">
        <div class="promo-hero__overlay">
            <h1>Săn Deal Giá Hời</h1>
            <p>Tổng hợp các chương trình khuyến mãi hot nhất tại Mộc Trà</p>
        </div>
    </section>

    <section class="campaign-section">
        <div class="container">
            <div class="campaign-header">
                <div class="campaign-header__left">
                    <h2>🎉 Mừng Lễ 8/3 - Ngọt Ngào Hương Trà</h2>
                    <div class="campaign-timer">
                        <i class="fa-regular fa-clock"></i> Kết thúc: 02 ngày 10:30:00
                    </div>
                </div>
                <div class="campaign-header__right">
                    <a href="san-pham.jsp?promotionId=1" class="btn-view-all">
                        Xem tất cả <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
            </div>

            <div class="product-grid">
                <div class="product-card">
                    <span class="sale-tag">-20%</span>
                    <img src="assets/images/san-pham-tra-hoa-cuc.jpg" alt="Trà Hoa Cúc">
                    <h3>500g Trà Hoa Cúc Vàng</h3>
                    <p class="price">
                        <span class="new-price">96.000 VNĐ</span> <span class="old-price">120.000 VNĐ</span>
                    </p>
                    <a href="chi-tiet-san-pham-tra-hoa-cuc.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <span class="sale-tag">-15%</span>
                    <img src="assets/images/san-pham-tra-atiso.jpg" alt="Trà Atiso">
                    <h3>Trà Atiso Túi Lọc</h3>
                    <p class="price">
                        <span class="new-price">60.000 VNĐ</span> <span class="old-price">70.000 VNĐ</span>
                    </p>
                    <a href="chi-tiet-san-pham-tra-atiso.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <span class="sale-tag">-10%</span>
                    <img src="assets/images/san-pham-tra-lai.jpg" alt="Trà Lài">
                    <h3>Trà Lài Thượng Hạng</h3>
                    <p class="price">
                        <span class="new-price">90.000 VNĐ</span> <span class="old-price">100.000 VNĐ</span>
                    </p>
                    <a href="chi-tiet-san-pham-tra-lai.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <span class="sale-tag">-5%</span>
                    <img src="assets/images/san-pham-tra-bac-ha.jpg" alt="Trà Bạc Hà">
                    <h3>Trà Bạc Hà Sấy Lạnh</h3>
                    <p class="price">
                        <span class="new-price">55.000 VNĐ</span> <span class="old-price">58.000 VNĐ</span>
                    </p>
                    <a href="chi-tiet-san-pham-tra-bac-ha.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
            </div>
        </div>
    </section>

    <section class="campaign-section bg-light">
        <div class="container">
            <div class="campaign-header">
                <div class="campaign-header__left">
                    <h2>📦 Xả Kho Nguyên Liệu</h2>
                    <p class="campaign-sub">Giảm giá cực sâu các loại trân châu, bột sữa.</p>
                </div>
                <div class="campaign-header__right">
                    <a href="san-pham.jsp?promotionId=2" class="btn-view-all">
                        Xem tất cả <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
            </div>

            <div class="product-grid">
                <div class="product-card">
                    <span class="sale-tag">-30%</span>
                    <img src="assets/images/san-pham-tran-chau-den-1.jpg" alt="Trân châu">
                    <h3>Trân Châu Đường Đen</h3>
                    <p class="price">
                        <span class="new-price">35.000 VNĐ</span> <span class="old-price">50.000 VNĐ</span>
                    </p>
                    <a href="chi-tiet-san-pham-tran-chau-den.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <span class="sale-tag">-25%</span>
                    <img src="assets/images/san-pham-bot-sua-beo.jpg" alt="Bột sữa">
                    <h3>Bột Sữa Béo B-One</h3>
                    <p class="price">
                        <span class="new-price">45.000 VNĐ</span> <span class="old-price">60.000 VNĐ</span>
                    </p>
                    <a href="chi-tiet-san-pham-bot-sua-beo.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <span class="sale-tag">-20%</span>
                    <img src="assets/images/san-pham-bot-milk-foam.jpg" alt="Milk Foam">
                    <h3>Bột Milk Foam</h3>
                    <p class="price">
                        <span class="new-price">80.000 VNĐ</span> <span class="old-price">100.000 VNĐ</span>
                    </p>
                    <a href="chi-tiet-san-pham-bot-milk-foam-trung-muoi.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <span class="sale-tag">-15%</span>
                    <img src="assets/images/san-pham-hong-tra.jpg" alt="Hồng Trà">
                    <h3>Hồng Trà Đặc Biệt</h3>
                    <p class="price">
                        <span class="new-price">85.000 VNĐ</span> <span class="old-price">100.000 VNĐ</span>
                    </p>
                    <a href="chi-tiet-san-pham-hong-tra.jsp" class="cta-button">Xem Chi Tiết</a>
                </div>
            </div>
        </div>
    </section>
    <section class="campaign-section">
        <div class="container">
            <div class="campaign-header">
                <div class="campaign-header__left">
                    <h2>🔥 Deal Hot Mỗi Ngày</h2>
                    <p class="campaign-sub">Săn ngay kẻo lỡ, giá tốt chỉ trong 24h</p>
                </div>
            </div>

            <div class="product-grid">
                <div class="product-card">
                    <span class="sale-tag">-50%</span>
                    <img src="assets/images/san-pham-bot-milk-foam.jpg" alt="Milk Foam">
                    <h3>Bột Milk Foam (Deal Sốc)</h3>
                    <p class="price">
                        <span class="new-price">50.000 VNĐ</span> <span class="old-price">100.000 VNĐ</span>
                    </p>
                    <a href="#" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <span class="sale-tag">-50%</span>
                    <img src="assets/images/san-pham-bot-milk-foam.jpg" alt="Milk Foam">
                    <h3>Bột Milk Foam (Deal Sốc)</h3>
                    <p class="price">
                        <span class="new-price">50.000 VNĐ</span> <span class="old-price">100.000 VNĐ</span>
                    </p>
                    <a href="#" class="cta-button">Xem Chi Tiết</a>
                </div>
                <div class="product-card">
                    <span class="sale-tag">-50%</span>
                    <img src="assets/images/san-pham-bot-milk-foam.jpg" alt="Milk Foam">
                    <h3>Bột Milk Foam (Deal Sốc)</h3>
                    <p class="price">
                        <span class="new-price">50.000 VNĐ</span> <span class="old-price">100.000 VNĐ</span>
                    </p>
                    <a href="#" class="cta-button">Xem Chi Tiết</a>
                </div>
            </div>
        </div>
    </section>
</main>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        console.log("Slider Script đang chạy..."); // Mở F12 xem có dòng này không

        const slides = document.querySelectorAll('.slide');
        const dots = document.querySelectorAll('.dot');
        const nextBtn = document.querySelector('.slider-next');
        const prevBtn = document.querySelector('.slider-prev');

        let currentSlide = 0;
        const totalSlides = slides.length;
        let slideInterval;

        // Nếu không tìm thấy slide nào thì dừng ngay để tránh lỗi
        if (slides.length === 0) {
            console.error("Không tìm thấy class .slide nào!");
            return;
        }

        // Hàm Reset active
        function clearActive() {
            slides.forEach(slide => {
                slide.classList.remove('active');
            });
            dots.forEach(dot => {
                dot.classList.remove('active');
            });
        }

        // Hàm chuyển slide
        function showSlide(index) {
            console.log("Chuyển sang slide: " + index);

            // Xử lý vòng lặp index
            if (index >= totalSlides) currentSlide = 0;
            else if (index < 0) currentSlide = totalSlides - 1;
            else currentSlide = index;

            clearActive();

            // Thêm class active cho slide hiện tại
            slides[currentSlide].classList.add('active');

            // Thêm active cho dot tương ứng (nếu có dot)
            if(dots.length > 0 && dots[currentSlide]) {
                dots[currentSlide].classList.add('active');
            }
        }

        function nextSlide() {
            showSlide(currentSlide + 1);
        }

        function prevSlide() {
            showSlide(currentSlide - 1);
        }

        // Tự động chạy (Auto play)
        function startAutoSlide() {
            slideInterval = setInterval(nextSlide, 4000); // 4 giây chuyển 1 lần
        }

        function stopAutoSlide() {
            clearInterval(slideInterval);
        }

        // Gán sự kiện click nút Next/Prev
        if(nextBtn) {
            nextBtn.addEventListener('click', () => {
                nextSlide();
                stopAutoSlide();
                startAutoSlide();
            });
        }

        if(prevBtn) {
            prevBtn.addEventListener('click', () => {
                prevSlide();
                stopAutoSlide();
                startAutoSlide();
            });
        }

        // Gán sự kiện click Dot
        dots.forEach((dot, index) => {
            dot.addEventListener('click', () => {
                showSlide(index);
                stopAutoSlide();
                startAutoSlide();
            });
        });

        // Bắt đầu chạy
        startAutoSlide();
    });
</script>
</body>
</html>