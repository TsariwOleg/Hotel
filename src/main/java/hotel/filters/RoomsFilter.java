package hotel.filters;

import hotel.dao.DAORoom;
import hotel.enums.ClassOfTheRoom;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.EOFException;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

@WebFilter(urlPatterns = {"/rooms"})
public class RoomsFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;



        if (req.getParameter("page") == null) {
            resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
            return;
        } else {
            try {
                int countOfRooms = 0;
                int page = Integer.parseInt(req.getParameter("page"));
                if (page < 0 || page > countOfRooms) {
                    throw new Exception();
                }
            } catch (Exception e) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }
        }


        if (req.getParameter("filteringByClass") != null) {
            List<String> list = new ArrayList();
            Arrays.stream(ClassOfTheRoom.values()).forEach(x -> list.add(x.name()));
            if (!list.contains(req.getParameter("filteringByClass")) || req.getParameter("filteringByClass").isEmpty()) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }
        }


        if (req.getParameter("filteringByPrice") != null) {
            if (req.getParameter("filteringByPrice").isEmpty()) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }

            try {
                int k = Integer.parseInt(req.getParameter("filteringByPrice"));
                if (k <= 0) {
                    throw new NumberFormatException();
                }
            } catch (NumberFormatException e) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }

        }


        if (req.getParameter("filteringByCountOfClient") != null) {
            if (req.getParameter("filteringByCountOfClient").isEmpty()) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }

            String[] numbers = req.getParameter("filteringByCountOfClient").split(",");
            try {
                for (String number : numbers) {
                    int k = Integer.parseInt(number);
                    if (k < 1 || k > 5) {
                        throw new NumberFormatException();
                    }
                }
            } catch (NumberFormatException e) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }

        }

        if ((req.getParameter("startDate") != null && req.getParameter("endDate") == null) &&
                (req.getParameter("startDate") == null && req.getParameter("endDate") != null)) {
            resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
            return;
        }


        if (req.getParameter("startDate") != null && req.getParameter("endDate") != null) {

            if (req.getParameter("startDate").isEmpty() || req.getParameter("endDate").isEmpty()) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }


            Pattern pattern = Pattern.compile("\\d{4}-\\d{2}-\\d{2}");
            String startDateReq = req.getParameter("startDate");
            String endDateReq = req.getParameter("endDate");

            if (!pattern.matcher(startDateReq).matches() || !pattern.matcher(endDateReq).matches()) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }


            LocalDate startDate = LocalDate.parse(req.getParameter("startDate"));
            LocalDate endDate = LocalDate.parse(req.getParameter("endDate"));

            if (startDate.isEqual(endDate) ||
                    startDate.isBefore(LocalDate.now())) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }

        }

        if (req.getParameter(("selectRoomFor"))!=null){
            Pattern pattern = Pattern.compile("^\\d+$");

            if (!pattern.matcher(req.getParameter("selectRoomFor")).matches()) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }
        }

        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {

    }
}
