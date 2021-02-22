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
        DAOOrder daoOrder = new DAOOrder();
        String role = req.getSession().getAttribute("role").toString();


        if (req.getParameter("deleteOrder")!=null){
            try {
                int idOrderForDeleting = Integer.parseInt(req.getParameter("deleteOrder"));
                daoOrder.deleteOrder(idOrderForDeleting);
            }catch (ClassCastException e){
                System.err.println(e);
            }
            resp.sendRedirect(req.getContextPath()+"/orders");
            return;
        }

        if (req.getParameter("payForTheOrder")!=null && !role.equals(Role.MANAGER.toString())){
            try {
                int idOrderForDeleting = Integer.parseInt(req.getParameter("payForTheOrder"));
                daoOrder.payForTheOrder(idOrderForDeleting);
            }catch (ClassCastException e){
                System.err.println(e);
            }
            resp.sendRedirect(req.getContextPath()+"/orders");
            return;
        }

        req.setAttribute("role",role);
        if (role.equals(Role.CLIENT.toString())){
            int id = Integer.parseInt(req.getSession().getAttribute("id").toString());
            req.setAttribute("orders",daoOrder.getOrderById(id));
        }else {
            req.setAttribute("orders",daoOrder.getOrders());
        }

        req.getRequestDispatcher("view/myAccount/my_orders.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getParameter("check"));
        System.out.println(req.getParameter("check sdf"));
        super.doPost(req, resp);
    }
}