package backend.controller.admin;

import backend.dao.UserDAO;
import backend.model.CustomerDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCustomerServlet", urlPatterns = "/admin/customers")
public class AdminCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Lấy tham số
        String search = request.getParameter("search");
        String status = request.getParameter("status"); // new, vip, active, inactive
        String spending = request.getParameter("spending");
        String sort = request.getParameter("sort");

        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            page = 1;
        }
        int pageSize = 10;

        // 2. Gọi DAO
        UserDAO userDAO = new UserDAO();
        List<CustomerDTO> customers = userDAO.getCustomers(search, status, spending, null, sort, page, pageSize);
        int totalCustomers = userDAO.countCustomers(search, status);
        int totalPages = (int) Math.ceil((double) totalCustomers / pageSize);

        // 3. Set Attributes
        request.setAttribute("customers", customers);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalCustomers", totalCustomers);

        // Giữ lại các filter để hiển thị trên giao diện
        request.setAttribute("paramSearch", search);
        request.setAttribute("paramStatus", status);
        request.setAttribute("paramSort", sort);

        // 4. Forward
        request.getRequestDispatcher("/admin/admin-customers.jsp").forward(request, response);
    }
}