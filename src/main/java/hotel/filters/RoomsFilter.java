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

@WebFilter(urlPatterns = {"/*"})
public class RoomsFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    //http://localhost:8080/Hotel_war/rooms?page=0&filtering=1&filteringByClass=SUPERIOR&filteringByPrice=339&filteringByCountOfClient=3,4&startDate=2021-02-25&endDate=2021-02-27
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
                System.out.println(countOfRooms);
                int page = Integer.parseInt(req.getParameter("page"));
                if (page < 0 || page > countOfRooms) {
                    throw new Exception();
                }
            } catch (Exception e) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }
        }


        if (req.getParameter("filteringByClass") != null && !req.getParameter("filteringByClass").isEmpty()) {
            List<String> list = new ArrayList();
            Arrays.stream(ClassOfTheRoom.values()).forEach(x -> list.add(x.name()));
            if (!list.contains(req.getParameter("filteringByClass"))) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }
        }


        if (req.getParameter("filteringByPrice") != null && !req.getParameter("filteringByPrice").isEmpty()) {
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


        if (req.getParameter("filteringByCountOfClient") != null && !req.getParameter("filteringByCountOfClient").isEmpty()) {
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


        if (req.getParameter("start_date") != null && !req.getParameter("start_date").isEmpty()
                && req.getParameter("end_date") != null && !req.getParameter("end_date").isEmpty()) {
            Pattern pattern = Pattern.compile("\\d{2}-\\d{2}-\\d{4}");
            String startDateReq = req.getParameter("start_date");
            String endDateReq = req.getParameter("end_date");

            if (!pattern.matcher(startDateReq).matches() || !pattern.matcher(endDateReq).matches()) {
                resp.sendRedirect(req.getRequestURL().toString() + "?page=0");
                return;
            }

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            LocalDate startDate = LocalDate.parse(req.getParameter("start_date"), formatter);
            LocalDate endDate = LocalDate.parse(req.getParameter("end_date"), formatter);

            if (startDate.isEqual(endDate) ||
                    startDate.isBefore(LocalDate.now())) {
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
