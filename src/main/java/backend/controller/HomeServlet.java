package backend.controller;

import backend.dao.BlogPostDAO;
import backend.dao.ProductDAO;
import backend.dao.PromotionDAO;
import backend.model.BlogPost;
import backend.model.Product;
import backend.model.Promotion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/index")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PromotionDAO promoDAO = new PromotionDAO();
        ProductDAO productDAO = new ProductDAO();
        BlogPostDAO blogDAO = new BlogPostDAO();

        // Active promotions (slider trên cùng)
        List<Promotion> activePromotions = promoDAO.getActivePromotions();

        // top 4 bán chạy theo parent category (1: trà thảo mộc, 2: nguyên liệu)
        List<Product> topHerbalTea = productDAO.getTopSellingByParentCategory(1, 4);
        List<Product> topMilkTeaIngredients = productDAO.getTopSellingByParentCategory(2, 4);

        // Top 3 blog view cao nhất
        List<BlogPost> topBlogs = blogDAO.getTopViewedPublished(3);

        request.setAttribute("activePromotions", activePromotions);
        request.setAttribute("topHerbalTea", topHerbalTea);
        request.setAttribute("topMilkTeaIngredients", topMilkTeaIngredients);
        request.setAttribute("topBlogs", topBlogs);

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
