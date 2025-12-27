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
        BlogPostDAO dao = new BlogPostDAO();
        String q = request.getParameter("q");

        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception ignored) {}
        if (page < 1) page = 1;

        int total = dao.countBlogs(q);
        int totalPages = (int) Math.ceil((double) total / PAGE_SIZE);
        if (totalPages > 0 && page > totalPages) page = totalPages;

        List<BlogPost> blogs = dao.getBlogs(q, page, PAGE_SIZE);

        Map<Integer, String> dateMap = new HashMap<>();
        for (BlogPost b : blogs) {
            dateMap.put(b.getId(), b.getCreatedAt().format(DF));
        }

        request.setAttribute("blogs", blogs);
        request.setAttribute("dateMap", dateMap);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentQ", q);

        request.getRequestDispatcher("/blog.jsp").forward(request, response);
    }
}
