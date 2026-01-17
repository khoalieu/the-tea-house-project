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

    <section class="slider-container">
        <button class="slider-btn slider-prev"><i class="fa-solid fa-chevron-left"></i></button>
        <button class="slider-btn slider-next"><i class="fa-solid fa-chevron-right"></i></button>

        <c:forEach var="promo" items="${activePromotions}" varStatus="status">
            <div class="slide ${status.first ? 'active' : ''}"
                 style="background-image: url('${pageContext.request.contextPath}/${promo.imageUrl}');">

                <div class="promo-hero__overlay">
                    <h1>${promo.name}</h1>
                    <p>${promo.description}</p>
                    <a href="san-pham?promotionId=${promo.id}" class="btn-hero">Xem Ngay</a>
                </div>
            </div>
        </c:forEach>

        <div class="slider-dots">
            <c:forEach items="${activePromotions}" varStatus="status">
                <div class="dot ${status.first ? 'active' : ''}"></div>
            </c:forEach>
        </div>
    </section>
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
                <div style="text-align: center; margin-top: 30px;">
                    <a href="san-pham?promotionId=${promo.id}" class="btn-hero"
                       style="background: #fff; color: #333; border: 1px solid #333; padding: 10px 40px;">
                        Xem thêm sản phẩm <strong>${promo.name}</strong> <i class="fa-solid fa-arrow-right"></i>
                    </a>
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
        console.log("Slider Script đang chạy...");

        const slides = document.querySelectorAll('.slide');
        const dots = document.querySelectorAll('.dot');
        const nextBtn = document.querySelector('.slider-next');
        const prevBtn = document.querySelector('.slider-prev');

        let currentSlide = 0;
        const totalSlides = slides.length;
        let slideInterval;

        if (slides.length === 0) {
            console.error("Không tìm thấy class .slide nào!");
            return;
        }

        function clearActive() {
            slides.forEach(slide => {
                slide.classList.remove('active');
            });
            dots.forEach(dot => {
                dot.classList.remove('active');
            });
        }

        function showSlide(index) {
            console.log("Chuyển sang slide: " + index);

            if (index >= totalSlides) currentSlide = 0;
            else if (index < 0) currentSlide = totalSlides - 1;
            else currentSlide = index;

            clearActive();

            slides[currentSlide].classList.add('active');

            if(dots.length > 0 && dots[currentSlide]) {
                dots[currentSlide].classList.add('active');
            }
        }

        function nextSlide() { showSlide(currentSlide + 1); }
        function prevSlide() { showSlide(currentSlide - 1); }

        function startAutoSlide() { slideInterval = setInterval(nextSlide, 4000); }
        function stopAutoSlide() { clearInterval(slideInterval); }

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

        dots.forEach((dot, index) => {
            dot.addEventListener('click', () => {
                showSlide(index);
                stopAutoSlide();
                startAutoSlide();
            });
        });

        startAutoSlide();
    });
</script>
</body>
</html>