package backend.controller;

import backend.dao.OrderDAO;
import backend.model.Order;
import backend.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "InvoiceServlet", value = "/hoa-don")
public class InvoiceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Kiểm tra đăng nhập
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        // 2. Lấy ID hóa đơn từ URL (ví dụ: /hoa-don?id=123)
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("don-hang-nguoi-dung.jsp");
            return;
        }

        try {
            int orderId = Integer.parseInt(idStr);
            OrderDAO orderDAO = new OrderDAO();
            Order order = orderDAO.getOrderById(orderId);

            // 3. Kiểm tra bảo mật: Chỉ xem được đơn hàng của chính mình
            if (order != null && order.getUserId() == user.getId()) {
                request.setAttribute("order", order);
                request.getRequestDispatcher("hoa-don.jsp").forward(request, response);
            } else {
                // Đơn hàng không tồn tại hoặc không phải của user này
                response.sendRedirect("don-hang-nguoi-dung.jsp");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("don-hang-nguoi-dung.jsp");
        }
    }
}