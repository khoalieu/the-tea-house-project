package backend.controller.admin;

import backend.dao.BlogCategoryDAO;
import backend.model.BlogCategory;
import backend.model.User;
import backend.model.enums.UserRole;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/blog-categories/edit")
public class AdminEditCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User u = requireAdminOrEditor(request, response);
        if (u == null) return;

        int id = 0;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (Exception ignored) {}

        if (id <= 0) {
            response.sendRedirect(request.getContextPath() + "/admin/blog-categories");
            return;
        }

        BlogCategoryDAO dao = new BlogCategoryDAO();
        BlogCategory category = dao.getCategoryById(id);

        if (category == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        List<BlogCategory> allCategories = dao.getAllCategories();

        request.setAttribute("category", category);
        request.setAttribute("categories", allCategories);

        request.getRequestDispatcher("/admin/admin-edit-category-blog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User u = requireAdminOrEditor(request, response);
        if (u == null) return;

        request.setCharacterEncoding("UTF-8");

        int id = 0;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (Exception ignored) {}

        BlogCategoryDAO dao = new BlogCategoryDAO();
        BlogCategory oldCategory = dao.getCategoryById(id);

        if (oldCategory == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String name = trimOrNull(request.getParameter("name"));
        String slugInput = trimOrNull(request.getParameter("slug"));
        String description = trimOrNull(request.getParameter("description"));
        String isActiveStr = request.getParameter("is_active");

        BlogCategory inputCategory = new BlogCategory();
        inputCategory.setId(id);
        inputCategory.setName(name);
        inputCategory.setSlug(slugInput);
        inputCategory.setDescription(description);
        inputCategory.setIsActive("true".equals(isActiveStr));

        if (name == null || name.isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập tên danh mục.");
            request.setAttribute("category", inputCategory); // ✅ Giữ input user vừa nhập
            loadDataAndForward(request, response, dao);
            return;
        }

        // Tự động tạo slug từ tên nếu không nhập
        String finalSlug = (slugInput == null || slugInput.isEmpty())
                ? slugify(name)
                : slugify(slugInput);

        finalSlug = ensureUniqueSlug(dao, finalSlug, id);

        boolean isActive = "true".equals(isActiveStr);

        BlogCategory updated = new BlogCategory();
        updated.setId(id);
        updated.setName(name);
        updated.setSlug(finalSlug);
        updated.setDescription(description);
        updated.setIsActive(isActive);

        boolean ok = dao.updateCategory(updated);

        if (!ok) {
            request.setAttribute("error", "Cập nhật thất bại. Vui lòng thử lại.");
            request.setAttribute("category", inputCategory); // ✅ Giữ input
            loadDataAndForward(request, response, dao);
            return;
        }

        response.sendRedirect(request.getContextPath() + "/admin/blog-categories");
    }

    private void loadDataAndForward(HttpServletRequest request, HttpServletResponse response,
                                    BlogCategoryDAO dao)
            throws ServletException, IOException {
        if (request.getAttribute("category") == null) {
            request.setAttribute("category", new BlogCategory());
        }
        request.setAttribute("categories", dao.getAllCategories());
        request.getRequestDispatcher("/admin/admin-edit-category-blog.jsp").forward(request, response);
    }

    private User requireAdminOrEditor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return null;
        }
        User u = (User) session.getAttribute("user");
        if (u.getRole() != UserRole.ADMIN && u.getRole() != UserRole.EDITOR) {
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

    private String ensureUniqueSlug(BlogCategoryDAO dao, String base, Integer excludeId) {
        if (base == null || base.isEmpty()) base = "category";

        String candidate = base;
        int i = 2;

        while (dao.slugExistsExceptId(candidate, excludeId)) {
            candidate = base + "-" + i++;
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

    private void loadDataAndForward(HttpServletRequest request, HttpServletResponse response,
                                    BlogCategory category, BlogCategoryDAO dao)
            throws ServletException, IOException {
        request.setAttribute("category", category);
        request.setAttribute("categories", dao.getAllCategories());
        request.getRequestDispatcher("/admin/admin-edit-category-blog.jsp").forward(request, response);
    }
}
