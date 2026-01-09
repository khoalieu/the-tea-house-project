package backend.controller.admin;

import backend.dao.BlogCommentDAO;
import backend.dao.UserDAO;
import backend.model.BlogComment;
import backend.model.User;
import backend.model.enums.UserRole;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/blog/comment")
public class AdminBlogCommentActionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User me = requireAdmin(request, response);
        if (me == null) return;

        String action = request.getParameter("action"); // reply | delete
        int postId = parseInt(request.getParameter("postId"));
        if (postId <= 0) { response.sendRedirect(request.getContextPath() + "/admin/blog"); return; }

        BlogCommentDAO dao = new BlogCommentDAO();

        if ("delete".equals(action)) {
            int commentId = parseInt(request.getParameter("commentId"));
            if (commentId > 0) dao.deleteById(commentId);
            response.sendRedirect(request.getContextPath() + "/admin/blog/detail?id=" + postId);
            return;
        }

        if ("reply".equals(action)) {
            int replyToId = parseInt(request.getParameter("commentId"));
            String text = trimorNull(request.getParameter("text"));
            if (text.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/admin/blog/detail?id=" + postId + "&err=empty");
                return;
            }

            String prefix = "";
            if (replyToId > 0) {
                BlogComment target = dao.getById(replyToId);
                if (target != null) {
                    User u = new UserDAO().getById(target.getUserId());
                    String name = (u == null) ? ("User " + target.getUserId()) : u.getDisplayName();
                    prefix = "Trả lời @" + name + ": ";
                }
            }

            dao.insert(postId, me.getId(), prefix + text);
            response.sendRedirect(request.getContextPath() + "/admin/blog/detail?id=" + postId);
            return;
        }

        response.sendRedirect(request.getContextPath() + "/admin/blog/detail?id=" + postId);
    }

    private int parseInt(String s) {
        try { return Integer.parseInt(s); } catch (Exception e) { return -1; }
    }

    private String trimorNull(String s) { return s == null ? "" : s.trim(); }

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
