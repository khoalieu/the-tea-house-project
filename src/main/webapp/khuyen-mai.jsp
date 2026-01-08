<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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

    <c:forEach var="entry" items="${promoMap}">
        <c:set var="promo" value="${entry.key}" />
        <c:set var="productList" value="${entry.value}" />

        <section class="campaign-section">
            <div class="container">
                <div class="campaign-header">
                    <div class="campaign-header__left">
                        <h2>🎉 ${promo.name}</h2>
                        <div class="campaign-timer">
                            <i class="fa-regular fa-clock"></i>
                            Kết thúc: <fmt:parseDate value="${promo.endDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both" />
                            <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" />
                        </div>
                    </div>
                    <div class="campaign-header__right">
                        <a href="san-pham?promotionId=${promo.id}" class="btn-view-all">
                            Xem tất cả <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>

                <div class="product-grid">
                    <c:forEach var="p" items="${productList}">
                        <div class="product-card">
                            <c:if test="${p.price > p.salePrice}">
                                <span class="sale-tag">
                                    -<fmt:formatNumber value="${(p.price - p.salePrice) / p.price * 100}" maxFractionDigits="0"/>%
                                </span>
                            </c:if>

                            <img src="${p.imageUrl}" alt="${p.name}">
                            <h3>${p.name}</h3>
                            <p class="price">
                                <span class="new-price">
                                    <fmt:formatNumber value="${p.salePrice}" pattern="#,###"/> VNĐ
                                </span>
                                <span class="old-price">
                                    <fmt:formatNumber value="${p.price}" pattern="#,###"/> VNĐ
                                </span>
                            </p>
                            <a href="chi-tiet-san-pham.jsp?id=${p.id}" class="cta-button">Xem Chi Tiết</a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </c:forEach>

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