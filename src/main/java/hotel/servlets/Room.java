package hotel.servlets;

import hotel.dao.DAOHotels;
import hotel.dao.DAORoom;
import hotel.util.PopularFacilitiesToEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/room")
public class Room extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        hotel.entity.Room room = new DAORoom().get(Integer.parseInt(req.getParameter("id")));


        req.setAttribute("best_facilities",
                PopularFacilitiesToEntity.getListOfAmenitiesOfRoom(room.getAmenitiesOfRoom()));

        req.setAttribute("room",room);
        req.getRequestDispatcher("/view/room.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("comfortable_star"));
        System.out.println(req.getParameter("fortunes_star"));
        System.out.println(req.getParameter("soundproof_star"));
        System.out.println(req.getParameter("service_star"));


        doGet(req,resp);
    }
}
