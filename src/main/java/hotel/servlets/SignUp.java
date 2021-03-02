package hotel.servlets;

import hotel.dao.DAOUser;
import hotel.entity.User;
import hotel.enums.Language;
import hotel.enums.Role;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signUp")
public class SignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (Role.MANAGER.name().equals(req.getSession().getAttribute("role"))){
            req.setAttribute("registerNewManager",true);
        }


        req.getRequestDispatcher("/view/sign_up.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        User user = new User();

        if (!req.getParameter("password").equals(req.getParameter("confirm_password"))){
            String redirectedURL = req.getRequestURL().toString();
            redirectedURL+="?error=passwordsError";
            if (req.getQueryString()!=null){
                redirectedURL+="&"+req.getQueryString();
            }
            resp.sendRedirect(redirectedURL);
            return;
        }

        user.setName(req.getParameter("first_name"));
        user.setSurname(req.getParameter("last_name"));
        user.setEmail(req.getParameter("email"));
        user.setPassword(req.getParameter("password"));

        if (Role.MANAGER.name().equals(req.getSession().getAttribute("role"))){
            user.setRole(Role.MANAGER);
        }else {
            user.setRole(Role.CLIENT);
        }

        user.setLanguage(Language.valueOf(req.getSession().getAttribute("language").toString()));
        DAOUser.add(user);
        resp.sendRedirect(req.getContextPath()+"/rooms");
    }
}
