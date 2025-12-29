package backend.controller;

import backend.dao.BlogCategoryDAO;
import backend.dao.BlogPostDAO;
import backend.model.BlogCategory;
import backend.model.BlogPost;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/blog")
public class BlogServlet extends HttpServlet {

    private static final int PAGE_SIZE = 6;
    private static final DateTimeFormatter DF = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BlogPostDAO postDAO = new BlogPostDAO();
        BlogCategoryDAO catDAO = new BlogCategoryDAO();

        String cat = request.getParameter("cat");
        String q = request.getParameter("q");

        if (cat != null) cat = cat.trim();
        if (q != null) q = q.trim();

        boolean hasCat = (cat != null && !cat.isEmpty());
        boolean hasQ = (q != null && !q.isEmpty());

        // q null reset về /blog
        if (request.getParameter("q") != null && !hasQ) {
            response.sendRedirect(request.getContextPath() + "/blog");
            return;
        }
        int page = 1;
        try { page = Integer.parseInt(request.getParameter("page")); } catch (Exception e) {}
        if (page < 1) page = 1;

        // count + pages + list theo mode
        int total = 0;
        List<BlogPost> blogs;

        // search
        if (hasQ) {
            total = postDAO.countSearchPublished(q);
            int totalPages = (int) Math.ceil((double) total / PAGE_SIZE);
            if (totalPages > 0 && page > totalPages) page = totalPages;

            blogs = (total == 0) ? new ArrayList<>() : postDAO.searchPublished(q, page, PAGE_SIZE);

            request.setAttribute("mode", "search");
            request.setAttribute("q", q);
            request.setAttribute("cat", null);
            request.setAttribute("activeCatSlug", null);
            request.setAttribute("totalPages", totalPages);
        }
        // category
        else if (hasCat) {
            total = postDAO.countPublishedByCategorySlug(cat);
            int totalPages = (int) Math.ceil((double) total / PAGE_SIZE);
            if (totalPages > 0 && page > totalPages) page = totalPages;

            blogs = (total == 0) ? new ArrayList<>() : postDAO.getPublishedByCategorySlug(cat, page, PAGE_SIZE);

            request.setAttribute("mode", "cat");
            request.setAttribute("cat", cat);
            request.setAttribute("q", null);
            request.setAttribute("activeCatSlug", cat);
            request.setAttribute("totalPages", totalPages);
        }
        // ALL
        else {
            total = postDAO.countAllPublished();
            int totalPages = (int) Math.ceil((double) total / PAGE_SIZE);
            if (totalPages > 0 && page > totalPages) page = totalPages;

            blogs = (total == 0) ? new ArrayList<>() : postDAO.getAllPublished(page, PAGE_SIZE);

            request.setAttribute("mode", "all");
            request.setAttribute("cat", null);
            request.setAttribute("q", null);
            request.setAttribute("activeCatSlug", null);
            request.setAttribute("totalPages", totalPages);
        }

        // message rỗng
        String emptyMessage = "Chưa có bài viết nào.";
        if (blogs.isEmpty() && (hasQ || hasCat)) emptyMessage = "Không tìm thấy bài viết phù hợp!";

        // dateMap
        Map<Integer, String> dateMap = new HashMap<>();
        for (BlogPost b : blogs) {
            if (b.getCreatedAt() != null) dateMap.put(b.getId(), b.getCreatedAt().format(DF));
        }
        // sidebar data
        List<BlogCategory> categories = catDAO.getActiveCategories();
        Map<Integer, Integer> categoryCountMap = catDAO.getPublishedCountMap();
        List<BlogPost> recentPosts = postDAO.getRecentPublishedPosts(3);

        Map<Integer, String> recent = new HashMap<>();
        for (BlogPost p : recentPosts) {
            if (p.getCreatedAt() != null) recent.put(p.getId(), p.getCreatedAt().format(DF));
        }

        request.setAttribute("blogs", blogs);
        request.setAttribute("dateMap", dateMap);
        request.setAttribute("categories", categories);
        request.setAttribute("categoryCountMap", categoryCountMap);
        request.setAttribute("recentPosts", recentPosts);
        request.setAttribute("recent", recent);

        request.setAttribute("currentPage", page);
        request.setAttribute("emptyMessage", emptyMessage);

        request.getRequestDispatcher("/blog.jsp").forward(request, response);
    }
}
