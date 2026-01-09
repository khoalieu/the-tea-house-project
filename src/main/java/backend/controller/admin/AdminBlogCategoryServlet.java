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

@WebServlet("/admin/blog-categories")
public class AdminBlogCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!checkAdminAccess(request, response)) return;

        BlogCategoryDAO dao = new BlogCategoryDAO();
        List<BlogCategory> categories = dao.getAllCategories();

        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/admin/admin-blog-categories.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        if (!checkAdminAccess(request, response)) return;

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            handleAdd(request, response);
        } else if ("delete".equals(action)) {
            handleDelete(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/blog-categories");
        }
    }

    private void handleAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = trimOrNull(request.getParameter("name"));
        String slugInput = trimOrNull(request.getParameter("slug"));
        String description = trimOrNull(request.getParameter("description"));
        String isActiveStr = request.getParameter("is_active");

        if (name == null || name.isEmpty()) {
            BlogCategoryDAO dao = new BlogCategoryDAO();
            request.setAttribute("error", "Vui lòng nhập tên danh mục.");
            request.setAttribute("categories", dao.getAllCategories());
            request.setAttribute("inputName", "");
            request.setAttribute("inputSlug", slugInput);
            request.setAttribute("inputDescription", description);
            request.setAttribute("inputIsActive", isActiveStr);
            request.getRequestDispatcher("/admin/admin-blog-categories.jsp").forward(request, response);
            return;
        }

        BlogCategoryDAO dao = new BlogCategoryDAO();
        String finalSlug = ensureUniqueSlug(dao, slugInput != null ? slugInput : name, null);

        BlogCategory cat = new BlogCategory();
        cat.setName(name);
        cat.setSlug(finalSlug);
        cat.setDescription(description);
        cat.setIsActive("true".equals(isActiveStr));

        int newId = dao.insertCategory(cat);
        if (newId > 0) {
            response.sendRedirect(request.getContextPath() + "/admin/blog-categories?msg=added");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/blog-categories");
        }
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                BlogCategoryDAO dao = new BlogCategoryDAO();
                dao.deleteCategory(id);
                response.sendRedirect(request.getContextPath() + "/admin/blog-categories?msg=deleted");
                return;
            } catch (NumberFormatException ignored) {}
        }
        response.sendRedirect(request.getContextPath() + "/admin/blog-categories");
    }

    private boolean checkAdminAccess(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }
        User u = (User) session.getAttribute("user");
        if (u.getRole() == null || !(u.getRole() == UserRole.ADMIN || u.getRole() == UserRole.EDITOR)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return false;
        }
        return true;
    }

    private String trimOrNull(String s) {
        if (s == null) return null;
        s = s.trim();
        return s.isEmpty() ? null : s;
    }

    private String ensureUniqueSlug(BlogCategoryDAO dao, String raw, Integer excludeId) {
        String base = slugify(raw);
        if (base.isEmpty()) base = "category";

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
}
