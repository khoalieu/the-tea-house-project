package backend.controller;

import backend.dao.ProductDAO;
import backend.model.Product;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/san-pham")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();

        String categoryParam = request.getParameter("category");
        String sortParam = request.getParameter("sort");
        String pageParam = request.getParameter("page");

        Integer categoryId = null;
        if(categoryParam != null && !categoryParam.isEmpty()) {
            try {
                categoryId = Integer.parseInt(categoryParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        int page = 1;
        if(pageParam !=null){
            try{
                page = Integer.parseInt(pageParam);
            } catch (Exception e){
                page = 1;
            }
        }

        int pageSize = 12;
        List<Product> products = null;
        try {
            products = productDAO.getProducts(categoryId, sortParam, page, pageSize);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        int totalProducts = 0;
        try {
            totalProducts = productDAO.countProducts(categoryId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        String categoryName = "Tất Cả Sản Phẩm";
        if (categoryId != null) {
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
        request.getRequestDispatcher("/san-pham.jsp").forward(request, response);
    }
}
