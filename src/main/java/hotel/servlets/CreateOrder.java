package hotel.servlets;

import hotel.dao.DAOOrder;
import hotel.entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/order")
public class CreateOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("view/create_order.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("id") != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            Order order = new Order();
            order.setStartDate(LocalDate.parse(req.getParameter("start_date"), formatter));
            order.setEndDate(LocalDate.parse(req.getParameter("end_date"), formatter));
            order.setIdRoom(Integer.parseInt(req.getParameter("id")));
            order.setIdClient(Integer.parseInt(req.getSession().getAttribute("id").toString()));
            DAOOrder daoOrder = new DAOOrder();
            if (!daoOrder.checkDate(order)) {
                daoOrder.add(order);
                resp.sendRedirect(req.getContextPath()+"/orders");
                return;
            } else {
                System.out.println("not");
            }
        }else {
            System.out.println("you cant do it");
        }

        doGet(req, resp);
    }
}
