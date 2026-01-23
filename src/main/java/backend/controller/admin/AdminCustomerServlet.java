package backend.controller.admin;

import backend.dao.UserDAO;
import backend.model.CustomerDTO;
import backend.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCustomerServlet", urlPatterns = {"/admin/customers"})
public class AdminCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 1. Lấy tham số từ request (URL)
        String search = request.getParameter("search");
        String status = request.getParameter("status"); // active, inactive
        String sort = request.getParameter("sort");

        // Xử lý phân trang
        int page = 1;
        int pageSize = 10; // Số lượng khách hàng mỗi trang
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        // 2. Gọi DAO lấy dữ liệu
        UserDAO userDAO = new UserDAO();
        List<CustomerDTO> customers = userDAO.getCustomersWithStats(search, status, sort, page, pageSize);
        int totalCustomers = userDAO.countCustomers(search, status);
        int totalPages = (int) Math.ceil((double) totalCustomers / pageSize);

        // 3. Đẩy dữ liệu sang JSP
        request.setAttribute("customerList", customers);
        request.setAttribute("totalCustomers", totalCustomers);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        // Giữ lại các giá trị lọc để hiển thị lại trên form
        request.setAttribute("paramSearch", search);
        request.setAttribute("paramStatus", status);
        request.setAttribute("paramSort", sort);

        // 4. Forward về trang JSP
        request.getRequestDispatcher("/admin/admin-customers.jsp").forward(request, response);
    }
}