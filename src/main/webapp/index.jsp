<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trà Thảo Mộc & Trà Sữa DIY</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>

<section class="hero-banner">
    <div class="slideshow-container">

        <c:choose>
            <c:when test="${not empty activePromotions}">
                <c:forEach var="b" items="${activePromotions}" varStatus="st">
                    <div class="hero-slide fade ${st.first ? 'active' : ''}"
                         style="background-image: url('${pageContext.request.contextPath}/${b.imageUrl}');">
                        <div class="hero-content">
                            <c:if test="${not empty b.title}">
                                <h1>${b.title}</h1>
                            </c:if>

                            <c:if test="${not empty b.subtitle}">
                                <p>${b.subtitle}</p>
                            </c:if>

                            <c:if test="${not empty b.buttonLink}">
                                <a href="${pageContext.request.contextPath}/${b.buttonLink}"
                                   class="hero-btn">
                                    <c:choose>
                                        <c:when test="${not empty b.buttonText}">${b.buttonText}</c:when>
                                        <c:otherwise>Xem ngay</c:otherwise>
                                    </c:choose>
                                </a>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>

                <a class="prev" onclick="plusSlider(-1)">&#10094;</a>
                <a class="next" onclick="plusSlider(1)">&#10095;</a>
            </c:when>

            <c:otherwise>
                <!-- Fallback nếu chưa có promotion -->
                <div class="hero-slide fade active" style="background-image: url('assets/images/tra-thao-moc-hero-banner.jpg');">
                    <div class="hero-content">
                        <h1>Mộc Trà</h1>
                        <p>Chào mừng bạn đến với Mộc Trà.</p>
                        <a href="${pageContext.request.contextPath}/san-pham" class="hero-btn">Xem Sản Phẩm</a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

    </div>

    <c:if test="${not empty activePromotions}">
        <div class="slider-dots">
            <c:forEach items="${activePromotions}" varStatus="st">
                <span class="dot ${st.first ? 'active' : ''}" onclick="currentSlider(${st.index + 1})"></span>
            </c:forEach>
        </div>
    </c:if>
</section>

<section class="category-split">
    <div class="container">
        <div class="category-box" style="background-image: url('assets/images/tra-thao-moc.webp');">
            <h2>TRÀ THẢO MỘC & SỨC KHỎE</h2>
            <a href="${pageContext.request.contextPath}/san-pham?category=1" class="cta-button-outline">Xem Tất Cả</a>
        </div>
        <div class="category-box" style="background-image: url('assets/images/san-pham-tran-chau-den-4.jpg');">
            <h2>NGUYÊN LIỆU TRÀ SỮA DIY</h2>
            <a href="${pageContext.request.contextPath}/san-pham?category=2" class="cta-button-outline">Trổ Tài Pha Chế</a>
        </div>
    </div>
</section>

<section class="product-showcase">
    <div class="container">
        <h2>BÁN CHẠY: TRÀ THƠM CHẤT LƯỢNG</h2>

        <div class="product-grid">
            <c:forEach var="p" items="${topHerbalTea}">
                <div class="product-card">

                    <c:if test="${p.salePrice > 0 && p.salePrice < p.price}">
                        <span class="sale-tag">
                            -<fmt:formatNumber value="${(p.price - p.salePrice) / p.price * 100}" maxFractionDigits="0"/>%
                        </span>
                    </c:if>

                    <img src="${pageContext.request.contextPath}/${p.imageUrl}" alt="${p.name}">
                    <h3>${p.name}</h3>

                    <p class="price">
                        <c:choose>
                            <c:when test="${p.salePrice > 0 && p.salePrice < p.price}">
                                <span class="new-price">
                                    <fmt:formatNumber value="${p.salePrice}" pattern="#,###"/> VNĐ
                                </span>
                                <span class="old-price">
                                    <fmt:formatNumber value="${p.price}" pattern="#,###"/> VNĐ
                                </span>
                            </c:when>
                            <c:otherwise>
                                <fmt:formatNumber value="${p.price}" pattern="#,###"/> VNĐ
                            </c:otherwise>
                        </c:choose>
                    </p>

                    <a href="${pageContext.request.contextPath}/chi-tiet-san-pham?id=${p.id}" class="cta-button">Xem Chi Tiết</a>
                </div>
            </c:forEach>
        </div>

    </div>
</section>

<section class="product-showcase bg-light">
    <div class="container">
        <h2>BÁN CHẠY: NGUYÊN LIỆU TRÀ SỮA</h2>

        <div class="product-grid">
            <c:forEach var="p" items="${topMilkTeaIngredients}">
                <div class="product-card">

                    <c:if test="${p.salePrice > 0 && p.salePrice < p.price}">
                        <span class="sale-tag">
                            -<fmt:formatNumber value="${(p.price - p.salePrice) / p.price * 100}" maxFractionDigits="0"/>%
                        </span>
                    </c:if>

                    <img src="${pageContext.request.contextPath}/${p.imageUrl}" alt="${p.name}">
                    <h3>${p.name}</h3>

                    <p class="price">
                        <c:choose>
                            <c:when test="${p.salePrice > 0 && p.salePrice < p.price}">
                                <span class="new-price">
                                    <fmt:formatNumber value="${p.salePrice}" pattern="#,###"/> VNĐ
                                </span>
                                <span class="old-price">
                                    <fmt:formatNumber value="${p.price}" pattern="#,###"/> VNĐ
                                </span>
                            </c:when>
                            <c:otherwise>
                                <fmt:formatNumber value="${p.price}" pattern="#,###"/> VNĐ
                            </c:otherwise>
                        </c:choose>
                    </p>

                    <a href="${pageContext.request.contextPath}/chi-tiet-san-pham?id=${p.id}" class="cta-button">Xem Chi Tiết</a>
                </div>
            </c:forEach>
        </div>

    </div>
</section>

<section class="blog-preview">
    <div class="container">
        <h2>CÔNG THỨC & BLOG</h2>

        <div class="blog-grid">
            <c:if test="${empty topBlogs}">
                <p style="text-align:center; padding: 20px;">Chưa có bài viết nổi bật.</p>
            </c:if>
            <c:forEach var="b" items="${topBlogs}">
                <div class="blog-card">
                    <img src="${b.featuredImage}" alt="/">
                    <h3>${b.title}</h3>

                    <div class="blog-card-meta">
                        <span class="meta-item">
                            <i class="fa-solid fa-eye"></i>
                            <span>${b.viewsCount} Lượt xem</span>
                        </span>
                        <span class="meta-item">
                            <i class="fa-solid fa-calendar"></i>
                            <span><fmt:formatDate value="${b.createdAtDate}" pattern="dd/MM/yyyy"/></span>
                        </span>
                    </div>

                    <p>${empty b.excerpt ? '(Chưa có mô tả)' : b.excerpt}</p>

                    <a href="${pageContext.request.contextPath}/chi-tiet-blog?slug=${b.slug}">Đọc Thêm</a>
                </div>
            </c:forEach>
        </div>

    </div>
</section>

<jsp:include page="common/footer.jsp"></jsp:include>

<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>

<script>
    let slideIndex = 1;
    let isTransitioning = false;
    let autoTimer;

    document.addEventListener('DOMContentLoaded', function() {
        showSlider(slideIndex);
        startAutoSlide();
    });

    function plusSlider(n) {
        if (!isTransitioning) {
            clearTimeout(autoTimer);
            showSlider(slideIndex += n);
            startAutoSlide();
        }
    }

    function currentSlider(n) {
        if (!isTransitioning) {
            clearTimeout(autoTimer);
            showSlider(slideIndex = n);
            startAutoSlide();
        }
    }

    function showSlider(n) {
        const slides = document.getElementsByClassName("hero-slide");
        const dots = document.getElementsByClassName("dot");

        if (slides.length === 0 || isTransitioning) return;

        isTransitioning = true;

        if (n > slides.length) { slideIndex = 1; }
        if (n < 1) { slideIndex = slides.length; }

        for (let i = 0; i < slides.length; i++) {
            slides[i].style.display = "flex";
            slides[i].style.opacity = "0";
            slides[i].classList.remove("active");
        }

        for (let i = 0; i < dots.length; i++) {
            dots[i].classList.remove("active");
        }

        setTimeout(() => {
            if (slides[slideIndex - 1]) {
                slides[slideIndex - 1].style.opacity = "1";
                slides[slideIndex - 1].classList.add("active");
            }
            if (dots[slideIndex - 1]) {
                dots[slideIndex - 1].classList.add("active");
            }
        }, 50);

        setTimeout(() => {
            isTransitioning = false;
            for (let i = 0; i < slides.length; i++) {
                if (i !== slideIndex - 1) slides[i].style.display = "none";
            }
        }, 1500);
    }

    function startAutoSlide() {
        clearTimeout(autoTimer);
        autoTimer = setTimeout(() => plusSlider(1), 8000);
    }

    // back to top button
    window.addEventListener('scroll', function() {
        const backToTopButton = document.getElementById('backToTop');
        if (!backToTopButton) return;

        if (window.pageYOffset > 300) backToTopButton.classList.add('show');
        else backToTopButton.classList.remove('show');
    });

    document.getElementById('backToTop')?.addEventListener('click', function() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
</script>

</body>
</html>
