/*
package hotel.servlets;

import hotel.dao.DAOHotel;
import hotel.dao.DAOHotels;
import hotel.entity.Hotel;
import hotel.util.PopularFacilitiesToEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editHotel")
public class EditHotel extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        DAOHotels daoHotel = new DAOHotels();
        Hotel hotel = daoHotel.get(Integer.parseInt(req.getParameter("id")));


        req.setAttribute("hotel",hotel);
        req.setAttribute("offers",hotel.getHotelsOffers().split(System.lineSeparator()));

        System.out.println(hotel.getRooms());
        req.getRequestDispatcher("/edit_hotel.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAOHotels daoHotel = new DAOHotels();

        if (req.getParameter("newName") != null &&
                !req.getParameter("newName").isEmpty()) {
            daoHotel.editName(req.getParameter("newName"));
            System.out.println("name");
        }


        if (req.getParameter("newStarRating") != null &&
                !req.getParameter("newStarRating").isEmpty()) {
            daoHotel.editRating(Integer.parseInt(req.getParameter("newStarRating")));
            System.out.println("newStarRating");
        }


        if (req.getParameter("newFullHotelsDescription") != null &&
                !req.getParameter("newFullHotelsDescription").isEmpty()) {
            daoHotel.editFullDescription(req.getParameter("newFullHotelsDescription"));
            System.out.println("newFullHotelsDescription");
        }

        doGet(req, resp);
    }
}
*/
