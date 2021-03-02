package hotel.servlets.myAccount;

import hotel.dao.DAOUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/securitySettings")
public class SecuritySettings extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if ("PasswordsDontMatch".equals(req.getParameter("error"))){

        }
        req.getRequestDispatcher("view/myAccount/security_settings.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        if (!req.getParameter("password").equals(req.getParameter("repeated_password"))){
            resp.sendRedirect(req.getContextPath()+"securitySettings?error=PasswordsDontMatch");
            return;
        }else {
            int id  = Integer.parseInt(req.getSession().getAttribute("id").toString());
            DAOUser.updatePassword(id,req.getParameter("password"));
        }

        System.out.println(req.getParameter("delete_account"));
        doGet(req, resp);
    }
}
