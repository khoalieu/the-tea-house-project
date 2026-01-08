package backend.controller;

import backend.dao.BlogCategoryDAO;
import backend.dao.BlogPostDAO;
import backend.dao.UserDAO;
import backend.model.BlogCategory;
import backend.model.BlogPost;
import backend.model.User;
import backend.model.enums.BlogStatus;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/admin/edit-blog")
public class AdminEditBlogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/quan-ly-blog.jsp");
            return;
        }

        int postId;
        try {
            postId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/quan-ly-blog.jsp");
            return;
        }

        BlogPostDAO postDAO = new BlogPostDAO();
        BlogPost post = postDAO.getById(postId);

        if (post == null) {
            response.sendRedirect(request.getContextPath() + "/admin/quan-ly-blog.jsp");
            return;
        }

        BlogCategoryDAO categoryDAO = new BlogCategoryDAO();
        List<BlogCategory> categories = categoryDAO.getAllCategories();

        UserDAO userDAO = new UserDAO();
        List<User> authors = userDAO.getAllAdminUsers();

        request.setAttribute("post", post);
        request.setAttribute("categories", categories);
        request.setAttribute("authors", authors);

        request.getRequestDispatcher("/admin/edit-blog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/admin/quan-ly-blog.jsp");
            return;
        }

        int postId = Integer.parseInt(idParam);

        String title = request.getParameter("title");
        String slug = request.getParameter("slug");
        String excerpt = request.getParameter("excerpt");
        String content = request.getParameter("content");
        String featuredImage = request.getParameter("featuredImage");
        String categoryIdStr = request.getParameter("categoryId");
        String authorIdStr = request.getParameter("authorId");
        String statusStr = request.getParameter("status");
        String metaTitle = request.getParameter("metaTitle");
        String metaDescription = request.getParameter("metaDescription");
        String createdAtStr = request.getParameter("createdAt");

        if (title == null || title.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Tiêu đề không được để trống!");
            doGet(request, response);
            return;
        }

        if (slug == null || slug.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Slug không được để trống!");
            doGet(request, response);
            return;
        }

        BlogPostDAO postDAO = new BlogPostDAO();
        BlogPost existingPost = postDAO.getById(postId);

        if (existingPost == null) {
            response.sendRedirect(request.getContextPath() + "/admin/quan-ly-blog.jsp");
            return;
        }

        if (!existingPost.getSlug().equals(slug.trim()) && postDAO.slugExists(slug.trim())) {
            request.setAttribute("errorMessage", "Slug đã tồn tại!");
            doGet(request, response);
            return;
        }

        BlogPost post = new BlogPost();
        post.setId(postId);
        post.setTitle(title.trim());
        post.setSlug(slug.trim());
        post.setExcerpt(excerpt != null ? excerpt.trim() : null);
        post.setContent(content != null ? content.trim() : null);
        post.setFeaturedImage(featuredImage != null ? featuredImage.trim() : null);

        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            post.setCategoryId(Integer.parseInt(categoryIdStr));
        } else {
            post.setCategoryId(null);
        }

        if (authorIdStr != null && !authorIdStr.isEmpty()) {
            post.setAuthorId(Integer.parseInt(authorIdStr));
        } else {
            post.setAuthorId(null);
        }

        if (statusStr != null && !statusStr.isEmpty()) {
            post.setStatus(BlogStatus.valueOf(statusStr.toUpperCase()));
        } else {
            post.setStatus(BlogStatus.DRAFT);
        }

        post.setMetaTitle(metaTitle != null ? metaTitle.trim() : null);
        post.setMetaDescription(metaDescription != null ? metaDescription.trim() : null);

        LocalDateTime createdAt = null;
        if (createdAtStr != null && !createdAtStr.isEmpty()) {
            try {
                createdAt = LocalDateTime.parse(createdAtStr, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
            } catch (Exception ignored) {}
        }

        boolean success = postDAO.updateForAdmin(post, createdAt);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/quan-ly-blog.jsp?success=edit");
        } else {
            request.setAttribute("errorMessage", "Cập nhật bài viết thất bại!");
            doGet(request, response);
        }
    }
}
