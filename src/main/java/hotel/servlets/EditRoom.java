package hotel.servlets;

import hotel.dao.DAORoom;
import hotel.entity.Room;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editRoom")
public class EditRoom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Room room = new DAORoom().get(Integer.parseInt(req.getParameter("id")));
        req.setAttribute("room",room);
        req.getRequestDispatcher("/edit_room.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("class_button")!=null){
            System.out.println(req.getParameter("class"));
        }

        if (req.getParameter("room_number_button")!=null){
            System.out.println(req.getParameter("room_number"));
        }

        if (req.getParameter("count_of_client_button")!=null){
            System.out.println(req.getParameter("count_of_client"));
        }

        if (req.getParameter("description_button")!=null){
            System.out.println(req.getParameter("description"));
        }


        if (req.getParameter("additional_services_description_button")!=null){
            System.out.println(req.getParameter("additional_services_description"));
        }

        resp.sendRedirect(req.getContextPath()+"/editRoom?id="+req.getParameter("id"));

    }
}
