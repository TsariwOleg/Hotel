package hotel.servlets;

import hotel.dao.DAOReview;
import hotel.dao.DAORoom;
import hotel.entity.Request;
import hotel.entity.Review;
import hotel.entity.User;
import hotel.enums.ClassOfTheRoom;
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
        resp.setCharacterEncoding("UTF-8");
        hotel.entity.Room room = new DAORoom().get(Integer.parseInt(req.getParameter("id")));
        List<Review> reviews = new DAOReview().getReviewsByRoomId(room.getId());
        req.setAttribute("is_registered_user", req.getSession().getAttribute("id") == null);

        //todo delete this construction
        if (req.getSession().getAttribute("id") != null &&
                "CLIENT".equals(req.getSession().getAttribute("role"))) {
            req.setAttribute("client", true);
        }

        req.setAttribute("best_facilities",
                PopularFacilitiesToEntity.getListOfAmenitiesOfRoom(room.getAmenitiesOfRoom()));



        req.setAttribute("room", room);
        req.setAttribute("reviews", reviews);
        req.getRequestDispatcher("/view/room.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("role") != null && req.getParameter("create_review") != null) {
            DAOReview daoReview = new DAOReview();


            Review review = new Review();
            review.setRoomId(Integer.parseInt(req.getParameter("id")));
            review.setReview(req.getParameter("comment"));
            User user = new User();
            user.setId(Integer.parseInt(req.getSession().getAttribute("id").toString()));
            review.setUser(user);

            int comfortable = req.getParameter("comfortable_star") != null ? Integer.parseInt(req.getParameter("comfortable_star")) : 0;
            int fortunes = req.getParameter("fortunes_star") != null ? Integer.parseInt(req.getParameter("fortunes_star")) : 0;
            int soundproof = req.getParameter("soundproof_star") != null ? Integer.parseInt(req.getParameter("soundproof_star")) : 0;
            int service = req.getParameter("service_star") != null ? Integer.parseInt(req.getParameter("service_star")) : 0;


            review.setCategoryReviews(comfortable, fortunes, soundproof, service);

            daoReview.addReview(review);
        } else {
            System.out.println("no");
        }

        if (req.getParameter("edit") != null) {
            DAORoom daoRoom = new DAORoom();
            hotel.entity.Room room = new hotel.entity.Room();
            room.setId(Integer.parseInt(req.getParameter("id")));

            if (req.getParameter("edit_class_of_room") != null) {
                room.setClassOfTheRoom(ClassOfTheRoom.valueOf(req.getParameter("edit_class_of_room")));
                daoRoom.updateClassOfTheRoom(room);
            }

            if (req.getParameter("price") != null && !req.getParameter("price").isEmpty()) {
                room.setRoomNumber(Integer.parseInt(req.getParameter("room_number")));
                daoRoom.updatePrice(room);
            }

            if (req.getParameter("room_number") != null && !req.getParameter("room_number").isEmpty()) {
                room.setRoomNumber(Integer.parseInt(req.getParameter("room_number")));
                daoRoom.updateRoomNumber(room);
            }

            if (req.getParameter("count_of_client") != null ) {
                room.setCountOfClient(Integer.parseInt(req.getParameter("count_of_client")));
                daoRoom.updateCountOfClient(room);
            }

            if (req.getParameter("description") != null && !req.getParameter("description").isEmpty()) {
                room.setDescription(req.getParameter("description"));
                daoRoom.updateDescription(room);
            }


            if (req.getParameter("additional_services") != null && !req.getParameter("additional_services").isEmpty()) {
                room.setDescription(req.getParameter("additional_services"));
                daoRoom.updateAdditionalService(room);
            }

            if (req.getParameterValues("case")!=null){
                room.setAmenitiesOfRoom(Arrays.asList(req.getParameterValues("case")));
                daoRoom.updateAmenitiesOfRoom(room);
            }


        }


        resp.sendRedirect(req.getContextPath()+"/room?id="+req.getParameter("id"));
    }
}
