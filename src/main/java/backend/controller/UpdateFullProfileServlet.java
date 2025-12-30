package backend.controller;

import backend.dao.UserDAO;
import backend.model.User;
import backend.model.enums.UserGender;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;

@WebServlet(name = "UpdateFullProfileServlet", value = "/update-full-profile")
public class UpdateFullProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String dobStr = request.getParameter("dob");
        LocalDateTime dob = null;
        if (dobStr != null && !dobStr.trim().isEmpty()) {
            try {
                dob = LocalDate.parse(dobStr).atStartOfDay();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        UserDAO dao = new UserDAO();
        String message = "";
        String alertType = "success"; // Dùng để tô màu thông báo (xanh/đỏ)

        boolean isProfileUpdated = dao.updateProfile(user.getId(), firstName, lastName, phone, gender, dobStr);

        if (isProfileUpdated) {
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setPhone(phone);
            if (dob != null) user.setDateOfBirth(dob);
            if (gender != null && !gender.isEmpty()) {
                try {
                    user.setGender(UserGender.valueOf(gender));
                } catch (IllegalArgumentException e) {
                }
            }
            message += "Cập nhật thông tin thành công! ";
        } else {
            message += "Lỗi cập nhật thông tin. ";
            alertType = "danger";
        }
        String newPass = request.getParameter("newPassword");
        String oldPass = request.getParameter("oldPassword");
        String confirmPass = request.getParameter("confirmNewPassword");

        if (newPass != null && !newPass.trim().isEmpty()) {
            if (dao.checkPassword(user.getId(), oldPass)) {
                if (newPass.equals(confirmPass)) {
                    boolean isPassUpdated = dao.changePassword(user.getId(), newPass);
                    if (isPassUpdated) {
                        message += "Đã đổi mật khẩu mới.";
                    } else {
                        message += "Lỗi khi đổi mật khẩu.";
                        alertType = "warning";
                    }
                } else {
                    message += "Mật khẩu xác nhận không khớp.";
                    alertType = "danger";
                }
            } else {
                message += "Mật khẩu cũ không chính xác.";
                alertType = "danger";
            }
        }
        session.setAttribute("user", user);
        session.setAttribute("msg", message);
        session.setAttribute("msgType", alertType);

        response.sendRedirect("thong-tin-tai-khoan-nguoi-dung.jsp");
    }
}

