package backend.controller.admin;

import backend.dao.BlogCategoryDAO;
import backend.dao.BlogPostDAO;
import backend.dao.UserDAO;
import backend.model.BlogPost;
import backend.model.User;
import backend.model.enums.BlogStatus;
import backend.model.enums.UserRole;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.nio.file.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/admin/blog/edit")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,      // 1MB
        maxFileSize = 2L * 1024 * 1024,       // 2MB
        maxRequestSize = 5L * 1024 * 1024     // 5MB
)
public class AdminBlogEditServlet extends HttpServlet {

    private static final DateTimeFormatter DT_LOCAL =
            DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User u = requireAdminOrEditor(request, response);
        if (u == null) return;

        int id = 0;
        try { id = Integer.parseInt(request.getParameter("id")); } catch (Exception ignored) {}
        if (id <= 0) {
            response.sendRedirect(request.getContextPath() + "/admin/blog");
            return;
        }

        BlogPostDAO postDAO = new BlogPostDAO();
        BlogPost post = postDAO.getByIdForAdmin(id);
        if (post == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        BlogCategoryDAO catDAO = new BlogCategoryDAO();
        UserDAO userDAO = new UserDAO();

        request.setAttribute("post", post);
        request.setAttribute("allCategories", catDAO.getAllCategories());
        request.setAttribute("allAuthors", userDAO.getAllAdminUsers());

        request.getRequestDispatcher("/admin/admin-blog-edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User u = requireAdminOrEditor(request, response);
        if (u == null) return;

        request.setCharacterEncoding("UTF-8");

        int id = 0;
        try { id = Integer.parseInt(request.getParameter("id")); } catch (Exception ignored) {}
        if (id <= 0) {
            response.sendRedirect(request.getContextPath() + "/admin/blog");
            return;
        }

        BlogPostDAO postDAO = new BlogPostDAO();
        BlogPost old = postDAO.getByIdForAdmin(id);
        if (old == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String title = trimOrNull(request.getParameter("title"));
        String slugInput = trimOrNull(request.getParameter("slug"));
        String excerpt = trimOrNull(request.getParameter("excerpt"));
        String content = trimOrNull(request.getParameter("content"));

        String statusStr = request.getParameter("status");
        String categoryStr =request.getParameter("category_id");
        String authorStr = request.getParameter("author_id");

        String metaTitle = trimOrNull(request.getParameter("meta_title"));
        String metaDesc = trimOrNull(request.getParameter("meta_description"));

        String createdAtStr = request.getParameter("created_at");

        if (title == null) {
            request.setAttribute("error", "Vui lòng nhập Tiêu đề.");
            doGet(request, response);
            return;
        }
        if (excerpt == null) {
            request.setAttribute("error", "Vui lòng nhập Mô tả ngắn (Excerpt).");
            doGet(request, response);
            return;
        }
        if (content == null) {
            request.setAttribute("error", "Vui lòng nhập Nội dung bài viết.");
            doGet(request, response);
            return;
        }

        // ====== VALIDATE REQUIRED SELECT ======
        if (statusStr == null) {
            request.setAttribute("error", "Vui lòng chọn Trạng thái.");
            doGet(request, response);
            return;
        }
        if (categoryStr == null) {
            request.setAttribute("error", "Vui lòng chọn Danh mục.");
            doGet(request, response);
            return;
        }

        BlogStatus st;
        try {
            st = BlogStatus.valueOf(statusStr.toUpperCase());
        } catch (Exception e) {
            request.setAttribute("error", "Trạng thái không hợp lệ.");
            doGet(request, response);
            return;
        }

        Integer categoryId;
        try {
            categoryId = Integer.parseInt(categoryStr);
        } catch (Exception e) {
            request.setAttribute("error", "Danh mục không hợp lệ.");
            doGet(request, response);
            return;
        }

        Integer authorId = null;
        try { if (authorStr != null) authorId = Integer.parseInt(authorStr); } catch (Exception ignored) {}
        if (authorId == null) authorId = old.getAuthorId();
        if (createdAtStr != null) {
            try {
                LocalDateTime createdAt = LocalDateTime.parse(createdAtStr, DT_LOCAL);
                if (createdAt.isAfter(LocalDateTime.now())) {
                    request.setAttribute("error", "Ngày xuất bản phải nhỏ hơn hoặc bằng thời gian hiện tại.");
                    doGet(request, response);
                    return;
                }
            } catch (Exception e) {
                request.setAttribute("error", "Ngày xuất bản không hợp lệ.");
                doGet(request, response);
                return;
            }
        }

        //  để trống slug lấy title
        String rawForSlug = (slugInput == null) ? title : slugInput;
        String finalSlug = ensureUniqueSlug(postDAO, rawForSlug, id); // exclude chính nó

        String uploadedPath = null;
        try {
            Part imgPart = request.getPart("featured_image");
            uploadedPath = saveBlogImage(imgPart, false);
        } catch (IllegalArgumentException ex) {
            request.setAttribute("error", ex.getMessage());
            doGet(request, response);
            return;
        }

        boolean keepOldImage = (uploadedPath == null);
        String imagePath = keepOldImage ? old.getFeaturedImage() : uploadedPath;

        BlogPost updated = new BlogPost();
        updated.setId(id);
        updated.setTitle(title);
        updated.setSlug(finalSlug);
        updated.setExcerpt(excerpt);
        updated.setContent(content);
        updated.setAuthorId(authorId);
        updated.setCategoryId(categoryId);
        updated.setStatus(st);
        updated.setMetaTitle(metaTitle);
        updated.setMetaDescription(metaDesc);
        updated.setFeaturedImage(imagePath);

        boolean ok = postDAO.updateForAdmin(updated, keepOldImage);
        if (!ok) {
            request.setAttribute("error", "Cập nhật thất bại");
            doGet(request, response);
            return;
        }
        boolean preview = "preview".equalsIgnoreCase(request.getParameter("action"));
        if (preview) {
            response.sendRedirect(request.getContextPath() + "/admin/blog/detail?id=" + id);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/blog");
        }
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
    // upload image
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
