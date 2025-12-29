<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saved Addresses - Mộc Trà</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="user-dashboard-page">
<jsp:include page="common/header.jsp"></jsp:include>
<div class="container">
    <!-- SIDEBAR -->
    <jsp:include page="common/user-sidebar.jsp">
        <jsp:param name="activePage" value="dia-chi"/>
    </jsp:include>

    <!-- MAIN CONTENT -->
    <main class="main-content">
        <h2 class="page-title">Địa chỉ</h2>

        <div class="saved-address-layout">
            <!--cột trái danh sách địa chỉ -->
            <section class="saved-address-left">
                <h3 class="section-subtitle">Địa chỉ đã lưu</h3>
                <p class="address-hint">
                    Chọn một địa chỉ làm <strong>mặc định</strong>. Địa chỉ mặc định sẽ dùng ở trang thanh toán.
                </p>

                <div class="address-list" id="addressList">
                    <!-- sau này servlet lặp qua list address -->
                    <div class="address-card default" data-id="1">
                        <span class="default-badge">Mặc định</span>
                        <div class="address-card-header">
                            <div>
                                <h4>Nhà riêng</h4>
                                <p><strong>Nguyễn Văn A</strong> · 0888 531 015</p>
                            </div>
                            <div class="address-default-toggle">
                                <input type="radio"
                                       name="defaultAddressId"
                                       value="1"
                                       checked>
                                <span>Đặt mặc định</span>
                            </div>
                        </div>
                        <p>123 Đường Trà, Phường Trà Thảo, TP. Trà Sữa</p>
                        <div class="address-actions">
                            <!-- sau này đổi href thành link xoá thật -->
                            <a href="#"
                               class="btn-small btn-delete"
                               title="Xóa địa chỉ này">
                                <i class="fa-solid fa-trash-can" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>

                    <div class="address-card" data-id="2">
                        <div class="address-card-header">
                            <div>
                                <h4>Văn phòng</h4>
                                <p><strong>Nguyễn Văn A</strong> · 0909 123 456</p>
                            </div>
                            <div class="address-default-toggle">
                                <input type="radio"
                                       name="defaultAddressId"
                                       value="2">
                                <span>Đặt mặc định</span>
                            </div>
                        </div>
                        <p>45 Đường Pha Chế, Phường Công Thức, TP. Trà Sữa</p>
                        <div class="address-actions">
                            <a href="#"
                               class="btn-small btn-delete"
                               title="Xóa địa chỉ này">
                                <i class="fa-solid fa-trash-can" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
            
                </div>
            </section>

            <!-- cột phải thêm form insert address -->
            <section class="saved-address-right">
                <h3 class="section-subtitle">Thêm địa chỉ mới</h3>

                <form class="profile-form address-form" action="#" method="post">
                    <!--name-->
                    <div class="form-row">
                        <div class="input-group">
                            <input type="text"
                                   id="fullName"
                                   name="fullName"
                                   placeholder=" "
                                   required>
                            <label for="fullName">Họ và tên*</label>
                        </div>
                    </div>

                    <!--phoneNumber-->
                    <div class="form-row">
                        <div class="input-group phone-group">
                            <div class="phone-prefix">
                                <span>+84</span>
                                <i class="fa-solid fa-chevron-down"></i>
                            </div>
                            <input type="tel"
                                   id="phoneNumber"
                                   name="phoneNumber"
                                   placeholder=" "
                                   required>
                            <label for="phoneNumber">Số điện thoại*</label>
                        </div>
                    </div>

                    <!-- Tỉnh / TP + Phường / Xã -->
                    <div class="form-row form-row-2">
                        <div class="input-group">
                            <select id="province" name="province">
                                <option value="" disabled selected hidden></option>
                                <!-- servlet/JS loat -->
                            </select>
                            <label for="province">Tỉnh / Thành phố</label>
                            <span class="value-placeholder">Chưa chọn</span>
                            <i class="fa-solid fa-chevron-down select-arrow"></i>
                        </div>

                        <div class="input-group">
                            <select id="ward" name="ward">
                                <option value="" disabled selected hidden></option>
                                <!-- sau này load theo province -->
                            </select>
                            <label for="ward">Phường / Xã</label>
                            <span class="value-placeholder">Chưa chọn</span>
                            <i class="fa-solid fa-chevron-down select-arrow"></i>
                        </div>
                    </div>

                    <!-- Địa chỉ cụ thể -->
                    <div class="form-row">
                        <div class="input-group">
                            <input type="text"
                                   id="addressLine"
                                   name="addressLine"
                                   placeholder=" "
                                   required>
                            <label for="addressLine">Địa chỉ cụ thể*</label>
                        </div>
                    </div>

                    <!-- gnas nhãn -->
                    <div class="form-row">
                        <div class="input-group">
                            <input type="text"
                                   id="addressLabel"
                                   name="addressLabel"
                                   placeholder=" ">
                            <label for="addressLabel">Gắn nhãn (Nhà riêng, Văn phòng,...)</label>
                        </div>
                    </div>

                    <!-- Nút add địa chỉ -->
                    <button type="submit" class="add-address-btn">
                        <i class="fa-solid fa-plus"></i>
                        Thêm địa chỉ
                    </button>
                </form>
            </section>
        </div>
    </main>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>
<!-- SCRIPT :  chọn địa chỉ mặc định (UI) -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    const radios = document.querySelectorAll('input[type="radio"][name="defaultAddressId"]');

    function updateDefaultUI(selectedRadio) {
        // bỏ trạng thái mặc định ở tất cả card
        document.querySelectorAll(".address-card").forEach(card => {
            card.classList.remove("default");
            const badge = card.querySelector(".default-badge");
            if (badge) {
                badge.remove();
            }
        });

        // card đang chọn
        const card = selectedRadio.closest(".address-card");
        if (!card) return;

        card.classList.add("default");

        // thêm badge nếu chưa có
        if (!card.querySelector(".default-badge")) {
            const badge = document.createElement("span");
            badge.className = "default-badge";
            badge.textContent = "Mặc định";
            card.prepend(badge);
        }
    }

    radios.forEach(radio => {
        radio.addEventListener("change", function () {
            if (this.checked) {
                updateDefaultUI(this);
            }
        });
    });
});
</script>

</body>
</html>
