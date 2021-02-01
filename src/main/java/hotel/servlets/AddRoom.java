package hotel.servlets;

import hotel.dao.DAOHotels;
import hotel.dao.DAORoom;
import hotel.entity.Hotel;
import hotel.entity.Room;
import hotel.util.ConnectionUtil;
import hotel.util.PopularFacilitiesToEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

@WebServlet("/addRoom")
public class AddRoom extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAORoom daoRoom = new DAORoom();

        System.out.println(req.getParameter("id"));
        req.setAttribute("hotel_id", req.getParameter("id"));
        req.setAttribute("amenities_of_room", PopularFacilitiesToEntity.getListOfAmenitiesOfRoom());
        req.getRequestDispatcher("/view/add_new_room.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Room room = new Room();
        room.setClassOfRoom(req.getParameter("class_of_room"));
        room.setRoomNumber(Integer.parseInt(req.getParameter("No_of_room")));
        room.setPrice(Integer.parseInt(req.getParameter("price_per_night")));
        room.setCountOfClient(Integer.parseInt(req.getParameter("count_of_client")));
        room.setAreaOfRoom(Integer.parseInt(req.getParameter("area_of_room")));
        room.setDescription(req.getParameter("description"));

        room.setAmenitiesOfRoom(Arrays.asList(req.getParameterValues("case")));
        room.setAdditionalServices(req.getParameter("additional_services"));



        DAORoom daoRoom = new DAORoom();
        daoRoom.add(room);
        resp.sendRedirect(req.getContextPath()+"/rooms");
    }

}
