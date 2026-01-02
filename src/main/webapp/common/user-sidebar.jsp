<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<aside class="sidebar">
    <div class="profile-card">
        <div class="profile-header">
            <div class="avatar-circle">
                ${not empty sessionScope.user.username ? sessionScope.user.username.charAt(0) : 'U'}
            </div>
            <div class="email">${sessionScope.user.email}</div>
        </div>

        <div class="profile-body">
            <button class="btn-shopping" onclick="window.location.href='san-pham.jsp'">Tiếp tục mua sắm</button>
        </div>
    </div>

    <nav class="side-menu">
        <ul>
            <%-- Mục 1: Tổng quan --%>
            <li class="${param.activePage == 'tong-quan' ? 'active' : ''}">
                <a href="thong-tin-nguoi-dung.jsp"><i class="fa-solid fa-house"></i> Tổng quan</a>
            </li>

            <%-- Mục 2: Tài khoản --%>
            <li class="${param.activePage == 'tai-khoan' ? 'active' : ''}">
                <a href="thong-tin-tai-khoan-nguoi-dung.jsp"><i class="fa-regular fa-user"></i> Tài khoản của tôi</a>
            </li>

            <%-- Mục 3: Địa chỉ --%>
            <li class="${param.activePage == 'dia-chi' ? 'active' : ''}">
                <a href="user-address"><i class="fa-solid fa-location-dot"></i> Địa chỉ</a>
            </li>

            <%-- Mục 4: Đơn hàng --%>
            <li class="${param.activePage == 'don-hang' ? 'active' : ''}">
                <a href="don-hang-nguoi-dung.jsp"><i class="fa-solid fa-cart-shopping"></i> Đơn hàng của tôi</a>
            </li>
            <li>
                <a href="logout" style="color: #dc3545;"><i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a>
            </li>
        </ul>
    </nav>
</aside>