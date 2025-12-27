package backend.controller;

import backend.dao.BlogPostDAO;
import backend.model.BlogPost;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/blog")
public class BlogServlet extends HttpServlet {

    private static final int PAGE_SIZE = 6;
    private static final DateTimeFormatter DF =
            DateTimeFormatter.ofPattern("dd/MM/yyyy");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception ignored) {}

        if (page < 1) page = 1;

        BlogPostDAO dao = new BlogPostDAO();

        int totalBlogs = dao.countPublishedBlogs();
        int totalPages = (int) Math.ceil((double) totalBlogs / PAGE_SIZE);

        if (totalPages > 0 && page > totalPages) page = totalPages;

        List<BlogPost> blogs = dao.getPublishedBlogs(page, PAGE_SIZE);

        // map: blogId -> date string
        Map<Integer, String> dateMap = new HashMap<>();
        for (BlogPost b : blogs) {
            if (b.getCreatedAt() != null) {
                dateMap.put(b.getId(), b.getCreatedAt().format(DF));
            }
        }

        request.setAttribute("blogs", blogs);
        request.setAttribute("dateMap", dateMap);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("/blog.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
