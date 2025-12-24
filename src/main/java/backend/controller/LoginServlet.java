package backend.controller;

import backend.dao.UserDAO;
import backend.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Nếu đã đăng nhập thì chuyển về trang chủ
        if(request.getSession().getAttribute("user") != null){
            response.sendRedirect("index.jsp");
            return;
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Nhận dữ liệu từ form login.jsp
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User account = dao.checkLogin(user, pass);

        if (account != null) {
            // Đăng nhập thành công -> Tạo Session
            HttpSession session = request.getSession();
            session.setAttribute("user", account); // Lưu object User vào session

            // Phân quyền (nếu cần)
            if(account.getRole().name().equalsIgnoreCase("ADMIN")){
                response.sendRedirect("admin/admin-dashboard.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        } else {
            // Thất bại
            request.setAttribute("errorMessage", "Sai tên đăng nhập hoặc mật khẩu!");
            request.setAttribute("username", user); // Gửi lại username để điền vào ô input
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}