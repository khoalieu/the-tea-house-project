package backend.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// Khai báo tất cả các đường dẫn "ảo" mà bạn muốn sử dụng
@WebServlet(name = "RouterServlet", urlPatterns = {
        "/ve-chung-toi",
        "/tra-thao-moc",
        "/tra-sua-nguyen-lieu",
        "/chinh-sach-ban-hang",
        "/chinh-sach-thanh-toan",
        "/chinh-sach-bao-hanh",
        "/dieu-khoan-dich-vu"
})
public class RouterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy đường dẫn mà người dùng đang truy cập
        String path = request.getServletPath();

        // Biến lưu tên file JSP đích
        String targetPage = "";
        String pageTitle = "";

        switch (path) {
            case "/ve-chung-toi":
                targetPage = "ve-chung-toi.jsp";
                pageTitle = "Về Chúng Tôi";
                break;

            case "/tra-thao-moc":
                // Lưu ý: Nếu trang này cần load danh sách sản phẩm từ DB,
                // bạn cần gọi ProductDAO ở đây trước khi forward.
                targetPage = "tra-thao-moc.jsp";
                pageTitle = "Trà Thảo Mộc";
                break;

            case "/tra-sua-nguyen-lieu":
                targetPage = "tra-sua-nguyen-lieu.jsp";
                pageTitle = "Nguyên Liệu Trà Sữa";
                break;

            case "/chinh-sach-ban-hang":
                targetPage = "chinh-sach-ban-hang.jsp";
                pageTitle = "Chính Sách Bán Hàng";
                break;

            case "/chinh-sach-thanh-toan":
                targetPage = "chinh-sach-thanh-toan.jsp";
                pageTitle = "Chính Sách Thanh Toán";
                break;

            case "/chinh-sach-bao-hanh":
                targetPage = "chinh-sach-bao-hanh.jsp";
                pageTitle = "Chính Sách Bảo Hành";
                break;

            case "/dieu-khoan-dich-vu":
                targetPage = "dieu-khoan-dich-vu.jsp";
                pageTitle = "Điều Khoản Dịch Vụ";
                break;

            default:
                // Nếu không tìm thấy đường dẫn, trả về lỗi 404 hoặc về trang chủ
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
        }

        // Gửi title qua JSP để hiển thị trên tab trình duyệt (nếu header.jsp có dùng biến này)
        request.setAttribute("pageTitle", pageTitle);

        // Chuyển hướng nội bộ đến file JSP thực sự
        request.getRequestDispatcher(targetPage).forward(request, response);
    }
}