<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Đăng Ký</title>
  <!-- <link rel="stylesheet" href="assets/css/login.css" /> -->
   <link rel="stylesheet" href="assets/css/main.css" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
    <div class="login-page">
        <div class="login-box">
            <div class="login-header">
                <div class="login-icon-circle">
                    <i class="fa-solid fa-user"></i>
                </div>
                <h2 class="login-title">Tạo tài khoản Mới</h2>
                <p class="login-subtitle">Tham gia cùng Mộc Trà để trải nghiệm tốt hơn</p>
            </div>


            <div class="login-content">
                <form action="#" method="post" enctype="multipart/form-data" autocomplete="on">
                    <!-- Username -->
                    <div class="form-row">
                        <input
                                id="signup-username"
                                class="input-username"
                                type="text"
                                name="username"
                                placeholder="Tên đăng nhập"
                                aria-label="Tên đăng nhập"
                                required>
                    </div>

                    <!-- Email -->
                    <div class="form-row">
                        <input
                                id="signup-email"
                                class="input-email"
                                type="email"
                                name="email"
                                placeholder="Email"
                                aria-label="Email"
                                required>
                    </div>
                    <!-- Phone -->
                    <div class="form-row">
                        <input
                                id="signup-phone"
                                class="input-phone"
                                type="tel"
                                name="phone"
                                placeholder="Số điện thoại"
                                pattern="[0-9]{10}"
                                required>
                    </div>



                    <!-- Password -->
                    <div class="form-row password-field">
                        <input
                                id="signup-password"
                                class="input-password"
                                type="password"
                                name="password"
                                placeholder="Mật khẩu"
                                aria-label="Mật khẩu"
                                required>

                    </div>

                    <!-- Confirm Password -->
                    <div class="form-row password-field">
                        <input
                                id="signup-confirmPassword"
                                class="input-confirm"
                                type="password"
                                name="confirmPassword"
                                placeholder="Xác nhận mật khẩu"
                                aria-label="Xác nhận mật khẩu"
                                required>

                    </div>
                    <!-- Avatar upload -->
                    <div class="form-row avatar-row">
                        <label class="avatar-text" for="avatarInput">Avatar</label>

                        <div class="avatar-box" id="signup-avatarBox" role="button" aria-label="Chọn ảnh đại diện">
                            <img id="signup-avatarPreview" src="assets/images/useravata.png" alt="Ảnh đại diện">
                        </div>

                        <input type="file" id="signup-avatarInput" accept="image/*" style="display:none;">
                    </div>

                    <!-- Submit -->
                    <div class="form-row">
                        <button type="submit" class="btn">Đăng ký</button>
                    </div>

                    <!-- Link về đăng nhập -->
                    <div class="signup">
                        Đã có tài khoản?
                        <a href="login.html">Đăng nhập</a>
                    </div>
                </form>
            </div>

        </div>
    </div>

       <!-- footer  -->

    <footer class="main-footer">
    <div class="container">
        <div class="left-footer footer-section">
            <div class="logo-footer">
                <a href="index.jsp">
                    <img src="assets/images/logoweb.png" alt="Tea Shop Logo">
                </a>
            </div>
            <h2>LỜI NHẮN NHỦ TỪ MỘC TRÀ</h2>
            <P>Tiệm trà Mộc Trà với những tâm hồn tự tại đã trót yêu mẹ thiên nhiên say đắm, 
                mong muốn được dùng các loại thảo mộc chữa lành cho tất cả mọi người. 
                Sản phẩm của Mộc Trà có thành phần từ tự nhiên, được chế biến hoàn toàn bằng công nghệ sấy lạnh,
                 không chứa chất bảo quản và rất lành tính. Với mỗi sản phẩm bán ra đã trải qua bao lần thử nghiệm,
                các khâu chế biến, sản xuất nghiêm ngặt để cho ra một hộp trà chất lượng đến được tay khách hàng.</P>
        </div>
        <div class="center-footer footer-section">
            <h2>THÔNG TIN LIÊN HỆ</h2>
            <div class="contact-info">
                <div class="address">
                    <i class="fa-solid fa-location-dot"></i>
                    <p>123 Đường Trà, Phường Trà Thảo, Quận Pha Chế, TP. Trà Sữa</p>
                </div>
                <div class="phone">
                    <i class="fa-solid fa-phone"></i>
                    <p>0888 531 015</p>
                </div>
                <div class="email">
                    <i class="fa-solid fa-envelope"></i>
                    <p>contact@moctra.com</p>
                </div>
            </div>
        </div>
        <div class="right-footer footer-section">
            <h2>Chính sách bán hàng</h2>
            <ul>
                <li><a href="#">Chính sách bán hàng</a></li>
                <li><a href="#">Chính sách thanh toán</a></li>
                <li><a href="#">Chính sách bảo hành</a></li>
                <li><a href="#">Điều khoản dịch vụ</a></li>
            </ul>
        </div>
    </div>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>

  
<script>
    const avatarInput = document.getElementById('signup-avatarInput');
    const avatarPreview = document.getElementById('signup-avatarPreview');
    const avatarBox = document.getElementById('signup-avatarBox');

    avatarBox.addEventListener('click', () => avatarInput.click()); // mở hộp thoại chọn file

    // cập nhật ảnh đại diện khi chọn file
    function handleAvatarChange(e){
        const file = e.target.files?.[0];
        if (!file) return;
        const reader = new FileReader();
        reader.onload = (ev) => { avatarPreview.src = ev.target.result; };
        reader.readAsDataURL(file);
    }
    avatarInput.addEventListener('change', handleAvatarChange);
</script>
<!-- com măt -->
<script src="assets/js/main.js">

</script>


</body>
</html>
