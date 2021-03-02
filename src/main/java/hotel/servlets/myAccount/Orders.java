package hotel.servlets.myAccount;

import hotel.dao.DAOOrder;
import hotel.enums.Role;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/orders")
public class Orders extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String role = req.getSession().getAttribute("role").toString();



        if (role.equals(Role.CLIENT.toString())){
            int id = Integer.parseInt(req.getSession().getAttribute("id").toString());
            req.setAttribute("orders",DAOOrder.getOrderById(id));
        }else {
            req.setAttribute("orders",DAOOrder.getOrders());
        }

        req.getRequestDispatcher("view/myAccount/my_orders.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        if (req.getParameter("payForTheOrder")!=null){
            try {
                int idOrderForDeleting = Integer.parseInt(req.getParameter("payForTheOrder"));
                DAOOrder.payForTheOrder(idOrderForDeleting);
            }catch (ClassCastException e){
                System.err.println(e);
            }
            resp.sendRedirect(req.getContextPath()+"/orders");
            return;
        }


        if (req.getParameter("deleteOrder")!=null){
            try {
                int idOrderForDeleting = Integer.parseInt(req.getParameter("deleteOrder"));
                DAOOrder.deleteOrder(idOrderForDeleting);
            }catch (ClassCastException e){
                System.err.println(e);
            }
            resp.sendRedirect(req.getContextPath()+"/orders");
            return;
        }


        super.doPost(req, resp);
    }
}
