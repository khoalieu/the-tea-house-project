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
import java.util.List;

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

            request.setAttribute("customer", customer);
            request.setAttribute("addresses", addresses);
            request.setAttribute("orders", orders);
            request.setAttribute("totalSpent", totalSpent);
            request.setAttribute("completedOrders", completedOrders);

            request.getRequestDispatcher("/admin/admin-customer-detail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/customers.jsp");
        }
    }
}