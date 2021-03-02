package hotel.servlets.myAccount;

import hotel.dao.DAOUser;
import hotel.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/personalData")
public class PersonalData extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getSession().getAttribute("id").toString());

        User user = DAOUser.get(id);
        req.setAttribute("user",user);
        req.getRequestDispatcher("view/myAccount/personal_data.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        if (req.getParameter("name")!=null && req.getParameter("surname")!=null){
            int id = Integer.parseInt(req.getSession().getAttribute("id").toString());
            String name = req.getParameter("name");
            String surname = req.getParameter("surname");
            DAOUser.updateFullName(id,name,surname);
        }

        if (req.getParameter("email")!=null ){
            int id = Integer.parseInt(req.getSession().getAttribute("id").toString());
            String email = req.getParameter("email");
            DAOUser.updateEmail(id,email);
        }


        doGet(req, resp);
    }
}
