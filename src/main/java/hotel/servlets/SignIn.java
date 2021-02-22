package hotel.servlets;

import hotel.dao.DAOUser;
import hotel.entity.User;
import hotel.enums.Role;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signIn")
public class SignIn extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if ("wrongLoginOrPassword".equals(req.getParameter("error"))){
            req.setAttribute("wrongLoginOrPassword",true);
        }

        req.getRequestDispatcher("/view/sign_in.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        DAOUser daoUser = new DAOUser();

        User user = daoUser.checkAccess(req.getParameter("email"), req.getParameter("password"));
        if (user != null) {
            System.out.println(user);
            req.getSession().setAttribute("id", user.getId());
            req.getSession().setAttribute("role",user.getRole().toString());
            resp.sendRedirect(req.getContextPath() + "/rooms");
            return;
        }

        resp.sendRedirect(req.getContextPath() + "/signIn?error=wrongLoginOrPassword");


    }
}
