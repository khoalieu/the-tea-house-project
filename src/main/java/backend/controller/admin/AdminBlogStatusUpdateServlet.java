package backend.controller.admin;

import backend.dao.BlogPostDAO;
import backend.model.enums.BlogStatus;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.*;

@WebServlet(name = "AdminBlogStatusUpdateServlet", value = "/admin/blog/status-update")
public class AdminBlogStatusUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String newStatusStr = request.getParameter("newStatus");
        String[] idParams = request.getParameterValues("ids");

        List<Integer> ids = new ArrayList<>();
        if (idParams != null) {
            for (String id : idParams) {
                try {
                    ids.add(Integer.parseInt(id.trim()));
                } catch (NumberFormatException ignored) {}
            }
        }

        BlogStatus newStatus = null;
        try {
            if (newStatusStr != null) {
                newStatus = BlogStatus.valueOf(newStatusStr.toUpperCase());
            }
        } catch (IllegalArgumentException ignored) {}

        BlogPostDAO dao = new BlogPostDAO();
        boolean success = dao.updateStatusByIds(ids, newStatus);

        if (success) {
            response.sendRedirect(request.getContextPath() +
                    "/admin/blog?msg=status_updated&status=" + newStatusStr +
                    "&count=" + ids.size());
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/blog");
        }
    }
}
