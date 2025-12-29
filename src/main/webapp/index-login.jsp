<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<section class="hero-banner">
    <div class="slideshow-container">

        <div class="hero-slide fade active" style="background-image: url('assets/images/tra-thao-moc-hero-banner.jpg');">
            <div class="hero-content">
                <h1>Mừng Quốc Tế Phụ Nữ 8/3</h1>
                <p>Trao gửi yêu thương - Tặng kèm hộp quà cao cấp cho đơn từ 299k.</p>
                <a href="khuyen-mai.jsp" class="hero-btn">Săn Deal Ngay</a>
            </div>
        </div>

        <div class="hero-slide fade" style="background-image: url('assets/images/nguyen-lieu-pha-tra-herobanner.jpg')">
            <div class="hero-content">
                <h1>Xả Kho Nguyên Liệu -50%</h1>
                <p>Cơ hội duy nhất trong năm. Số lượng có hạn!</p>
                <a href="san-pham.jsp?promotionId=2" class="hero-btn">Mua Ngay</a>
            </div>
        </div>

        <a class="prev" onclick="plusSlider(-1)">&#10094;</a>
        <a class="next" onclick="plusSlider(1)">&#10095;</a>
    </div>

    <div class="slider-dots">
        <span class="dot" onclick="currentSlider(1)"></span>
        <span class="dot" onclick="currentSlider(2)"></span>
    </div>
</section>

<section class="category-split">
    <div class="container">
        <div class="category-box" style="background-image: url('assets/images/tra-thao-moc.webp');">
            <h2>TRÀ THẢO MỘC & SỨC KHỎE</h2>
            <a href="#" class="cta-button-outline">Xem Tất Cả</a>
        </div>
        <div class="category-box" style="background-image: url('assets/images/san-pham-tran-chau-den-4.jpg');">
            <h2>NGUYÊN LIỆU TRÀ SỮA DIY</h2>
            <a href="#" class="cta-button-outline">Trổ Tài Pha Chế</a>
        </div>
    </div>
</section>

<section class="product-showcase">
    <div class="container">
        <h2>BÁN CHẠY: TRÀ THƠM CHẤT LƯỢNG</h2>
        <div class="product-grid">
            <div class="product-card">
                <img src="assets/images/san-pham-hong-tra.jpg" alt="Hồng Trà Shan Tuyết">
                <h3>Hồng Trà Shan Tuyết</h3>
                <p class="price">
                    97.000 VNĐ
                </p>
                <a href="chi-tiet-san-pham-hong-tra.jsp" class="cta-button">Xem Chi Tiết</a>
            </div>
            <div class="product-card">
                <span class="sale-tag">-8%</span>
                <img src ="assets/images/san-pham-tra-gung-mat-ong.jpg" alt="Sản Phẩm Sale">
                <h3>Trà Gừng Mật Ong</h3>
                <p class="price">
                    <span class="new-price">79.000 VNĐ</span> <span class="old-price">86.000 VNĐ</span> </p>
                <a href="chi-tiet-san-pham-tra-gung-mat-ong.jsp" class="cta-button">Xem Chi Tiết</a>
            </div>
            <div class="product-card">
                <img src="assets/images/san-pham-tra-lai.jpg" alt="Lục Trà Lài">
                <h3>Lục Trà Lài</h3>
                <p class="price">
                    182.000 VNĐ
                </p>
                <a href="chi-tiet-san-pham-tra-lai.jsp" class="cta-button">Xem Chi Tiết</a>
            </div>
            <div class="product-card">
                <img src="assets/images/san-pham-tra-bac-ha.jpg" alt="Trà Bạc Hà">
                <h3>Trà Bạc Hà</h3>
                <p class="price">
                    80.000 VNĐ
                </p>
                <a href="chi-tiet-san-pham-tra-bac-ha.jsp" class="cta-button">Xem Chi Tiết</a>
            </div>
        </div>
    </div>
</section>

<section class="product-showcase bg-light">
    <div class="container">
        <h2>BÁN CHẠY: NGUYÊN LIỆU TRÀ SỮA</h2>
        <div class="product-grid">
            <div class="product-card">
                <img src="assets/images/san-pham-bot-milk-foam.jpg" alt="Bột Milk Foam">
                <h3>Bột Milk Foam</h3>
                <p class="price">
                    89.000 VNĐ
                </p>
                <a href="chi-tiet-san-pham-bot-milk-foam-trung-muoi.jsp" class="cta-button">Xem Chi Tiết</a>
            </div>
            <div class="product-card">
                <img src="assets/images/san-pham-bot-sua-beo.jpg" alt="Bột Sữa Béo">
                <h3>Bột Sữa Béo</h3>
                <p class="price">
                    70.000 VNĐ
                </p>
                <a href="chi-tiet-san-pham-bot-sua-beo.jsp" class="cta-button">Xem Chi Tiết</a>
            </div>
            <div class="product-card">
                <span class="sale-tag">-10%</span>
                <img src ="assets/images/san-pham-tran-chau-den-1.jpg" alt="Sản Phẩm Sale">
                <h3>Trân Châu Đường Đen</h3>
                <p class="price">
                    <span class="new-price">45.000 VNĐ</span> <span class="old-price">50.000 VNĐ</span> </p>
                <a href="chi-tiet-san-pham-tran-chau-den.jsp" class="cta-button">Xem Chi Tiết</a>
            </div>
            <div class="product-card">
                <img src="assets/images/san-pham-bot-milk-foam.jpg" alt="Bột Milk Foam">
                <h3>Bột Milk Foam</h3>
                <p class="price">
                    89.000 VNĐ
                </p>
                <a href="chi-tiet-san-pham-bot-milk-foam-trung-muoi.jsp" class="cta-button">Xem Chi Tiết</a>
            </div>
        </div>
    </div>
</section>

<section class="blog-preview">
    <div class="container">
        <h2>CÔNG THỨC & BLOG</h2>
        <div class="blog-grid">
            <div class="blog-card">
                <img src="assets/images/loi-ich-tra-hoa-cuc.jpg" alt="">
                <h3>5 Lợi Ích Bất Ngờ Của Trà Hoa Cúc</h3>
                <div class ="blog-card-meta">
                                <span class="meta-item">
                                    <i class="icon-eye"></i>
                                    <span>1.234 Lượt xem</span>
                                </span>
                    <span class="meta-item">
                                    <i class="icon-calendar"></i>
                                    <span>11/11/2025</span>
                                </span>
                </div>
                <p>Trà hoa cúc không chỉ là một thức uống thơm ngon, thư giãn mà còn mang lại vô vàn lợi ích
                    cho sức khỏe, đặc biệt là cải thiện giấc ngủ...</p>

                <a href="chi-tiet-blog.jsp">Đọc Thêm</a>
            </div>
            <div class="blog-card">
                <img src="assets/images/loi-ich-tra-hoa-cuc.jpg" alt="">
                <h3>5 Lợi Ích Bất Ngờ Của Trà Hoa Cúc</h3>
                <div class ="blog-card-meta">
                                <span class="meta-item">
                                    <i class="icon-eye"></i>
                                    <span>1.234 Lượt xem</span>
                                </span>
                    <span class="meta-item">
                                    <i class="icon-calendar"></i>
                                    <span>11/11/2025</span>
                                </span>
                </div>
                <p>Trà hoa cúc không chỉ là một thức uống thơm ngon, thư giãn mà còn mang lại vô vàn lợi ích
                    cho sức khỏe, đặc biệt là cải thiện giấc ngủ...</p>

                <a href="chi-tiet-blog.jsp">Đọc Thêm</a>
            </div>
            <div class="blog-card">
                <img src="assets/images/loi-ich-tra-hoa-cuc.jpg" alt="">
                <h3>5 Lợi Ích Bất Ngờ Của Trà Hoa Cúc</h3>
                <div class ="blog-card-meta">
                                <span class="meta-item">
                                    <i class="icon-eye"></i>
                                    <span>1.234 Lượt xem</span>
                                </span>
                    <span class="meta-item">
                                    <i class="icon-calendar"></i>
                                    <span>11/11/2025</span>
                                </span>
                </div>
                <p>Trà hoa cúc không chỉ là một thức uống thơm ngon, thư giãn mà còn mang lại vô vàn lợi ích
                    cho sức khỏe, đặc biệt là cải thiện giấc ngủ...</p>

                <a href="chi-tiet-blog.jsp">Đọc Thêm</a>
            </div>
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
            if (i !== slideIndex - 1) {
                slides[i].style.display = "none";
            }
        }
    }, 1500);
}

let autoTimer;
function startAutoSlide() {
    clearTimeout(autoTimer);
    autoTimer = setTimeout(() => {
        plusSlider(1);
    }, 8000); 
}
// back to top button 
window.addEventListener('scroll', function() {
    const backToTopButton = document.getElementById('backToTop');
    if (window.pageYOffset > 300) {
        backToTopButton.classList.add('show');
    } else {
        backToTopButton.classList.remove('show');
    }
});

document.getElementById('backToTop').addEventListener('click', function() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
});
</script>
</body>
</html>