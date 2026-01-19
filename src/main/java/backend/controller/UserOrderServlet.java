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
import java.util.List;

@WebServlet(name = "UserOrderServlet", value = "/don-hang")
public class UserOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // 1. Check login
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Get data
        OrderDAO orderDAO = new OrderDAO();
        List<Order> orders = orderDAO.getOrdersByUserId(user.getId());

        // 3. Push to JSP
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("don-hang-nguoi-dung.jsp").forward(request, response);
    }
}