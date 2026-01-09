package backend.controller.admin;

import backend.dao.BlogCategoryDAO;
import backend.dao.BlogPostDAO;
import backend.dao.UserDAO;
import backend.model.BlogCategory;
import backend.model.BlogPost;
import backend.model.User;
import backend.model.enums.BlogStatus;
import backend.model.enums.UserRole;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

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

        User u = requireAdminOrEditor(request, response);
        if (u == null) return;

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

        User u = requireAdminOrEditor(request, response);
        if (u == null) return;

        // ====== READ PARAMS (trimOrNull) ======
        String title = trimOrNull(request.getParameter("title"));
        String slugInput = trimOrNull(request.getParameter("slug"));
        String excerpt = trimOrNull(request.getParameter("excerpt"));
        String content = trimOrNull(request.getParameter("content"));

        String statusStr = trimOrNull(request.getParameter("status"));
        String categoryStr = trimOrNull(request.getParameter("category_id"));
        String authorStr = trimOrNull(request.getParameter("author_id"));

        String metaTitle = trimOrNull(request.getParameter("meta_title"));
        String metaDesc = trimOrNull(request.getParameter("meta_description"));
        String createdAtStr = trimOrNull(request.getParameter("created_at"));

        // ====== VALIDATE REQUIRED TEXT ======
        if (title == null) {
            forwardWithData(request, response, "Vui lòng nhập Tiêu đề.");
            return;
        }
        if (excerpt == null) {
            forwardWithData(request, response, "Vui lòng nhập Mô tả ngắn (Excerpt).");
            return;
        }
        if (content == null) {
            forwardWithData(request, response, "Vui lòng nhập Nội dung bài viết.");
            return;
        }

        if (statusStr == null) {
            forwardWithData(request, response, "Vui lòng chọn Trạng thái.");
            return;
        }
        if (categoryStr == null) {
            forwardWithData(request, response, "Vui lòng chọn Danh mục.");
            return;
        }

        BlogStatus status;
        try {
            status = BlogStatus.valueOf(statusStr.toUpperCase());
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
            if (authorStr != null) authorId = Integer.parseInt(authorStr);
        } catch (Exception ignored) {}
        if (authorId == null) authorId = u.getId(); // default

        LocalDateTime createdAt = null;
        if (createdAtStr != null) {
            try {
                createdAt = LocalDateTime.parse(createdAtStr, DT_LOCAL);
            } catch (Exception e) {
                forwardWithData(request, response, "Ngày xuất bản không hợp lệ.");
                return;
            }
            if (createdAt.isAfter(LocalDateTime.now())) {
                forwardWithData(request, response, "Ngày xuất bản phải nhỏ hơn hoặc bằng thời gian hiện tại.");
                return;
            }
        }

        BlogPostDAO postDAO = new BlogPostDAO();

        //  slug
        String rawForSlug = (slugInput == null) ? title : slugInput;
        String finalSlug = ensureUniqueSlug(postDAO, rawForSlug, null);

        // imgae upload
        String imagePath;
        try {
            Part imgPart = request.getPart("featured_image");
            imagePath = saveBlogImage(imgPart, true);
        } catch (IllegalArgumentException ex) {
            forwardWithData(request, response, ex.getMessage());
            return;
        }

        BlogPost p = new BlogPost();
        p.setTitle(title);
        p.setSlug(finalSlug);
        p.setExcerpt(excerpt);
        p.setContent(content);
        p.setFeaturedImage(imagePath);
        p.setAuthorId(authorId);
        p.setCategoryId(categoryId);
        p.setStatus(status);
        p.setMetaTitle(metaTitle);
        p.setMetaDescription(metaDesc);

        int newId = postDAO.insertForAdmin(p, createdAt);
        if (newId <= 0) {
            forwardWithData(request, response, "Thêm bài viết thất bại. Vui lòng thử lại.");
            return;
        }
        boolean preview = "preview".equalsIgnoreCase(request.getParameter("action"));
        if (preview) {
            response.sendRedirect(request.getContextPath() + "/admin/blog/detail?id=" + newId);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/blog");
        }
    }

    private void forwardWithData(HttpServletRequest request, HttpServletResponse response, String error)
            throws ServletException, IOException {

        BlogCategoryDAO catDAO = new BlogCategoryDAO();
        UserDAO userDAO = new UserDAO();
        request.setAttribute("allCategories", catDAO.getAllCategories());
        request.setAttribute("allAuthors", userDAO.getAllAdminUsers());

        request.setAttribute("error", error);
        request.getRequestDispatcher("/admin/admin-blog-add.jsp").forward(request, response);
    }


    private User requireAdminOrEditor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return null;
        }
        User u = (User) session.getAttribute("user");
        if (u.getRole() == null || !(u.getRole() == UserRole.ADMIN || u.getRole() == UserRole.EDITOR)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return null;
        }
        return u;
    }

    private String trimOrNull(String s) {
        if (s == null) return null;
        s = s.trim();
        return s.isEmpty() ? null : s;
    }

    private String ensureUniqueSlug(BlogPostDAO dao, String raw, Integer excludeId) {
        String base = slugify(raw);
        if (base.isEmpty()) base = "blog";

        String candidate = base;
        int i = 2;

        while (excludeId == null
                ? dao.slugExists(candidate)
                : dao.slugExistsExceptId(candidate, excludeId)) {
            candidate = base + "-" + (i++);
        }
        return candidate;
    }

    private String slugify(String input) {
        if (input == null) return "";
        String s = input.trim().toLowerCase();

        s = java.text.Normalizer.normalize(s, java.text.Normalizer.Form.NFD);
        s = s.replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
        s = s.replace("đ", "d");

        s = s.replaceAll("[^a-z0-9]+", "-");
        s = s.replaceAll("(^-+|-+$)", "");
        return s;
    }

    private String saveBlogImage(Part part, boolean required) {
        try {
            if (part == null || part.getSize() == 0) {
                if (required) throw new IllegalArgumentException("Vui lòng chọn ảnh.");
                return null; // edit: không chọn ảnh -> giữ ảnh cũ
            }

            String relDir = "assets/images/blog";
            String absDir = getServletContext().getRealPath("/" + relDir);
            Files.createDirectories(Paths.get(absDir));

            String submitted = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String ext = "";
            int dot = submitted.lastIndexOf('.');
            if (dot >= 0) ext = submitted.substring(dot);

            String fileName = System.currentTimeMillis() + ext;
            Path target = Paths.get(absDir, fileName);

            try (java.io.InputStream in = part.getInputStream()) {
                Files.copy(in, target, StandardCopyOption.REPLACE_EXISTING);
            }

            return relDir + "/" + fileName;
        } catch (IllegalArgumentException e) {
            throw e;
        } catch (Exception e) {
            throw new IllegalArgumentException("Upload ảnh lỗi.");
        }
    }

}
