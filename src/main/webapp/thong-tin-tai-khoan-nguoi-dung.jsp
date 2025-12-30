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
                <c:if test="${not empty sessionScope.msg}">
                    <div class="alert alert-${sessionScope.msgType}"
                         style="padding: 15px; margin-bottom: 20px; border-radius: 4px;
                                 background-color: ${sessionScope.msgType == 'success' ? '#d4edda' : '#f8d7da'};
                                 color: ${sessionScope.msgType == 'success' ? '#155724' : '#721c24'};">
                            ${sessionScope.msg}
                    </div>
                    <c:remove var="msg" scope="session"/>
                </c:if>
                <form action="update-full-profile" method="post" class="profile-form">

                    <div class="form-row">
                        <div class="input-group">
                            <%-- Thêm name="firstname" --%>
                            <input type="text" id="firstname" name="firstname"
                                   value="${sessionScope.user.firstName}" placeholder=" ">
                            <label for="firstname">Tên</label>
                        </div>

                        <div class="input-group">
                            <%-- Thêm name="lastname" --%>
                            <input type="text" id="lastname" name="lastname"
                                   value="${sessionScope.user.lastName}" placeholder=" ">
                            <label for="lastname">Họ</label>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="input-group">
                            <input type="text" id="dob" name="dob" placeholder="YYYY-MM-DD"
                                   value="${sessionScope.user.dateOfBirth != null ? sessionScope.user.dateOfBirth.toLocalDate() : ''}">
                            <label for="dob">Ngày Sinh</label>
                        </div>

                        <div class="input-group">
                            <select id="gender" name="gender">
                                <option value="" disabled selected hidden></option>
                                <option value="MALE" ${sessionScope.user.gender == 'MALE' ? 'selected' : ''}>Nam</option>
                                <option value="FEMALE" ${sessionScope.user.gender == 'FEMALE' ? 'selected' : ''}>Nữ</option>
                                <option value="OTHER" ${sessionScope.user.gender == 'OTHER' ? 'selected' : ''}>Khác</option>
                            </select>
                            <label for="gender">Giới tính</label>
                            <i class="fa-solid fa-chevron-down select-arrow"></i>
                        </div>
                    </div>

                    <h3 class="section-subtitle" style="margin-top: 30px;">Thông tin liên hệ</h3>

                    <div class="form-row">
                        <div class="input-group">
                            <input type="email" id="email" name="email"
                                   value="${sessionScope.user.email}" readonly style="background-color: #f5f5f5;">
                            <label for="email">Email</label>
                        </div>

                        <div class="input-group phone-group">
                            <div class="phone-prefix">
                                <span>SDT</span> <i class="fa-solid fa-chevron-down"></i>
                            </div>
                            <%-- Thêm name="phone" --%>
                            <input type="tel" id="phone" name="phone" placeholder=" "
                                   value="${sessionScope.user.phone}">
                            <label for="phone">Số điện thoại</label>
                        </div>
                    </div>

                    <h3 class="section-subtitle" style="margin-top: 30px;">Đổi mật khẩu</h3>
                    <p style="font-size: 13px; color: #666; margin-bottom: 15px;">
                        *Chỉ nhập vào đây nếu bạn muốn thay đổi mật khẩu
                    </p>

                    <div class="form-row password-row">
                        <div class="input-group">
                            <input type="password" id="oldPassword" name="oldPassword" placeholder=" ">
                            <label for="oldPassword">Mật khẩu cũ</label>
                        </div>

                        <div class="input-group">
                            <input type="password" id="newPassword" name="newPassword" placeholder=" ">
                            <label for="newPassword">Mật khẩu mới</label>
                        </div>

                        <div class="input-group">
                            <input type="password" id="confirmNewPassword" name="confirmNewPassword" placeholder=" ">
                            <label for="confirmNewPassword">Xác nhận mật khẩu mới</label>
                        </div>
                    </div>

                    <div class="form-actions" style="margin-top: 30px;">
                        <button type="submit" class="btn-save-changes">Lưu Thay Đổi</button>
                    </div>

                </form>
            </main>

        </div>
    <jsp:include page="common/footer.jsp"></jsp:include>
    <button id="backToTop" class="back-to-top" title="Lên đầu trang">
        <i class="fa-solid fa-chevron-up"></i>
    </button>
    </body>
    </html>