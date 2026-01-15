package backend.controller.admin;

import backend.dao.OrderDAO;
import backend.dao.UserAddressDAO;
import backend.dao.UserDAO;
import backend.model.Order;
import backend.model.User;
import backend.model.UserAddress;
import backend.model.enums.UserRole;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.text.DecimalFormat;
import backend.dao.ReviewDAO;
import backend.model.ProductReview;
import backend.model.UserActivityDTO;

@WebServlet("/admin/customer/detail")
public class AdminCustomerDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User admin = (session != null) ? (User) session.getAttribute("user") : null;
        if (admin == null || (admin.getRole() != UserRole.ADMIN && admin.getRole() != UserRole.EDITOR)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/customers.jsp");
            return;
        }

        try {
            int userId = Integer.parseInt(idParam);

            UserDAO userDAO = new UserDAO();
            UserAddressDAO addressDAO = new UserAddressDAO();
            OrderDAO orderDAO = new OrderDAO();
            ReviewDAO reviewDAO = new ReviewDAO();
            List<ProductReview> reviews = reviewDAO.getReviewsByUserId(userId);
            List<UserActivityDTO> activities = new ArrayList<>();
            DecimalFormat df = new DecimalFormat("#,###");
            User customer = userDAO.getUserDetailById(userId);
            if (customer == null) {
                response.sendError(404, "Khách hàng không tồn tại");
                return;
            }

            List<UserAddress> addresses = addressDAO.getListAddress(userId);

            List<Order> orders = orderDAO.getOrdersByUserId(userId);

            double totalSpent = 0;
            int completedOrders = 0;
            for (Order o : orders) {
                if (o.getStatus().name().equalsIgnoreCase("COMPLETED")) {
                    totalSpent += o.getTotalAmount();
                    completedOrders++;
                }
            }
            if (orders != null) {
                for (Order o : orders) {
                    String desc = "Đơn hàng #" + o.getOrderNumber() + " - " + df.format(o.getTotalAmount()) + "đ";
                    activities.add(new UserActivityDTO(
                            "fa-shopping-cart",
                            "Đã đặt đơn hàng mới",
                            desc,
                            o.getCreatedAt()
                    ));
                }
            }

            if (reviews != null) {
                for (ProductReview r : reviews) {
                    String desc = r.getProductName() + " - " + r.getRating() + " sao";
                    activities.add(new UserActivityDTO(
                            "fa-star",
                            "Đã đánh giá sản phẩm",
                            desc,
                            r.getCreatedAt()
                    ));
                }
            }

            Collections.sort(activities);

            if (activities.size() > 10) {
                activities = activities.subList(0, 10);
            }
            double avgOrderValue = (completedOrders > 0) ? (totalSpent / completedOrders) : 0;
            long monthsActive = 0;
            if (customer.getCreatedAt() != null) {
                monthsActive = ChronoUnit.MONTHS.between(customer.getCreatedAt(), LocalDateTime.now());
                if (monthsActive == 0) monthsActive = 1;
            }
            double purchaseFrequency = (double) orders.size() / monthsActive;
            double totalStars = 0;
            if (reviews != null && !reviews.isEmpty()) {
                for (ProductReview r : reviews) {
                    totalStars += r.getRating();
                }
            }
            double avgRating = (reviews != null && !reviews.isEmpty())
                    ? (totalStars / reviews.size())
                    : 0;

            int reviewCount = (reviews != null) ? reviews.size() : 0;
            int commentCount = 0;

            request.setAttribute("customer", customer);
            request.setAttribute("addresses", addresses);
            request.setAttribute("orders", orders);
            request.setAttribute("totalOrders", orders.size());
            request.setAttribute("totalSpent", totalSpent);
            request.setAttribute("avgOrderValue", avgOrderValue);
            request.setAttribute("monthsActive", monthsActive);
            request.setAttribute("purchaseFrequency", purchaseFrequency);
            request.setAttribute("reviewCount", reviewCount);
            request.setAttribute("commentCount", commentCount);
            request.setAttribute("avgRating", avgRating);
            request.getRequestDispatcher("/admin/admin-customer-detail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/customers.jsp");
        }
    }
}