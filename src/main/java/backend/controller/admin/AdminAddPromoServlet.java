package backend.controller.admin;

import backend.dao.PromotionDAO;
import backend.db.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "AdminAddPromoServlet", urlPatterns = {"/admin/promotion/add-products"})
public class AdminAddPromoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String promoIdStr = request.getParameter("promoId");
        String productIdsStr = request.getParameter("productIds"); // Chuỗi dạng "1,5,10"

        if (promoIdStr != null && productIdsStr != null) {
            try {
                int promoId = Integer.parseInt(promoIdStr);
                String[] ids = productIdsStr.split(",");

                PromotionDAO dao = new PromotionDAO();
                // Gọi hàm insert hàng loạt (Chúng ta viết hàm này ở bước tiếp theo)
                dao.addProductsToPromotion(promoId, ids);

                response.setStatus(HttpServletResponse.SC_OK); // Báo thành công 200 OK
            } catch (Exception e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}