<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Người Dùng - Mộc Trà</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="user-dashboard-page">
<jsp:include page="common/header.jsp"></jsp:include>
    <div class="container">
        
        <aside class="sidebar">
            
            <div class="profile-card">
                <div class="profile-header">
                    <div class="avatar-circle">LG</div>
                    <div class="email">lieuminhkhoa2005@gmail.com</div>
                </div>
                
                <div class="profile-body">
                    <button class="btn-shopping">Tiếp tục mua sắm</button>
                </div>
            </div>

            <nav class="side-menu">
                <ul>
                    <li class="active">
                        <a href="#"><i class="fa-solid fa-house"></i> Tổng quan</a>
                    </li>
                    <li>
                        <a href="thong-tin-tai-khoan-nguoi-dung.jsp"><i class="fa-regular fa-user"></i> Tài khoản của tôi</a>
                    </li>
                    <li>
                        <a href="dia-chi-nguoi-dung.jsp"><i class="fa-solid fa-location-dot"></i> Địa chỉ</a>
                    </li>
                    <li>
                        <a href="don-hang-nguoi-dung.jsp"><i class="fa-solid fa-cart-shopping"></i> Đơn hàng của tôi</a>
                    </li>
                </ul>
            </nav>
        </aside>

        <main class="main-content">
            <h2 class="page-title">Tổng quan</h2>

            <div class="dashboard-grid">
                
                <a href="thong-tin-tai-khoan-nguoi-dung.jsp" class="grid-card">
                    <i class="fa-regular fa-user"></i>
                    <span>Tài khoản của tôi</span>
                </a>
                <a href="dia-chi-nguoi-dung.jsp" class="grid-card">
                    <i class="fa-solid fa-location-dot"></i>
                    <span>Địa chỉ</span>
                </a>

                <a href="don-hang-nguoi-dung.jsp" class="grid-card">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span>Đơn hàng của tôi</span>
                </a>
            </div>
        </main>

    </div>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>
</body>
</html>