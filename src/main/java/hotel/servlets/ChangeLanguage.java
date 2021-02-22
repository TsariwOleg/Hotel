package hotel.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/changeLanguage")
public class ChangeLanguage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("lang") != null) {
            switch (req.getParameter("lang")) {
               case  "ua":req.getSession().setAttribute("language", "ua"); break;
               case  "en":req.getSession().setAttribute("language", "en"); break;
                default:req.getSession().setAttribute("language", "ua");
            }
        }
        resp.sendRedirect(req.getContextPath()+"/rooms");
    }
}
