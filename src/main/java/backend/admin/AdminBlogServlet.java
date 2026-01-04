package backend.admin;

import backend.dao.BlogCategoryDAO;
import backend.dao.BlogPostDAO;
import backend.model.BlogCategory;
import backend.model.BlogPost;
import backend.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminBlogServlet", value = "/AdminBlogServlet")
public class AdminBlogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        User user = (User) session.getAttribute("user");
        if (!"ADMIN".equals(user.getRole().name())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        BlogPostDAO postDAO = new BlogPostDAO();
        BlogCategoryDAO catDAO = new BlogCategoryDAO();

        List<BlogPost> posts = postDAO.getPostsForAdmin();

        Map<Integer, String> categoryMap = new HashMap<>();
        for (BlogCategory c : catDAO.getAllCategories()) categoryMap.put(c.getId(), c.getName());

        request.setAttribute("posts", posts);
        request.setAttribute("categoryMap", categoryMap);

        request.getRequestDispatcher("/admin/admin-blog.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}