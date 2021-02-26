package hotel.dao;

import hotel.entity.Order;
import hotel.entity.Room;
import hotel.entity.User;
import hotel.enums.ClassOfTheRoom;
import hotel.util.ConnectionUtil;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class DAOOrder {
    private static String SQL_INSERT_INTO_ORDERS = "insert into Orders(id_client,id_room,date_Of_Creating,DateOccupied,DateВeparture,Notes) values(?,?,?,?,?,?)";
    private static String SQL_INSERT_INTO_ROOMS_ORDERS = "insert into ROOMS_orders values(?,?)";

    private static String SQL_SELECT_ORDERS_BY_CLIENT_ID =
            "SELECT * FROM ORDERS o INNER JOIN ROOMS r ON o.ID_ROOM =r.ID WHERE o.ID_CLIENT =?";


    private static String SQL_SELECT_ORDERS =
            "SELECT * FROM ORDERS o INNER JOIN ROOMS r ON o.ID_ROOM =r.ID INNER JOIN CLIENTS c2 ON o.ID_CLIENT = c2.ID ";

    private static String SQL_SELECT_ORDERS_RANGE = "SELECT * FROM ORDERS o WHERE ( DATEOCCUPIED<? AND ?<=DATEВEPARTURE ) AND " +
            " ID_ROOM=?";


    private static String SQL_DELETE_ORDER_BY_ID = "DELETE FROM ORDERS WHERE ID=?";

    private static String SQL_UPDATE_ORDER_BY_ID = "UPDATE ORDERS SET STATUS='true' where ID=?";

    private static String SQL_DELETE_OLD_ORDER = "DELETE FROM ORDERS WHERE date_Of_Creating<?";


    public void add(Order order) {
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_INTO_ORDERS);
            preparedStatement.setInt(1, order.getIdClient());
            preparedStatement.setInt(2, order.getIdRoom());
            preparedStatement.setDate(3, Date.valueOf(order.getDateOfCreating()));
            preparedStatement.setDate(4, Date.valueOf(order.getStartDate()));
            preparedStatement.setDate(5, Date.valueOf(order.getEndDate()));
            preparedStatement.setString(6, order.getNote());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }


    public void deleteOrder(int id) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_DELETE_ORDER_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }

    public void payForTheOrder(int id) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_ORDER_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }

    public void addRoomOrder(int idRoom, int idOrder) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_INTO_ROOMS_ORDERS);
            preparedStatement.setInt(1, idRoom);
            preparedStatement.setInt(2, idOrder);
            preparedStatement.execute();

        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }


    public List<Order> getOrderById(int idClient) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Order> orderList = new ArrayList<>();
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_ORDERS_BY_CLIENT_ID);
            preparedStatement.setInt(1, idClient);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Room room = new Room();
                room.setId(resultSet.getInt("ID_ROOM"));
                room.setPrice(resultSet.getInt("PRICE"));
                room.setClassOfTheRoom(ClassOfTheRoom.valueOf(resultSet.getString("CLASS_OF_ROOM")));
                Order order = new Order();
                order.setId(resultSet.getInt(1));
                order.setDateOfCreating(resultSet.getDate("date_Of_Creating").toLocalDate());
                order.setStartDate(resultSet.getDate("DateOccupied").toLocalDate());
                order.setEndDate(resultSet.getDate("DATEВEPARTURE").toLocalDate());
                order.setNote(resultSet.getString("Notes"));
                order.setStatus(resultSet.getBoolean("status") + "");
                order.setRoom(room);
                orderList.add(order);
            }

        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
        return orderList;
    }


    public boolean checkDate(Order order) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_ORDERS_RANGE);
            preparedStatement.setDate(1, Date.valueOf(order.getEndDate()));
            preparedStatement.setDate(2, Date.valueOf(order.getStartDate()));
            preparedStatement.setInt(3, order.getIdRoom());
            resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

        return false;
    }


    public List<Order> getOrders() {
        Statement statement = null;
        ResultSet resultSet = null;
        List<Order> orderList = new ArrayList<>();
        try {
            statement = ConnectionUtil.getConnection().createStatement();
            resultSet = statement.executeQuery(SQL_SELECT_ORDERS);
            while (resultSet.next()) {
                Room room = new Room();
                room.setId(resultSet.getInt("ID_ROOM"));
                room.setPrice(resultSet.getInt("PRICE"));
                room.setClassOfTheRoom(ClassOfTheRoom.valueOf(resultSet.getString("CLASS_OF_ROOM")));
                Order order = new Order();
                order.setId(resultSet.getInt(1));
                order.setDateOfCreating(resultSet.getDate("date_Of_Creating").toLocalDate());
                order.setStartDate(resultSet.getDate("DateOccupied").toLocalDate());
                order.setEndDate(resultSet.getDate("DATEВEPARTURE").toLocalDate());
                order.setNote(resultSet.getString("Notes"));
                order.setStatus(resultSet.getBoolean("status") + "");
                order.setRoom(room);

                User user = new User();
                user.setName(resultSet.getString("name"));
                user.setSurname(resultSet.getString("surname"));

                order.setUser(user);


                orderList.add(order);
            }

        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closeStatement(statement);
        }
        return orderList;
    }


    public void deleteOldOrders(LocalDate localDate) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_DELETE_OLD_ORDER);
            preparedStatement.setDate(1, Date.valueOf(localDate));
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }
}
