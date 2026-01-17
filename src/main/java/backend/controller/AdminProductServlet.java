package backend.controller;

import backend.dao.ProductDAO;
import backend.model.Product;
import backend.model.enums.ProductStatus;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDateTime;

@WebServlet(name = "AdminProductServlet", urlPatterns = {"/admin/product/add"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AdminProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/admin-product-add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            String name = request.getParameter("name");
            String slug = request.getParameter("slug");
            if (slug == null || slug.trim().isEmpty()) {
                slug = name.toLowerCase().replaceAll("[^a-z0-9]+", "-").replaceAll("^-|-$", "");
            }

            String shortDesc = request.getParameter("short_description");
            String description = request.getParameter("description");
            String ingredients = request.getParameter("ingredients");
            String usage = request.getParameter("usage_instructions");
            String sku = request.getParameter("sku");

            double price = Double.parseDouble(request.getParameter("price"));
            double salePrice = 0;
            String salePriceStr = request.getParameter("sale_price");
            if(salePriceStr != null && !salePriceStr.isEmpty()) {
                salePrice = Double.parseDouble(salePriceStr);
            }

            int stock = Integer.parseInt(request.getParameter("stock_quantity"));
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            String statusStr = request.getParameter("status");
            boolean isBestseller = "1".equals(request.getParameter("is_bestseller"));

            //xu ly upload anh
            Part filePart = request.getPart("image_url");
            String imageUrl = "";

            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                // Lưu ảnh vào thư mục assets/images/products của project
                String uploadDir = getServletContext().getRealPath("/assets/images/products");
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) uploadDirFile.mkdirs();

                String filePath = uploadDir + File.separator + fileName;
                filePart.write(filePath);

                imageUrl = "assets/images/products/" + fileName;
            }

            Product product = new Product();
            product.setName(name);
            product.setSlug(slug);
            product.setShortDescription(shortDesc);
            product.setDescription(description);
            product.setPrice(price);
            product.setSalePrice(salePrice);
            product.setStockQuantity(stock);
            product.setSku(sku);
            product.setCategoryId(categoryId);
            product.setStatus(ProductStatus.valueOf(statusStr.toUpperCase()));
            product.setBestseller(isBestseller);
            product.setIngredients(ingredients);
            product.setUsageInstructions(usage);
            product.setImageUrl(imageUrl);
            product.setCreatedAt(LocalDateTime.now());
            boolean success = productDAO.insertProduct(product);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/admin-products.jsp?msg=success");
            } else {
                request.setAttribute("error", "Thêm sản phẩm thất bại.");
                request.getRequestDispatcher("/admin/admin-product-add.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            request.getRequestDispatcher("/admin/admin-product-add.jsp").forward(request, response);
        }
    }
}