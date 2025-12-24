package backend.controller;

import backend.dao.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;

// Dòng này rất quan trọng: Nó định nghĩa đường dẫn URL cho Servlet
@WebServlet(name = "RegisterServlet", value = "/signup")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Khi người dùng gõ link /signup trực tiếp -> Chuyển hướng về trang form đăng ký
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ form
        String user = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("password");
        String rePass = request.getParameter("confirmPassword");

        // Validate cơ bản
        if (pass == null || !pass.equals(rePass)) {
            request.setAttribute("errorMessage", "Mật khẩu xác nhận không khớp!");
            // Giữ lại thông tin cũ để người dùng không phải nhập lại
            request.setAttribute("username", user);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);

            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        UserDAO dao = new UserDAO();
        // Kiểm tra tồn tại
        if (dao.checkUserExist(user, email)) {
            request.setAttribute("errorMessage", "Tên đăng nhập hoặc Email đã tồn tại!");
            request.setAttribute("username", user);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);

            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            // Đăng ký thành công
            dao.register(user, email, pass, phone);
            // Chuyển hướng sang login
            response.sendRedirect("login.jsp");
        }
    }
}