package backend.controller;

import backend.dao.UserDAO;
import backend.model.User;
import backend.model.enums.UserRole;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet",urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserDAO  userDAO = new UserDAO();
        User account = userDAO.checkLogin(username,password);

        if(account!=null){
            HttpSession session = req.getSession();
            session.setAttribute("auth", account);
            session.setMaxInactiveInterval(30 * 60);
            if(account.getRole() == (UserRole.ADMIN)) {
                resp.sendRedirect(req.getContextPath()+"/admin/admin-dashboard.jsp");
            }
            else{
                resp.sendRedirect(req.getContextPath()+"/index.jsp");
            }
        }
        else {
            req.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            req.setAttribute("username", username);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }


    }
}
