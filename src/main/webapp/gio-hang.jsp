<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng - Mộc Trà</title>
    <link rel="stylesheet" href="assets/css/main.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="common/header.jsp"></jsp:include>
<main class="main-content">
    <section class="checkout-page">
        <div class="container">
            <h1 class="checkout-title">Giỏ hàng của bạn</h1>

            <form class="checkout-form" action="/xu-ly-thanh-toan" method="post">
                <div class="checkout-layout">

                    <div class="checkout-left">
                        <div class="checkout-card">

                            <table class="cart-table">
                                <thead>
                                <tr>
                                    <th class="col-checkbox"><input type="checkbox" id="select-all-items" /></th>
                                    <th class="col-product">Sản phẩm</th>
                                    <th class="col-price">Đơn giá</th>
                                    <th class="col-quantity">Số lượng</th>
                                    <th class="col-total">Thành tiền</th>
                                    <th class="col-remove">Xóa</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <input type="checkbox" name="selected_product_id" value="101" checked>
                                    </td>
                                    <td>
                                        <div class="cart-item-product">
                                            <img src="assets/images/san-pham-tra-hoa-cuc-2.jpg" alt="Trà Hoa Cúc">
                                            <a href="chi-tiet-san-pham.html">Trà Hoa Cúc Sấy Khô</a>
                                        </div>
                                    </td>
                                    <td>120.000đ</td>
                                    <td>
                                        <input class="cart-item-quantity" type="number" name="quantity_101" value="1" min="1">
                                    </td>
                                    <td>120.000đ</td>
                                    <td>
                                        <a href="#" class="cart-item-remove"><i class="fa-solid fa-trash"></i></a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="checkbox" name="selected_product_id" value="202" checked>
                                    </td>
                                    <td>
                                        <div class="cart-item-product">
                                            <img src="assets/images/san-pham-tran-chau-den-1.jpg" alt="Trân Châu">
                                            <a href="chi-tiet-san-pham.html">Trân Châu Đường Đen</a>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="new-price">45.000đ</span>
                                        <span class="old-price">50.000đ</span>
                                    </td>
                                    <td>
                                        <input class="cart-item-quantity" type="number" name="quantity_202" value="2" min="1">
                                    </td>
                                    <td>90.000đ</td>
                                    <td>
                                        <a href="#" class="cart-item-remove"><i class="fa-solid fa-trash"></i></a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <input type="checkbox" name="selected_product_id" value="303" checked>
                                    </td>
                                    <td>
                                        <div class="cart-item-product">
                                            <img src="assets/images/san-pham-bot-sua-beo.jpg" alt="Bột Sữa Béo">
                                            <a href="chi-tiet-san-pham.html">Bột Sữa Béo</a>
                                        </div>
                                    </td>
                                    <td>70.000đ</td>
                                    <td>
                                        <input class="cart-item-quantity" type="number" name="quantity_303" value="1" min="1">
                                    </td>
                                    <td>70.000đ</td>
                                    <td>
                                        <a href="#" class="cart-item-remove"><i class="fa-solid fa-trash"></i></a>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div> <div class="checkout-right">
                    <div class="checkout-card">
                        <h2 class="checkout-card__title">Tóm tắt đơn hàng</h2>

                        <div class="order-summary">
                            <div class="order-summary__row">
                                <span>Tạm tính</span>
                                <span>280.000đ</span>
                            </div>
                            <div class="order-summary__row order-summary__row--total">
                                <span>Tổng cộng</span>
                                <span>280.000đ</span>
                            </div>
                        </div>
                    </div>
<!--                    dành cho cuôi kỳ-->
<!--                    <div class="checkout-submit">-->
<!--                        <button type="submit" class="btn btn-primary checkout-submit__btn">-->
<!--                            Tiến hành Thanh toán-->
<!--                        </button>-->
<!--                        <a href="san-pham.jsp" class="continue-shopping-link">-->
<!--                            <i class="fa-solid fa-arrow-left"></i>-->
<!--                            Tiếp tục mua sắm-->
<!--                        </a>-->
<!--                    </div>-->
                    <div class="checkout-submit">

                        <a href="thanh-toan.jsp" class="btn btn-primary checkout-submit__btn">
                            Tiến hành Thanh toán
                        </a>

                        <a href="san-pham.jsp" class="continue-shopping-link">
                            <i class="fa-solid fa-arrow-left"></i>
                            Tiếp tục mua sắm
                        </a>
                    </div>

                </div> </div> </form>
        </div>
    </section>
</main>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>

</body>
</html>