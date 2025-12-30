package backend.controller;

import backend.dao.UserDAO;
import backend.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

// Mapping URL mới
@WebServlet(name = "ChangePasswordServlet", value = "/change-password")
public class ChangePasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String oldPass = request.getParameter("oldPassword");
        String newPass = request.getParameter("newPassword");
        String confirmPass = request.getParameter("confirmNewPassword");

        UserDAO dao = new UserDAO();

        // 1. Kiểm tra mật khẩu cũ
        if (dao.checkPassword(user.getId(), oldPass)) {
            // 2. Kiểm tra mật khẩu mới và xác nhận có khớp không
            if (newPass != null && !newPass.isEmpty() && newPass.equals(confirmPass)) {
                // 3. Thực hiện đổi pass
                boolean isPassUpdated = dao.changePassword(user.getId(), newPass);

                if (isPassUpdated) {
                    session.setAttribute("msg", "Đổi mật khẩu thành công!");
                    session.setAttribute("msgType", "success");
                } else {
                    session.setAttribute("msg", "Lỗi hệ thống khi đổi mật khẩu.");
                    session.setAttribute("msgType", "danger");
                }
            } else {
                session.setAttribute("msg", "Mật khẩu xác nhận không khớp!");
                session.setAttribute("msgType", "danger");
            }
        } else {
            session.setAttribute("msg", "Mật khẩu cũ không chính xác!");
            session.setAttribute("msgType", "danger");
        }

        response.sendRedirect("thong-tin-tai-khoan-nguoi-dung.jsp");
    }
}