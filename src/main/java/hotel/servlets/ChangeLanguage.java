package hotel.servlets;

import hotel.dao.DAOUser;
import hotel.entity.User;
import hotel.enums.Language;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;

@WebServlet("/changeLanguage")
public class ChangeLanguage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("lang") != null) {
            switch (req.getParameter("lang")) {
                case "ua":
                    req.getSession().setAttribute("language", Language.UA.name());
                    break;
                case "en":
                    req.getSession().setAttribute("language", Language.EN.name());
                    break;
                default:
                    req.getSession().setAttribute("language", Language.UA.name());
            }
        }

        if (req.getSession().getAttribute("id") != null) {
            User user = new User();
            user.setId(Integer.parseInt(req.getSession().getAttribute("id").toString()));
            user.setLanguage(Language.valueOf(req.getSession().getAttribute("language").toString()));
            DAOUser.changeLanguageOfUser(user);
        }
        resp.sendRedirect(req.getContextPath() + "/rooms");
    }
}
