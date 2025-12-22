<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng Nhập</title>
    <!-- <link rel="stylesheet" href="assets/css/login.css" /> -->
    <link rel="stylesheet" href="assets/css/main.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
    <div class="login-page">
        <div class="login-box">

            <div class="login-image">
                <img src="assets/images/image-tra-login.png" alt="Background">
            </div>

            <div class="login-content">
                <h2>Đăng Nhập</h2>

            <!-- Mạng xã hội -->
                <div class="social-login">
                    <a href="#" class="social fb"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" class="social gg"><i class="fa-brands fa-google"></i></a>
                </div>

                <form action="<%= request.getContextPath() %>/login" method="post">

                    <% String error = (String) request.getAttribute("error"); %>
                    <% if (error != null) { %>
                    <div style="color: red; text-align: center; margin-bottom: 10px; font-weight: bold;">
                        <%= error %>
                    </div>
                    <% } %>

                    <div class="form-row">
                        <input type="text" name="username" placeholder="Tên đăng nhập" required
                               value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>">
                    </div>

                    <div class="form-row password-field">
                        <input type="password" name="password" id="password" placeholder="Mật khẩu" required>
                        <div class="eye-icon" id="toggleEye">
                            <i class="fa-regular fa-eye"></i>
                        </div>
                    </div>

                    <div class="form-actions">
                        <label class="remember-me">
                            <input type="checkbox"> Ghi nhớ tài khoản
                        </label>
                        <a href="#" class="forgot-password">Quên mật khẩu?</a>
                    </div>

                    <div class="form-row">
                        <button type="submit" class="btn">Đăng nhập</button>
                    </div>

                    <div class="signup">
                        Chưa có tài khoản? <a href="signup.jsp">Đăng ký</a>
                    </div>
                </form>
            </div>

        </div>
    </div>

       <!-- footer  -->
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>
<script src="assets/js/main.js">

</script>
 
</body>
</html>
