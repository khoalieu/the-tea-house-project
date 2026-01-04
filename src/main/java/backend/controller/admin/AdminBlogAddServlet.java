package backend.controller.admin;

import backend.dao.BlogCategoryDAO;
import backend.dao.BlogPostDAO;
import backend.dao.UserDAO;
import backend.model.BlogCategory;
import backend.model.BlogPost;
import backend.model.User;
import backend.model.enums.BlogStatus;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;
import java.text.Normalizer;
import backend.model.enums.UserRole;


@WebServlet("/admin/blog/add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,      // 1MB
        maxFileSize = 2 * 1024 * 1024,        // 2MB
        maxRequestSize = 10 * 1024 * 1024     // 10MB
)
public class AdminBlogAddServlet extends HttpServlet {

    private static final DateTimeFormatter DT_LOCAL =
            DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // auth admin
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        User u = (User) session.getAttribute("user");
        if (u.getRole() == null || !(u.getRole() == UserRole.ADMIN || u.getRole() == UserRole.EDITOR)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }


        BlogCategoryDAO catDAO = new BlogCategoryDAO();
        UserDAO userDAO = new UserDAO();

        List<BlogCategory> allCategories = catDAO.getAllCategories();
        List<User> allAuthors = userDAO.getAllAdminUsers();

        request.setAttribute("allCategories", allCategories);
        request.setAttribute("allAuthors", allAuthors);

        request.getRequestDispatcher("/admin/admin-blog-add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // auth admin
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        User u = (User) session.getAttribute("user");
        if (u.getRole() == null || !(u.getRole() == UserRole.ADMIN || u.getRole() == UserRole.EDITOR)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }


        // lấy dữ liệu
        String title = request.getParameter("title");
        String slug = request.getParameter("slug");
        String excerpt = request.getParameter("excerpt");
        String content = request.getParameter("content");
        String statusStr = request.getParameter("status");
        String authorStr = request.getParameter("author_id");
        String categoryStr = request.getParameter("category_id");
        String metaTitle = request.getParameter("meta_title");
        String metaDesc = request.getParameter("meta_description");
        String createdAtStr = request.getParameter("created_at");

        if (title != null) title = title.trim();
        if (slug != null) slug = slug.trim();
        if (excerpt != null) excerpt = excerpt.trim();
        if (content != null) content = content.trim();
        if (metaTitle != null) metaTitle = metaTitle.trim();
        if (metaDesc != null) metaDesc = metaDesc.trim();
        if (createdAtStr != null) createdAtStr = createdAtStr.trim();

        // validate tối thiểu
        if (title == null || title.isEmpty()
                || excerpt == null || excerpt.isEmpty()
                || content == null || content.isEmpty()
                || statusStr == null || statusStr.isEmpty()
                || categoryStr == null || categoryStr.isEmpty()) {

            forwardWithData(request, response, "Vui lòng nhập đủ các trường bắt buộc.");
            return;
        }

        BlogStatus status;
        try {
            status = BlogStatus.valueOf(statusStr.trim().toUpperCase());
        } catch (Exception e) {
            forwardWithData(request, response, "Trạng thái không hợp lệ.");
            return;
        }

        Integer categoryId;
        try {
            categoryId = Integer.parseInt(categoryStr);
        } catch (Exception e) {
            forwardWithData(request, response, "Danh mục không hợp lệ.");
            return;
        }

        Integer authorId = null;
        try {
            if (authorStr != null && !authorStr.trim().isEmpty()) {
                authorId = Integer.parseInt(authorStr);
            }
        } catch (Exception ignored) {}

        // nếu không chọn author -> mặc định user đang login
        if (authorId == null) authorId = u.getId();

        // created_at optional
        LocalDateTime createdAt = null;
        if (createdAtStr != null && !createdAtStr.isEmpty()) {
            try {
                createdAt = LocalDateTime.parse(createdAtStr, DT_LOCAL);
            } catch (Exception e) {
                forwardWithData(request, response, "Ngày xuất bản không hợp lệ.");
                return;
            }
        }

        BlogPostDAO postDAO = new BlogPostDAO();

        // slug
        String finalSlug;
        if (slug == null || slug.isEmpty()) {
            finalSlug = slugify(title);
        } else {
            finalSlug = slugify(slug);
        }
        if (finalSlug.isEmpty()) finalSlug = "blog";

        if (postDAO.slugExists(finalSlug)) {
            // đơn giản: append random để tránh trùng UNIQUE
            finalSlug = finalSlug + "-" + System.currentTimeMillis();
        }

        // upload ảnh
        Part imgPart = request.getPart("featured_image");
        if (imgPart == null || imgPart.getSize() <= 0) {
            forwardWithData(request, response, "Vui lòng chọn ảnh đại diện.");
            return;
        }

        String relDir = "assets/images/blog";
        String absDir = getServletContext().getRealPath("/" + relDir);
        if (absDir == null) {
            forwardWithData(request, response, "Không lấy được đường dẫn lưu file (getRealPath null).");
            return;
        }

        Files.createDirectories(Paths.get(absDir));

        String submitted = Paths.get(imgPart.getSubmittedFileName()).getFileName().toString();
        String ext = "";
        int dot = submitted.lastIndexOf('.');
        if (dot >= 0) ext = submitted.substring(dot);

        String fileName = UUID.randomUUID().toString().replace("-", "") + ext;
        Path target = Paths.get(absDir, fileName);

        try (InputStream in = imgPart.getInputStream()) {
            Files.copy(in, target, StandardCopyOption.REPLACE_EXISTING);
        }

        String dbImagePath = relDir + "/" + fileName; // lưu DB (tương đối)

        // build object
        BlogPost p = new BlogPost();
        p.setTitle(title);
        p.setSlug(finalSlug);
        p.setExcerpt(excerpt);
        p.setContent(content);
        p.setFeaturedImage(dbImagePath);
        p.setAuthorId(authorId);
        p.setCategoryId(categoryId);
        p.setStatus(status);

        if (metaTitle != null && metaTitle.isEmpty()) metaTitle = null;
        if (metaDesc != null && metaDesc.isEmpty()) metaDesc = null;

        p.setMetaTitle(metaTitle);
        p.setMetaDescription(metaDesc);

        int newId = postDAO.insertForAdmin(p, createdAt);

        if (newId <= 0) {
            forwardWithData(request, response, "Thêm bài viết thất bại. Vui lòng thử lại.");
            return;
        }

        // xong -> list blos
        response.sendRedirect(request.getContextPath() + "/admin/blog");
    }

    private void forwardWithData(HttpServletRequest request, HttpServletResponse response, String error)
            throws ServletException, IOException {

        // load lại dropdown
        BlogCategoryDAO catDAO = new BlogCategoryDAO();
        UserDAO userDAO = new UserDAO();
        request.setAttribute("allCategories", catDAO.getAllCategories());
        request.setAttribute("allAuthors", userDAO.getAllAdminUsers());

        request.setAttribute("error", error);
        request.getRequestDispatcher("/admin/admin-blog-add.jsp").forward(request, response);
    }

    private String slugify(String input) {
        if (input == null) return "";
        String s = input.trim().toLowerCase();

        s = Normalizer.normalize(s, Normalizer.Form.NFD);
        s = s.replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
        s = s.replaceAll("[^a-z0-9]+", "-");
        s = s.replaceAll("(^-+|-+$)", "");
        return s;
    }
}
