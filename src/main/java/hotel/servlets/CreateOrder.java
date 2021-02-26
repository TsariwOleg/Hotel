package hotel.servlets;

import hotel.dao.DAOOrder;
import hotel.dao.DAORoom;
import hotel.entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.regex.Pattern;

@WebServlet("/order")
public class CreateOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        hotel.entity.Room room = new DAORoom().get(Integer.parseInt(req.getParameter("id")));
        req.setAttribute("room",room);
        req.getRequestDispatcher("view/create_order.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       if(req.getParameter("create_order")!=null) {

           if (req.getParameter("start_date").isEmpty() || req.getParameter("start_date").isEmpty()) {
               System.out.println("emty");
               resp.sendRedirect(req.getRequestURL().toString() + "?" + req.getQueryString());
               return;
           }

           Pattern pattern = Pattern.compile("\\d{2}-\\d{2}-\\d{4}");
           String startDateReq = req.getParameter("start_date");
           String endDateReq = req.getParameter("end_date");

           if (!pattern.matcher(startDateReq).matches() || !pattern.matcher(endDateReq).matches()) {
               System.out.println("pattern");

               resp.sendRedirect(req.getRequestURL().toString() + "?" + req.getQueryString());
               return;
           }

           DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
           LocalDate startDate = LocalDate.parse(startDateReq, formatter);
           LocalDate endDate = LocalDate.parse(endDateReq, formatter);


           Order order = new Order();
           order.setDateOfCreating(LocalDate.now());
           order.setStartDate(startDate);
           order.setEndDate(endDate);
           order.setIdRoom(Integer.parseInt(req.getParameter("id")));
           order.setIdClient(Integer.parseInt(req.getSession().getAttribute("id").toString()));
           order.setNote(req.getParameter("note"));
           DAOOrder daoOrder = new DAOOrder();

           if (daoOrder.checkDate(order)) {
               System.out.println("zanyato");
               resp.sendRedirect(req.getContextPath() + "/rooms");
               return;
           }

           if (startDate.isEqual(endDate) ||
                   startDate.isBefore(LocalDate.now())) {
               System.out.println("form nen orm");
               resp.sendRedirect(req.getContextPath() + "/rooms");
               return;
           }


        daoOrder.add(order);
           resp.sendRedirect(req.getRequestURL().toString() + "?" + req.getQueryString());
           return;
       }
       doGet(req, resp);

    }
}
