/*
package hotel.servlets;

import hotel.dao.DAOHotels;
import hotel.entity.Hotel;
import hotel.enums.PopularFacilities;
import hotel.util.ConnectionUtil;
import hotel.util.PopularFacilitiesToEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet("/addHotel")
public class AddHotel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ConnectionUtil.getConnection();
        DAOHotels daoHotels = new DAOHotels();



        req.getRequestDispatcher("/add_new_hotel.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Hotel hotel = new Hotel();
        hotel.setName(req.getParameter("name"));
        hotel.setRating(Integer.parseInt(req.getParameter("star_rating")));
        hotel.setDescription(req.getParameter("full_hotels_description"));
        hotel.setShortDescription(req.getParameter("short_hotels_description"));
        hotel.setHotelsOffers(req.getParameter("hotels_offer"));
        hotel.setPopularFacilitiesEntity(Arrays.asList(req.getParameterValues("case")));



        DAOHotels daoHotels = new DAOHotels();
        resp.sendRedirect(req.getContextPath()+"/myAccount/myBusiness");
    }
}
*/
