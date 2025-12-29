<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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

        <jsp:include page="common/user-sidebar.jsp">
            <jsp:param name="activePage" value="tai-khoan"/>
        </jsp:include>

        <main class="main-content">
            <h2 class="section-title">Thông tin người dùng</h2>
    
            <form class="profile-form">
                
                <div class="form-row">
                        <div class="input-group">
                            <input type="text" id="firstname" placeholder=" " required>
                            <label for="firstname">Tên</label>
                        </div>
                        
                        <div class="input-group">
                            <input type="text" id="lastname" placeholder=" " required>
                            <label for="lastname">Họ</label>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="input-group">
                            <input type="text" id="dob" placeholder="YYYY/MM/DD">
                            <label for="dob"> Ngày Sinh (YYYY/MM/DD)</label>
                        </div>
                        
                        <div class="input-group">
                            <select id="gender">
                                <option value="" disabled selected hidden></option> <option value="male">Nam</option>
                                <option value="female">Nữ</option>
                                <option value="other">Khác</option>
                            </select>
                            <label for="gender">Giới tính</label>
                            <span class="value-placeholder">Not specified</span> <i class="fa-solid fa-chevron-down select-arrow"></i>
                        </div>
                    </div>
                    
                </form>

                <h3 class="section-subtitle">Thông tin liên hệ</h3>
                
                <form class="profile-form">
                    <div class="form-row">
                        <div class="input-group">
                            <input type="email" id="email" value=${sessionScope.user.email} readonly>
                            <label for="email">Email*</label>
                        </div>

                        <div class="input-group phone-group">
                            <div class="phone-prefix">
                                <span>SDT</span> <i class="fa-solid fa-chevron-down"></i>
                            </div>
                            <input type="tel" id="phone" placeholder=" " value="${sessionScope.user.phone}">
                            <label for="phone">Số điện thoại</label>
                        </div>
                    </div>
                </form>

                <h3 class="section-subtitle">Đổi mật khẩu</h3>

                <form class="profile-form">
                    <div class="form-row password-row">
                        <div class="input-group">
                            <input type="password" id="oldPassword" placeholder=" " required>
                            <label for="oldPassword">Mật khẩu cũ</label>
                        </div>

                        <div class="input-group">
                            <input type="password" id="newPassword" placeholder=" " required>
                            <label for="newPassword">Mật khẩu mới</label>
                        </div>

                        <div class="input-group">
                            <input type="password" id="confirmNewPassword" placeholder=" " required>
                            <label for="confirmNewPassword">Xác nhận mật khẩu mới</label>
                        </div>
                    </div>
                </form>

                <div class="form-actions">
                    <button type="button" class="btn-save-changes">Lưu Thay Đổi</button>
                </div>

        </main>

    </div>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>
</body>
</html>