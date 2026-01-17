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
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;

// Mapping URL mới
@WebServlet(name = "UpdateProfileInfoServlet", value = "/tai-khoan-cua-toi")
public class UpdateProfileInfoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Check login
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        request.getRequestDispatcher("thong-tin-tai-khoan-nguoi-dung.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Cấu hình UTF-8 để nhận tiếng Việt
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
        String dobStr = request.getParameter("dob");

        String genderRaw = request.getParameter("gender");
        String gender = (genderRaw != null) ? genderRaw.toLowerCase() : "other";
        UserDAO dao = new UserDAO();
        boolean isUpdated = false;
        try {
            isUpdated = dao.updateProfile(firstName, lastName, phone, dobStr, gender, user.getId());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (isUpdated) {
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setPhone(phone);
            if (dobStr != null && !dobStr.isEmpty()) {
                try {
                    user.setDateOfBirth(LocalDate.parse(dobStr).atStartOfDay());
                } catch (Exception e) { e.printStackTrace(); }
            }

            try {
                if (genderRaw != null) {
                    user.setGender(UserGender.valueOf(genderRaw.toLowerCase()));
                }
            } catch (Exception e) {}

            session.setAttribute("user", user);
            session.setAttribute("msg", "Cập nhật thông tin thành công!");
            session.setAttribute("msgType", "success");
        } else {
            session.setAttribute("msg", "Lỗi cập nhật! Vui lòng kiểm tra lại kết nối hoặc dữ liệu.");
            session.setAttribute("msgType", "danger");
        }

        response.sendRedirect("tai-khoan-cua-toi");
    }
}