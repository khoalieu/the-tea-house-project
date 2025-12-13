<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="top-bar">
    <div class="container">
        <div class="top-bar__left">
                <span>
                    <i class="fa-solid fa-envelope"></i> contact@moctra.com
                </span>
            <span>
                    <i class="fa-solid fa-phone"></i> 0888 531 015
                </span>
        </div>
        <div class="top-bar__right">
            <i class="fa-brands fa-facebook"></i>
            <i class="fa-brands fa-instagram"></i>
            <i class="fa-brands fa-twitter"></i>
        </div>
    </div>
</div>
<header class="utility-header">
    <div class="header-left">
        <nav class="main-nav">
            <div class="container">
                <ul>
                    <li>
                        <div class="logo">
                            <a href="index.html">
                                <img src="assets/images/logoweb.png" alt="Tea Shop Logo">
                            </a>
                        </div>
                    </li>
                    <li><a href="index.html" class="active">TRANG CHỦ</a></li>
                    <li class="has-dropdown">
                        <a href="san-pham.jsp">SẢN PHẨM</a>

                        <div class="dropdown-menu">
                            <div class="dropdown-column">
                                <h3>Trà Thảo Mộc</h3>
                                <ul>
                                    <li><a href="san-pham.jsp?category=tra-thao-moc">...</a></li>
                                </ul>
                            </div>
                            <div class="dropdown-column">
                                <h3>Nguyên Liệu Trà Sữa</h3>
                                <ul>
                                    <li><a href="san-pham.jsp?category=nguyen-lieu-tra-sua">Trà Nền Pha Chế</a></li>
                                    <li><a href="san-pham.jsp?category=nguyen-lieu-tra-sua">Bột Pha Chế</a></li>
                                    <li><a href="san-pham.jsp?category=nguyen-lieu-tra-sua">Topping & Trân Châu</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li><a href="blog.jsp">CÔNG THỨC & BLOG</a></li>
                    <li class="has-dropdown">
                        <a href="ve-chung-toi.jsp">VỀ CHÚNG TÔI</a>
                        <div class="dropdown-menu">
                            <div class="dropdown-column">
                                <h3>Câu Chuyện Về Trà</h3>
                                <ul>
                                    <li><a href="ve-chung-toi.jsp">Câu Chuyện Của Chúng Tôi</a></li>
                                    <li><a href="tra-thao-moc.jsp">Hành Trình Của Những Tách Trà</a></li>
                                    <li><a href="tra-sua-nguyen-lieu.jsp">Thông Tin Về Trà Sữa Nguyên Liệu</a></li>
                                </ul>
                            </div>
                            <div class="dropdown-column">
                                <h3>Thông Tin Và Chính Sách</h3>
                                <ul>
                                    <li><a href="chinh-sach-ban-hang.jsp">Chính Sách Bán Hàng</a></li>
                                    <li><a href="chinh-sach-thanh-toan.jsp">Chính Sách Thanh Toán</a></li>
                                    <li><a href="chinh-sach-bao-hanh.jsp">Chính Sách Bảo Hành</a></li>
                                    <li><a href="dieu-khoan-dich-vu.jsp">Điều Khoản Dịch Vụ</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li><a href="khuyen-mai.jsp">KHUYẾN MÃI</a></li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="header-right">
        <div class="container">
            <div class="header-right__content">
                <div class="search-bar">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <input type="text" placeholder="Bạn muốn tìm gì...">
                </div>
                <div class="cart-container">
                    <span class="cart-text">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span><a href="gio-hang.jsp">Giỏ Hàng (3)</a></span>
                    </span>
                    <div class="cart-dropdown">
                        <div class="cart-dropdown-header">
                            <h3>Giỏ hàng của bạn</h3>
                        </div>
                        <div class="cart-items">
                            <div class="cart-item">
                                <img src="assets/images/logoweb.png" alt="Trà giải nhiệt CHANH DÂY KIM QUẤT">
                                <div class="cart-item-info">
                                    <h4>Trà giải nhiệt CHANH DÂY KIM QUẤT - Hộp 15 gói</h4>
                                    <p class="cart-item-quantity">2 × <span class="cart-item-price">159.000đ</span></p>
                                </div>
                            </div>
                            <div class="cart-item">
                                <img src="assets/images/logoweb.png" alt="Trà Atiso">
                                <div class="cart-item-info">
                                    <h4>Trà Atiso - Hộp 20 gói</h4>
                                    <p class="cart-item-quantity">1 × <span class="cart-item-price">120.000đ</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="cart-dropdown-footer">
                            <div class="cart-total">
                                <span>Tổng tiền:</span>
                                <span class="total-price">318.000đ</span>
                            </div>
                            <div class="cart-actions">
                                <a href="gio-hang.jsp" class="btn-view-cart">XEM GIỎ HÀNG</a>
                                <a href="thanh-toan.jsp" class="btn-checkout">THANH TOÁN</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="user-account">
                    <span class="user-icons">
                        <i class="fa-solid fa-user"></i>
                    </span>
                    <div class="user-dropdown">
                        <a href="login.jsp">Đăng nhập</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>