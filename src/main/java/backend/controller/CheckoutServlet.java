package backend.controller;

import backend.dao.CartDAO;
import backend.dao.OrderDAO;
import backend.dao.UserAddressDAO;
import backend.model.Cart;
import backend.model.CartItem;
import backend.model.User;
import backend.model.UserAddress;
import backend.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CheckoutServlet", value = "/thanh-toan")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        if (cart == null || cart.getTotalQuantity() == 0) {
            response.sendRedirect("san-pham.jsp");
            return;
        }
        UserAddressDAO addressDAO = new UserAddressDAO();
        List<UserAddress> addresses = addressDAO.getListAddress(user.getId());
        request.setAttribute("addresses", addresses);
        request.setAttribute("subtotal", cart.getTotalMoney());
        double defaultShipping = 20000;
        request.setAttribute("shippingFee", defaultShipping);
        request.setAttribute("totalAmount", cart.getTotalMoney() + defaultShipping);

        request.getRequestDispatcher("thanh-toan.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // Xử lý tiếng Việt
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        // 1. Validate cơ bản
        if (user == null || cart == null || cart.getTotalQuantity() == 0) {
            response.sendRedirect("index.jsp");
            return;
        }

        // 2. Lấy dữ liệu từ Form
        String selectedAddressVal = request.getParameter("selectedAddress"); // "new" hoặc ID (số)
        String shippingMethod = request.getParameter("shippingMethod"); // standard, express, instant
        String paymentMethod = request.getParameter("paymentMethod");
        String note = request.getParameter("note");

        // 3. Xử lý Địa chỉ giao hàng
        UserAddressDAO addressDAO = new UserAddressDAO();
        int shippingAddressId = 0;

        if ("new".equals(selectedAddressVal)) {
            // Trường hợp nhập địa chỉ mới -> Lưu vào DB trước
            String fullName = request.getParameter("fullName");
            String phone = request.getParameter("phoneNumber");
            String province = request.getParameter("province");
            String ward = request.getParameter("ward");
            String street = request.getParameter("addressLine");

            UserAddress newAddr = new UserAddress();
            newAddr.setUserId(user.getId());
            newAddr.setFullName(fullName);
            newAddr.setPhoneNumber(phone);
            newAddr.setLabel("Địa chỉ mới");
            newAddr.setProvince(province);
            newAddr.setWard(ward);
            newAddr.setStreetAddress(street);
            newAddr.setIsDefault(false); // Mặc định là false

            // Gọi hàm mới thêm ở bước 2
            shippingAddressId = addressDAO.addAddressAndGetId(newAddr);
        } else {
            // Trường hợp chọn địa chỉ có sẵn (Value là ID)
            try {
                shippingAddressId = Integer.parseInt(selectedAddressVal);
            } catch (NumberFormatException e) {
                // Xử lý lỗi hoặc set mặc định
            }
        }

        // 4. Tính toán phí ship & Tổng tiền
        double shippingFee = 20000; // Mặc định Standard
        if ("express".equals(shippingMethod)) shippingFee = 35000;
        else if ("instant".equals(shippingMethod)) shippingFee = 60000;

        double totalAmount = cart.getTotalMoney() + shippingFee;

        // 5. Tạo đối tượng Order
        Order order = new Order();
        order.setUserId(user.getId());
        order.setShippingAddressId(shippingAddressId);
        order.setOrderNumber(generateOrderNumber()); // Hàm tạo mã đơn hàng
        order.setTotalAmount(totalAmount);
        order.setShippingFee(shippingFee);
        order.setPaymentMethod(paymentMethod);
        order.setNotes(note);

        // 6. Lưu vào DB
        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.createOrder(order); // Hàm thêm ở bước 1

        if (orderId > 0) {
            // 6.1 Lưu chi tiết đơn hàng (Order Items)
            // Convert Collection<CartItem> sang List<CartItem>
            List<CartItem> cartItems = new ArrayList<>(cart.getItems());
            orderDAO.addOrderItems(orderId, cartItems);

            // 6.2 Xóa giỏ hàng trong Session và Database (nếu có lưu)
            session.removeAttribute("cart");
            CartDAO cartDAO = new CartDAO();
            cartDAO.clearCart(user.getId());
            response.sendRedirect("don-hang-nguoi-dung.jsp");
        } else {
            request.setAttribute("errorMessage", "Đặt hàng thất bại. Vui lòng thử lại.");
            doGet(request, response);
        }
    }
    //tạo đơn hàng ngẫu nhiên
    private String generateOrderNumber() {
        return "ORD" + System.currentTimeMillis();
    }
}