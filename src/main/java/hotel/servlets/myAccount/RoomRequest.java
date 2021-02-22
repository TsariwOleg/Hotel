package hotel.servlets.myAccount;

import hotel.dao.DAOOrder;
import hotel.dao.DAORequest;
import hotel.entity.Order;
import hotel.entity.Request;
import hotel.enums.ClassOfTheRoom;
import hotel.enums.RequestStatus;
import hotel.enums.Role;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/roomRequest")
public class RoomRequest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAORequest daoRequest = new DAORequest();
        List<Request> requests;

        if (Role.MANAGER.toString().equals(req.getSession().getAttribute("role").toString())) {
            requests = daoRequest.getRequests();
        } else {
            requests = daoRequest.getRequestsByClientId(Integer.parseInt(req.getSession().getAttribute("id").toString()));
        }

        req.setAttribute("requests", requests);
        req.setAttribute("role", req.getSession().getAttribute("role").toString());
        req.getRequestDispatcher("view/myAccount/room_request.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Request request = new Request();
        DAORequest daoRequest = new DAORequest();


        if (req.getParameter("refuse_request")!=null){
            daoRequest.changeStatus(Integer.parseInt(req.getParameter("refuse_request")),RequestStatus.REFUSE.name());
            resp.sendRedirect(req.getContextPath() + "/roomRequest");
            return;
        }

        if (req.getParameter("ready_request")!=null){
            daoRequest.changeStatus(Integer.parseInt(req.getParameter("ready_request")),RequestStatus.READY.name());
            resp.sendRedirect(req.getContextPath() + "/roomRequest");
            return;
        }

        if (req.getParameter("select") != null) {
            int idRoom = Integer.parseInt(req.getParameter("select"));
            int idRequest = Integer.parseInt(req.getParameter("selectRoomFor"));
            daoRequest.addRoomToRequest(idRequest,idRoom);
            resp.sendRedirect(req.getContextPath()+"/roomRequest");
            return;
        }

        if (req.getParameter("delete_request") != null) {
            daoRequest.deleteRequestById(Integer.parseInt(req.getParameter("delete_request")));
        }


        if (req.getParameter("class_checkbox") != null || req.getParameter("edit_class") != null) {
            String requestClassOfTheRoom = req.getParameter("class_of_the_room");

            if (requestClassOfTheRoom != null && !requestClassOfTheRoom.isEmpty()) {
                request.setClassOfTheRoom(ClassOfTheRoom.valueOf(requestClassOfTheRoom));
            }
        }


        if (req.getParameter("price_checkbox") != null || req.getParameter("edit_price") != null) {
            String requestPrice = req.getParameter("price");
            if (requestPrice != null && !requestPrice.isEmpty()) {
                request.setPrice(Integer.parseInt(requestPrice));
            }
        }

        if (req.getParameter("date_checkbox") != null || req.getParameter("edit_date") != null) {
            String requestStartDate = !req.getParameter("start_date").isEmpty() ?
                    req.getParameter("start_date") : req.getParameter("start_edited_date");
            String requestEndDate = !req.getParameter("end_date").isEmpty() ?
                    req.getParameter("end_date") : req.getParameter("end_edited_date");

            if (!requestStartDate.isEmpty() && !requestEndDate.isEmpty()) {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                request.setStartDate(LocalDate.parse(requestStartDate, formatter));
                request.setEndDate(LocalDate.parse(requestEndDate, formatter));
            }
        }

        if (req.getParameter("clients_checkbox") != null || req.getParameter("edit_count_of_clients") != null) {
            if (req.getParameter("count_of_clients") != null) {
                request.setCountOfClient(Integer.parseInt(req.getParameter("count_of_clients")));
            }
        }

        if (req.getParameter("note_checkbox") != null || req.getParameter("edit_note") != null) {
            if (req.getParameter("note") != null && !req.getParameter("note").isEmpty()) {
                request.setNote(req.getParameter("note"));
            }
        }


        request.setIdUser(Integer.parseInt(req.getSession().getAttribute("id").toString()));

        if (req.getParameter("create_request") != null) {
            daoRequest.add(request);
            resp.sendRedirect(req.getContextPath() + "/roomRequest");
            return;
        }





        if (req.getParameter("edit_class") != null) {
            request.setId(Integer.parseInt(req.getParameter("edit_class")));
            daoRequest.updateClassOfTheRoom(request);
            resp.sendRedirect(req.getContextPath() + "/roomRequest");
            return;
        }

        if (req.getParameter("edit_price") != null) {
            request.setId(Integer.parseInt(req.getParameter("edit_price")));
            daoRequest.updatePrice(request);
            resp.sendRedirect(req.getContextPath() + "/roomRequest");
            return;
        }



        if (req.getParameter("edit_date") != null) {
            request.setId(Integer.parseInt(req.getParameter("edit_date")));
            daoRequest.updateDate(request);
            resp.sendRedirect(req.getContextPath() + "/roomRequest");
            return;
        }

        if (req.getParameter("edit_count_of_clients") != null) {
            request.setId(Integer.parseInt(req.getParameter("edit_count_of_clients")));
            daoRequest.updateCountOfClients(request);
            resp.sendRedirect(req.getContextPath() + "/roomRequest");
            return;
        }

        if (req.getParameter("edit_note") != null) {
            request.setId(Integer.parseInt(req.getParameter("edit_note")));
            daoRequest.updateNote(request);
            resp.sendRedirect(req.getContextPath() + "/roomRequest");
            return;
        }


        doGet(req, resp);
    }
}
