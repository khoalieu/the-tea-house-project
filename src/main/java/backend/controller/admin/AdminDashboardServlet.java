package backend.controller.admin;

import backend.dao.OrderDAO;
import backend.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/admin/dashboard"})
public class AdminDashboardServlet extends HttpServlet {

    private final OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Lấy 5 đơn hàng mới nhất
        List<Order> recentOrders = orderDAO.getRecentOrders(5);

        // 2. (Optional) Có thể lấy thêm thống kê: Tổng doanh thu, Số sản phẩm sắp hết hàng...
        // int totalRevenue = ...

        request.setAttribute("recentOrders", recentOrders);

        request.getRequestDispatcher("/admin/admin-dashboard.jsp").forward(request, response);
    }
}