package backend.controller.admin;

import backend.dao.*;
import backend.model.*;
import backend.model.enums.UserRole;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.*;

@WebServlet("/admin/blog/detail")
public class AdminBlogDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User me = requireAdmin(request, response);
        if (me == null) return;

        int id;
        try { id = Integer.parseInt(request.getParameter("id")); }
        catch (Exception e) { response.sendRedirect(request.getContextPath() + "/admin/blog"); return; }

        BlogPostDAO postDAO = new BlogPostDAO();
        BlogPost post = postDAO.getByIdForAdmin(id);
        if (post == null) { response.sendError(404); return; }

        BlogCategory category = null;
        if (post.getCategoryId() != null) {
            category = new BlogCategoryDAO().getById(post.getCategoryId());
        }

        List<BlogComment> comments = new BlogCommentDAO().getByPostId(post.getId());

        // map user cho: tác giả bài + người comment
        Set<Integer> userIds = new HashSet<>();
        if (post.getAuthorId() != null) userIds.add(post.getAuthorId());
        for (BlogComment c : comments) if (c.getUserId() != null) userIds.add(c.getUserId());

        Map<Integer, User> userMap = new UserDAO().getMapByIds(userIds);
        if (post.getAuthorId() != null) post.setAuthor(userMap.get(post.getAuthorId()));

        request.setAttribute("post", post);
        request.setAttribute("category", category);
        request.setAttribute("comments", comments);
        request.setAttribute("commentsCount", comments.size());
        request.setAttribute("commentUserMap", userMap);

        request.getRequestDispatcher("/admin/admin-blog-detail.jsp").forward(request, response);
    }

    private User requireAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !(session.getAttribute("user") instanceof User)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return null;
        }
        User u = (User) session.getAttribute("user");
        if (u.getRole() == null || !(u.getRole() == UserRole.ADMIN || u.getRole() == UserRole.EDITOR)) {
            response.sendError(403);
            return null;
        }
        return u;
    }
}
