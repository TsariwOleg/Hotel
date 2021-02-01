package hotel.dao;

import hotel.entity.Hotel;
import hotel.entity.Room;
import hotel.util.ConnectionUtil;

import java.sql.*;
import java.util.List;

public class DAOHotels implements DAOImpl<Hotel> {

    private static String SELECT_HOTEL_BY_ID = "SELECT * FROM HOTELS WHERE ID=?";
    private static String UPDATE_NAME_OF_HOTEL = "UPDATE HOTELS SET NAME=? WHERE ID=1";
    private static String UPDATE_RATING_OF_HOTEL = "UPDATE HOTELS SET rating=? WHERE ID=1";


    @Override
    public Hotel get(int id) {
        Hotel hotel = new Hotel();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SELECT_HOTEL_BY_ID);
            preparedStatement.setInt(1, 1);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                hotel.setId(resultSet.getInt(1));
                hotel.setName(resultSet.getString(2));
                hotel.setRating(resultSet.getInt("rating"));
                hotel.setDescription(resultSet.getString("description"));
                hotel.setShortDescription(resultSet.getString("short_description"));
                hotel.setHotelsOffers(resultSet.getString("offer"));
                hotel.setRooms(getRoomsOfHotel(1));
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
            ConnectionUtil.closeResultSet(resultSet);
        }
        return hotel;
    }


    public List<Room> getRoomsOfHotel(int id) {
        return new DAORoom().getRoomsByHotelId(id);
    }


    public void editName(String name) {
        Connection connection = ConnectionUtil.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(UPDATE_NAME_OF_HOTEL);
            preparedStatement.setString(1, name);
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }

    public void editRating(int rating) {
        System.out.println(rating);
        Connection connection = ConnectionUtil.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(UPDATE_RATING_OF_HOTEL);
            preparedStatement.setInt(1, rating);
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }


}
