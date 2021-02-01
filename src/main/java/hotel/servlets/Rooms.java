package hotel.servlets;

import hotel.dao.DAOHotels;
import hotel.dao.DAORoom;
import hotel.entity.Hotel;
import hotel.entity.Room;
import hotel.util.sorting.SortingRooms;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/rooms")
public class Rooms extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAORoom daoRoom = new DAORoom();
        List<Room> roomList = daoRoom.getAllRooms();


        if (req.getParameter("filtering") != null) {
            System.out.println(Arrays.toString(req.getParameterMap().get("filteringByPrice")));
            roomList = daoRoom.getFilteredRooms(req.getParameterMap());
        }


        if (("price").equals(req.getParameter("sortedBy"))) {
            SortingRooms.getHotelsSortedByPrice(roomList);
        }

        if (("priceRev").equals(req.getParameter("sortedBy"))) {
            SortingRooms.getHotelsSortedByPriceReve(roomList);
        }

        if (("countOf").equals(req.getParameter("sortedBy"))) {
            SortingRooms.getHotelsSortedByCountOfClient(roomList);
        }


        req.setAttribute("rooms", roomList);

        req.getRequestDispatcher("view/rooms.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getParameter("filter_submit") != null) {
            StringBuilder filtering = new StringBuilder("?filtering=1&");
            if (req.getParameter("price") != null && !req.getParameter("price").isEmpty()) {
                filtering.append("filteringByPrice=").append(req.getParameter("price")).append("&");
            }

            if (req.getParameter("count_of_clients") != null && !req.getParameter("count_of_clients").isEmpty()) {
                filtering.append("filteringByCountOfClient=");
                for (String value : req.getParameterValues("count_of_clients")) {
                    filtering.append(value).append(",");
                }
                filtering.setLength(filtering.length() - 1);
                filtering.append("&");
            }

            if (!filtering.toString().equals("?filtering=1&")) {
                filtering.setLength(filtering.length() - 1);
                resp.sendRedirect(req.getContextPath() + "/rooms" + filtering);
                return;
            }
        }

        String queryString=req.getQueryString()==null? "": req.getQueryString();
        queryString=queryString.replaceAll("&sortedBy=priceRev","");
        queryString=queryString.replaceAll("&sortedBy=price","");
        queryString=queryString.replaceAll("&sortedBy=countOf","");

        if (req.getParameter("sorted_by_price")!=null){
            resp.sendRedirect(req.getRequestURL()+"?"+queryString+"&sortedBy=price");
            return;
        }

        if (req.getParameter("sorted_by_price_reverse")!=null){
            resp.sendRedirect(req.getRequestURL()+"?"+queryString+"&sortedBy=priceRev");
            return;
        }

        if (req.getParameter("sorted_by_count_of_clients")!=null){
            resp.sendRedirect(req.getRequestURL()+"?"+queryString+"&sortedBy=countOf");
            return;
        }
        resp.sendRedirect(req.getContextPath() + "/rooms");
    }
}
