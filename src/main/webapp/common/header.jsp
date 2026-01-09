<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
                            <a href="${pageContext.request.contextPath}/">
                                <img src="${pageContext.request.contextPath}/assets/images/logoweb.png" alt="Tea Shop Logo">
                            </a>
                        </div>
                    </li>

                    <li><a href="${pageContext.request.contextPath}/">TRANG CHỦ</a></li>

                    <li class="has-dropdown">
                        <a href="${pageContext.request.contextPath}/san-pham">SẢN PHẨM</a>

                        <div class="dropdown-menu">
                            <div class="dropdown-column">
                                <h3>Trà Thảo Mộc</h3>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/san-pham?category=1">Tất cả Trà Thảo Mộc</a></li>
                                </ul>
                            </div>
                            <div class="dropdown-column">
                                <h3>Nguyên Liệu Trà Sữa</h3>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/san-pham?category=2">Nguyên Liệu Pha Chế</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li><a href="${pageContext.request.contextPath}/blog">CÔNG THỨC & BLOG</a></li>

                    <li class="has-dropdown">
                        <a href="${pageContext.request.contextPath}/ve-chung-toi.jsp">VỀ CHÚNG TÔI</a>
                        <div class="dropdown-menu">
                            <div class="dropdown-column">
                                <h3>Câu Chuyện Về Trà</h3>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/ve-chung-toi.jsp">Câu Chuyện Của Chúng Tôi</a></li>
                                    <li><a href="${pageContext.request.contextPath}/tra-thao-moc.jsp">Hành Trình Của Những Tách Trà</a></li>
                                    <li><a href="${pageContext.request.contextPath}/tra-sua-nguyen-lieu.jsp">Thông Tin Về Trà Sữa Nguyên Liệu</a></li>
                                </ul>
                            </div>
                            <div class="dropdown-column">
                                <h3>Thông Tin Và Chính Sách</h3>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/chinh-sach-ban-hang.jsp">Chính Sách Bán Hàng</a></li>
                                    <li><a href="${pageContext.request.contextPath}/chinh-sach-thanh-toan.jsp">Chính Sách Thanh Toán</a></li>
                                    <li><a href="${pageContext.request.contextPath}/chinh-sach-bao-hanh.jsp">Chính Sách Bảo Hành</a></li>
                                    <li><a href="${pageContext.request.contextPath}/dieu-khoan-dich-vu.jsp">Điều Khoản Dịch Vụ</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>

                    <li><a href="${pageContext.request.contextPath}/khuyen-mai.jsp">KHUYẾN MÃI</a></li>
                </ul>
            </div>
        </nav>
    </div>

    <div class="header-right">
        <div class="container">
            <div class="header-right__content">

                <form action="${pageContext.request.contextPath}/san-pham" method="get" class="search-bar">
                    <button type="submit" style="border:none; background:none;">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                    <input type="text" name="search" placeholder="Bạn muốn tìm gì...">
                </form>

                <div class="cart-container">
                    <span class="cart-text">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span>
                            <a href="${pageContext.request.contextPath}/gio-hang.jsp">
                                Giỏ Hàng (${sessionScope.cart != null ? sessionScope.cart.totalItems : 0})
                            </a>
                        </span>
                    </span>

                    <div class="cart-dropdown">
                        <div class="cart-dropdown-header">
                            <h3>Giỏ hàng của bạn</h3>
                        </div>
                        <div class="cart-items">
                            <c:if test="${sessionScope.cart == null || sessionScope.cart.totalItems == 0}">
                                <p style="padding: 20px; text-align: center; color: #666;">
                                    Giỏ hàng đang trống
                                </p>
                            </c:if>
                        </div>
                        <div class="cart-dropdown-footer">
                            <div class="cart-actions">
                                <a href="${pageContext.request.contextPath}/gio-hang.jsp" class="btn-view-cart">XEM GIỎ HÀNG</a>
                                <a href="${pageContext.request.contextPath}/thanh-toan.jsp" class="btn-checkout">THANH TOÁN</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="user-account">
                    <span class="user-icons">
                        <i class="fa-solid fa-user"></i>
                    </span>

                    <div class="user-dropdown">
                        <c:choose>
                            <%-- Đã đăng nhập --%>
                            <c:when test="${not empty sessionScope.user}">
                                <div style="padding: 10px; border-bottom: 1px solid #eee;">
                                    Xin chào, <strong>${sessionScope.user.lastName} ${sessionScope.user.firstName}</strong>
                                </div>
                                <a href="${pageContext.request.contextPath}/thong-tin-tai-khoan-nguoi-dung.jsp">Tài khoản của tôi</a>
                                <a href="${pageContext.request.contextPath}/don-hang-nguoi-dung.jsp">Đơn mua</a>
                                <a href="${pageContext.request.contextPath}/logout" style="color: red;">Đăng xuất</a>
                            </c:when>

                            <%-- Chưa đăng nhập --%>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a>
                                <a href="${pageContext.request.contextPath}/signup.jsp">Đăng ký</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

            </div>
        </div>
    </div>
</header>

