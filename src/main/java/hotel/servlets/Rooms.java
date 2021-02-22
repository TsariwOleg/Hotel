package hotel.servlets;

import hotel.dao.DAORoom;
import hotel.entity.Room;
import hotel.util.GetSubList;
import hotel.util.sorting.SortingRooms;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.core.Config;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/rooms")
public class Rooms extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.setAttribute("language",req.getSession().getAttribute("language"));




        DAORoom daoRoom = new DAORoom();
        List<Room> roomList = daoRoom.getAllRooms();


        //todo delete this construction
        if (req.getSession().getAttribute("id")!=null &&
                "CLIENT".equals(req.getSession().getAttribute("role"))){
            req.setAttribute("client",true);
        }

        if (req.getParameter("filtering") != null) {
            roomList = daoRoom.getFilteredRooms(req.getParameterMap());
        }

        req.setAttribute("role",req.getSession().getAttribute("role"));


        if (("priceAscending").equals(req.getParameter("sortedBy"))) {
            SortingRooms.getHotelsSortedByPriceAscending(roomList);
        }

        if (("priceDescending").equals(req.getParameter("sortedBy"))) {
            SortingRooms.getHotelsSortedByPriceDescending(roomList);
        }


        if (("countAscending").equals(req.getParameter("sortedBy"))) {
            SortingRooms.getHotelsSortedByCountOfClientAscending(roomList);
        }

        if (("countDescending").equals(req.getParameter("sortedBy"))) {
            SortingRooms.getHotelsSortedByCountOfClientDescending(roomList);
        }

        if (("classAscending").equals(req.getParameter("sortedBy"))) {
            SortingRooms.getHotelsSortedByCountOfClientAscending(roomList);
        }

        if (("classDescending").equals(req.getParameter("sortedBy"))) {
            SortingRooms.getHotelsSortedByCountOfClientDescending(roomList);
        }




        if (req.getParameter("selectRoomFor")!=null){
            req.setAttribute("id_client",req.getParameter("selectRoomFor"));
        }

        int page = Integer.parseInt(req.getParameter("page"));
        int roomListSize = (roomList.size())%5==0?roomList.size()/5-1:roomList.size()/5;

        System.out.println(roomListSize);
        req.setAttribute("room_list_size",roomListSize);

        req.setAttribute("page",page);
        req.setAttribute("rooms", GetSubList.getSublist(page,roomList));

        req.getRequestDispatcher("view/rooms.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String queryString = req.getQueryString() == null ? "" : req.getQueryString();
        queryString= queryString.replaceAll("&error=.+","");

        if (req.getParameter("filter_submit") != null) {

            StringBuilder filtering = new StringBuilder();
            filtering.append("?page=0");

            if (req.getParameter("selectRoomFor")!=null){
                filtering.append("selectRoomFor=").append(req.getParameter("selectRoomFor"));
            }

            filtering.append("&filtering=1&");
            if (req.getParameter("class_of_room")!= null && !req.getParameter("class_of_room").isEmpty()) {
                filtering.append("filteringByClass=").append(req.getParameter("class_of_room")).append("&");
            }

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

            //todo not empty
            if (req.getParameter("start_date") != null && !req.getParameter("start_date").isEmpty()
                    && req.getParameter("end_date") != null && !req.getParameter("end_date").isEmpty()) {
                Pattern pattern = Pattern.compile("\\d{2}-\\d{2}-\\d{4}");
                String startDateReq = req.getParameter("start_date");
                String endDateReq = req.getParameter("end_date");

                if(!pattern.matcher(startDateReq).matches() || !pattern.matcher(endDateReq).matches()){
                    String returnedURL = req.getRequestURL().toString()+"?"+queryString+"&error=FormatDateError";
                    resp.sendRedirect(returnedURL);
                    return;
                }


                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                LocalDate startDate = LocalDate.parse(req.getParameter("start_date"), formatter);
                LocalDate endDate = LocalDate.parse(req.getParameter("end_date"), formatter);

                if (startDate.isEqual(endDate) ||
                        startDate.isBefore(LocalDate.now())){
                    String returnedURL = req.getRequestURL().toString()+"?"+queryString+"&error=DateError";
                    resp.sendRedirect(returnedURL);
                    return;
                }

                filtering.append("startDate=").append(startDate).append("&");
                filtering.append("endDate=").append(endDate).append("&");
            }

            Pattern pattern = Pattern.compile("\\?page=\\d+.filtering=1.$");
            if (!pattern.matcher(filtering).matches()) {
                filtering.setLength(filtering.length() - 1);
                resp.sendRedirect(req.getContextPath() + "/rooms" + filtering);
            }else {
                resp.sendRedirect(req.getContextPath() + "/rooms?page="+req.getParameter("page"));
            }
            return;
        }


        {

            queryString = queryString.replaceAll("&sortedBy=priceAscending", "");
            queryString = queryString.replaceAll("&sortedBy=priceDescending", "");
            queryString = queryString.replaceAll("&sortedBy=countAscending", "");
            queryString = queryString.replaceAll("&sortedBy=countDescending", "");
            queryString = queryString.replaceAll("&sortedBy=classAscending", "");
            queryString = queryString.replaceAll("&sortedBy=classDescending", "");


            if (req.getParameter("sort_by_price_ascending") != null) {
                resp.sendRedirect(req.getRequestURL() + "?" + queryString + "&sortedBy=priceAscending");
                return;
            }

            if (req.getParameter("sort_by_price_descending") != null) {
                resp.sendRedirect(req.getRequestURL() + "?" + queryString + "&sortedBy=priceDescending");
                return;
            }


            if (req.getParameter("sort_by_count_of_clients_descending") != null) {
                resp.sendRedirect(req.getRequestURL() + "?" + queryString + "&sortedBy=countAscending");
                return;
            }

            if (req.getParameter("sort_by_count_of_clients_ascending") != null) {
                resp.sendRedirect(req.getRequestURL() + "?" + queryString + "&sortedBy=countDescending");
                return;
            }

            if (req.getParameter("sort_by_class_descending") != null) {
                resp.sendRedirect(req.getRequestURL() + "?" + queryString + "&sortedBy=classAscending");
                return;
            }

            if (req.getParameter("sort_by_class_ascending") != null) {
                resp.sendRedirect(req.getRequestURL() + "?" + queryString + "&sortedBy=classDescending");
                return;
            }
        }



        resp.sendRedirect(req.getContextPath() + "/rooms");
    }
}
