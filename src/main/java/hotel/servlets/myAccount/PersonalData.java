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
        DAOUser daoUser = new DAOUser();

        int id = Integer.parseInt(req.getSession().getAttribute("id").toString());

        User user = daoUser.get(id);
        req.setAttribute("user",user);
        req.getRequestDispatcher("view/myAccount/personal_data.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAOUser daoUser = new DAOUser();
        req.setCharacterEncoding("UTF-8");
        if (req.getParameter("name")!=null && req.getParameter("surname")!=null){
            int id = Integer.parseInt(req.getSession().getAttribute("id").toString());
            String name = req.getParameter("name");
            String surname = req.getParameter("surname");
            daoUser.updateFullName(id,name,surname);
        }

        if (req.getParameter("email")!=null ){
            int id = Integer.parseInt(req.getSession().getAttribute("id").toString());
            String email = req.getParameter("email");
            daoUser.updateEmail(id,email);
        }

        System.out.println(req.getParameter("name"));
        System.out.println(req.getParameter("surname"));
        System.out.println("----");
        System.out.println(req.getParameter("email"));

        doGet(req, resp);
    }
}
