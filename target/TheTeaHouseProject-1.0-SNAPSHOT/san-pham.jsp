<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trà Thảo Mộc & Trà Sữa DIY</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<main class="main-content">
    <section class="page-header">
        <div class="container">
            <h1>Tất Cả Sản Phẩm</h1>
        </div>
    </section>

    <section class="shop-layout">
        <div class="container">
            <aside class="shop-sidebar">
                <div class="filter-group">
                    <h3>Danh Mục Sản Phẩm</h3>
                    <ul class="category-filter-list">

                        <li class="category-parent all-products active">
                            <a href="san-pham.html">Tất Cả Sản Phẩm</a>
                        </li>

                        <li class="category-parent">
                            <a href="san-pham.html?category=tra-thao-moc">Trà Thảo Mộc (12)</a>
                        </li>

                        <li class="category-parent">
                            <a href="san-pham.html?category=nguyen-lieu-tra-sua">Nguyên Liệu Trà Sữa (17)</a>

                            <ul class="category-child-list">
                                <li><a href="#">Trà Nền Pha Chế (5)</a></li>
                                <li><a href="#">Bột Pha Chế (4)</a></li>
                                <li><a href="#">Topping & Trân Châu (4)</a></li>
                                <li><a href="#">Khác... (4)</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="filter-group">
                    <h3>Lọc Theo Giá</h3>
                    <input type="range" min="0" max="500000" style="width: 100%;">
                    <p>Giá: 0 VNĐ — 500.000 VNĐ</p>
                </div>
            </aside>

            <div class="shop-grid-wrapper">
                <div class="sort-bar">
                    <label for="sort-by">Sắp xếp theo:</label>
                    <select id="sort-by" class="sort-select">
                        <option value="default">Mặc định</option>
                        <option value="newest">Mới nhất</option>
                        <option value="price-asc">Giá: Thấp đến Cao</option>
                        <option value="price-desc">Giá: Cao đến Thấp</option>
                        <option value="name-asc">Tên: A-Z</option>
                    </select>
                </div>

                <section class="product-group">
                    <h2 class="group-title">Trà Thảo Mộc</h2>
                    <div class="product-grid">
                        <div class="product-card">
                            <img src="assets/images/san-pham-tra-lai.jpg" alt="Lục Trà Lài">
                            <h3>Lục Trà Lài</h3>
                            <p class="price">
                                182.000 VNĐ
                            </p>
                            <a href="chi-tiet-san-pham-tra-lai.jsp" class="cta-button">Xem Chi Tiết</a>
                        </div>

                        <div class="product-card">
                            <img src="assets/images/san-pham-hong-tra.jpg" alt="Hồng Trà Shan Tuyết">
                            <h3>Hồng Trà Shan Tuyết</h3>
                            <p class="price">
                                97.000 VNĐ
                            </p>
                            <a href="chi-tiet-san-pham-hong-tra.jsp" class="cta-button">Xem Chi Tiết</a>
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
                </section>

                <section class="product-group">
                    <h2 class="group-title">Nguyên Liệu Trà Sữa</h2>
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
                            <span class="sale-tag">-10%</span>
                            <img src ="assets/images/san-pham-tran-chau-den-1.jpg" alt="Sản Phẩm Sale">
                            <h3>Trân Châu Đường Đen</h3>
                            <p class="price">
                                <span class="new-price">45.000 VNĐ</span> <span class="old-price">50.000 VNĐ</span> </p>
                            <a href="chi-tiet-san-pham-tran-chau-den.jsp" class="cta-button">Xem Chi Tiết</a>
                        </div>
                        <div class="product-card">
                            <img src="assets/images/san-pham-bot-sua-beo.jpg" alt="Bột Sữa Béo">
                            <h3>Bột Sữa Béo</h3>
                            <p class="price">
                                70.000 VNĐ
                            </p>
                            <a href="chi-tiet-san-pham-bot-sua-beo.jsp" class="cta-button">Xem Chi Tiết</a>
                        </div>
                    </div>
                </section>

                <div class="pagination">
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">&raquo;</a>
                </div>
            </div>
        </div>
    </section>
</main>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>

</body>
</html>