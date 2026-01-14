<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

            <form class="checkout-form" action="thanh-toan.jsp" method="get"> <div class="checkout-layout">
                <div class="checkout-left">
                    <div class="checkout-card">
                        <table class="cart-table">
                            <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Đơn giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                                <th>Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${empty sessionScope.cart or sessionScope.cart.items.size() == 0}">
                                <tr><td colspan="5" style="text-align:center; padding: 20px;">Giỏ hàng trống!</td></tr>
                            </c:if>

                            <c:forEach var="item" items="${sessionScope.cart.items}">
                                <tr>
                                    <td>
                                        <div class="cart-item-product">
                                            <img src="${item.product.imageUrl}" alt="${item.product.name}" width="50">
                                            <a href="chi-tiet-san-pham?id=${item.product.id}">${item.product.name}</a>
                                        </div>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${item.product.salePrice > 0}">
                                                <fmt:formatNumber value="${item.product.salePrice}" type="currency"/>
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatNumber value="${item.product.price}" type="currency"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <form action="gio-hang" method="post" style="display:inline;">
                                            <input type="hidden" name="action" value="update">
                                            <input type="hidden" name="productId" value="${item.product.id}">
                                            <input class="cart-item-quantity" type="number" name="quantity"
                                                   value="${item.quantity}" min="1"
                                                   onchange="this.form.submit()" style="width: 60px;">
                                        </form>
                                    </td>
                                    <td style="color: #d9534f; font-weight: bold;">
                                        <fmt:formatNumber value="${item.totalPrice}" type="currency"/>
                                    </td>
                                    <td>
                                        <form action="gio-hang" method="post" style="display:inline;">
                                            <input type="hidden" name="action" value="remove">
                                            <input type="hidden" name="productId" value="${item.product.id}">
                                            <button type="submit" class="cart-item-remove" style="border:none; background:none; cursor:pointer; color:red;">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="checkout-right">
                    <div class="checkout-card">
                        <h2 class="checkout-card__title">Tóm tắt đơn hàng</h2>
                        <div class="order-summary">
                            <div class="order-summary__row order-summary__row--total">
                                <span>Tổng cộng</span>
                                <span style="color: #d9534f; font-size: 1.2em; font-weight: bold;">
                            <fmt:formatNumber value="${sessionScope.cart.totalMoney}" type="currency"/>
                        </span>
                            </div>
                        </div>
                        <div class="checkout-submit">
                            <a href="thanh-toan.jsp" class="btn btn-primary checkout-submit__btn">Tiến hành Thanh toán</a>
                            <a href="san-pham" class="continue-shopping-link">
                                <i class="fa-solid fa-arrow-left"></i> Tiếp tục mua sắm
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </section>
</main>
<jsp:include page="common/footer.jsp"></jsp:include>
<button id="backToTop" class="back-to-top" title="Lên đầu trang">
    <i class="fa-solid fa-chevron-up"></i>
</button>

</body>
</html>