package backend.controller;

import backend.dao.ProductDAO;
import backend.dao.PromotionDAO;
import backend.model.Product;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/san-pham")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();

        String categoryParam = request.getParameter("category");
        String sortParam = request.getParameter("sort");
        String pageParam = request.getParameter("page");
        String priceParam = request.getParameter("price");
        String promoParam = request.getParameter("promotionId");

        Integer categoryId = null;
        if (categoryParam != null && !categoryParam.isEmpty()) {
            try {
                categoryId = Integer.parseInt(categoryParam);
            } catch (NumberFormatException e) {
                categoryId = null;
            }
        }

        int page = 1;
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (Exception e) {
                page = 1;
            }
        }

        Double maxPrice = null;
        if (priceParam != null && !priceParam.isEmpty()) {
            try {
                maxPrice = Double.parseDouble(priceParam);
            } catch (Exception e) {
                maxPrice = null;
            }
        }

        Integer promotionId = null;
        if (promoParam != null && !promoParam.isEmpty()) {
            try {
                promotionId = Integer.parseInt(promoParam);
            } catch (Exception e) {
            }
        }

        int pageSize = 12;
        List<Product> products = null;

        products = productDAO.getProducts(categoryId, promotionId, sortParam, maxPrice, page, pageSize, "active");

        int totalProducts = 0;
        totalProducts = productDAO.countProducts(categoryId, promotionId, maxPrice, "active");

        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        String categoryName = "Tất Cả Sản Phẩm";

        if (promotionId != null) {
            PromotionDAO promoDAO = new PromotionDAO();
            categoryName = promoDAO.getPromotionName(promotionId);

        } else if (categoryId != null) {
            if (categoryId == 1) {
                categoryName = "Trà Thảo Mộc";
            } else if (categoryId == 2) {
                categoryName = "Nguyên Liệu Trà Sữa";
            }
        }

        request.setAttribute("categoryName", categoryName);
        request.setAttribute("products", products);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.setAttribute("currentCategory", categoryId);
        request.setAttribute("currentSort", sortParam);
        request.setAttribute("currentPrice", maxPrice);
        request.setAttribute("currentPromotion", promotionId);

        request.getRequestDispatcher("/san-pham.jsp").forward(request, response);
    }
}