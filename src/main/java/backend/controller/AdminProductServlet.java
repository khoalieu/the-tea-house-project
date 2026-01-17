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
import java.util.Collection;

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
            // LẤY DỮ LIỆU CƠ BẢN
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

            // XỬ LÝ ẢNH CHÍNH
            Part mainImagePart = request.getPart("image_url");
            String mainImageUrl = "";
            String uploadPath = getServletContext().getRealPath("/assets/images/products");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            if (mainImagePart != null && mainImagePart.getSize() > 0) {
                String fileName = Paths.get(mainImagePart.getSubmittedFileName()).getFileName().toString();
                String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
                mainImagePart.write(uploadPath + File.separator + uniqueFileName);
                mainImageUrl = "assets/images/products/" + uniqueFileName;
            }

            // TẠO PRODUCT VÀ LƯU VÀO DB
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
            product.setImageUrl(mainImageUrl);
            product.setCreatedAt(LocalDateTime.now());

            // Lưu và lấy ID sản phẩm mới
            int newProductId = productDAO.insertProduct(product);

            if (newProductId > 0) {
                // XỬ LÝ ẢNH PHỤ
                Collection<Part> parts = request.getParts();
                int sortOrder = 1;

                for (Part part : parts) {
                    if ("gallery[]".equals(part.getName()) && part.getSize() > 0) {
                        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                        if (fileName != null && !fileName.isEmpty()) {
                            // Upload file
                            String uniqueGalleryName = System.currentTimeMillis() + "_g_" + fileName;
                            part.write(uploadPath + File.separator + uniqueGalleryName);

                            String galleryUrl = "assets/images/products/" + uniqueGalleryName;
                            String altText = name + " - " + sortOrder;
                            productDAO.insertProductImage(newProductId, galleryUrl, altText, sortOrder);

                            sortOrder++;
                        }
                    }
                }

                // Thành công
                response.sendRedirect(request.getContextPath() + "/admin/product/add?msg=success");
            } else {
                request.setAttribute("error", "Thêm sản phẩm thất bại.");
                request.getRequestDispatcher("/admin/admin-product-add.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống: " + e.getMessage());
            request.getRequestDispatcher("/admin/admin-product-add.jsp").forward(request, response);
        }
    }
}