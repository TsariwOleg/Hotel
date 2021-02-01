package hotel.dao;

import hotel.entity.Room;
import hotel.util.ConnectionUtil;
import hotel.util.PopularFacilitiesToEntity;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class DAORoom implements DAOImpl<Room> {
    private String SQL_ADD_NEW_ROOM = "INSERT INTO ROOMS(class_of_room ,No_of_room,price,count_of_client,area_of_room," +
            "description,Additional_services,id_hotel ) VALUES (?,?,?,?,?,?,?,1)";
    String SQL_SELECT_ROOM_BY_ID = "SELECT * FROM ROOMS WHERE ID=?";

    String SQL_UPDATE_HOTELS_AMENITIES = "UPDATE room_Amenities_In_Room SET id_room=? WHERE id_room IS NULL";
    String addPopularFacilities = "INSERT INTO room_Amenities_In_Room(id_Amenities_In_Room) " +
            "SELECT ID FROM Amenities_In_Room WHERE Amenity IN (?);";
    String SQL_GET_AMENITIES_OF_ROOM = "SELECT * FROM Amenities_In_Room  WHERE id IN (SELECT id_Amenities_In_Room FROM room_Amenities_In_Room  WHERE id_room =?)";

    String SQL_GET_ALL_ROOMS_OF_HOTEL = "SELECT * FROM ROOMS a WHERE id IN (SELECT id_room FROM hotels_rooms  WHERE ID_HOTELS =?)";

    String SQL_SELECT_ALL_ROOMS = "SELECT * FROM ROOMS";

    String SQL_SELECT_FILTERED_ROOMS = "SELECT * FROM ROOMS WHERE ";


    public void add(Room room) {
        Connection connection = ConnectionUtil.getConnection();
        PreparedStatement preparedStatement =null;
        try {
            preparedStatement=connection.prepareStatement(SQL_ADD_NEW_ROOM);
            preparedStatement.setString(1, room.getClassOfRoom());
            preparedStatement.setInt(2, room.getRoomNumber());
            preparedStatement.setInt(3, room.getPrice());
            preparedStatement.setInt(4, room.getCountOfClient());
            preparedStatement.setInt(5, room.getAreaOfRoom());
            preparedStatement.setString(6, room.getDescription());
            preparedStatement.setString(7, room.getAdditionalServices());
            preparedStatement.execute();

            int last_inserted_id = 0;
            ResultSet rs = preparedStatement.getGeneratedKeys();
            if (rs.next()) {
                last_inserted_id = rs.getInt(1);
            }

            addAmenitiesOfRoom(last_inserted_id, room.getAmenitiesOfRoom());
        } catch (SQLException e) {
            System.err.println(e);
        }finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }



    public void addAmenitiesOfRoom(int id, List<String> amenitiesOfRoom) {
        StringBuilder stringBuilder = new StringBuilder();
        for (String pop : amenitiesOfRoom) {
            stringBuilder.append("'").append(pop).append("'").append(",");
        }
        stringBuilder.setLength(stringBuilder.length() - 1);
        Connection connection = ConnectionUtil.getConnection();

        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(addPopularFacilities.replace("?", stringBuilder.toString()));
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

        try {
            preparedStatement =
                    connection.prepareStatement(SQL_UPDATE_HOTELS_AMENITIES);
            preparedStatement.setInt(1, id);
            preparedStatement.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }


    @Override
    public Room get(int id) {
        Room room = new Room();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_ROOM_BY_ID);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                //todo set name of column
                room.setId(resultSet.getInt("id"));
                //todo rename name to class in db
                room.setClassOfRoom(resultSet.getString("class_of_room"));
                room.setPrice(resultSet.getInt("price"));
                room.setRoomNumber(resultSet.getInt("No_of_room"));
                room.setCountOfClient(resultSet.getInt("count_of_client"));
                room.setAreaOfRoom(resultSet.getInt("area_of_room"));
                room.setDescription(resultSet.getString("description"));
                room.setAdditionalServices(resultSet.getString("Additional_services"));
                room.setAmenitiesOfRoom(getAmenitiesOfRoom(id));
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
            ConnectionUtil.closeResultSet(resultSet);
        }
        return room;
    }

    private List<String> getAmenitiesOfRoom(int id) {
        Connection connection = ConnectionUtil.getConnection();
        List<String> listOfRoomsAmenities = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SQL_GET_AMENITIES_OF_ROOM);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                listOfRoomsAmenities.add(resultSet.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
        return listOfRoomsAmenities;
    }

    public List<Room> getRoomsByHotelId(int hotelId) {
        List<Room> roomList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_GET_ALL_ROOMS_OF_HOTEL);
            preparedStatement.setInt(1, hotelId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Room room = new Room();
                room.setId(resultSet.getInt("id"));
                room.setPrice(resultSet.getInt("price"));
                room.setCountOfClient(resultSet.getInt("count_of_client"));
                room.setDescription(resultSet.getString("description"));
                //todo set id_room
                room.setFacilitiesEntities(PopularFacilitiesToEntity.getListOfAmenitiesOfRoom(getAmenitiesOfRoom(room.getId())));
                roomList.add(room);
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
            ConnectionUtil.closeResultSet(resultSet);
        }
        return roomList;
    }

    public List<Room> getAllRooms() {
        List<Room> roomList = new ArrayList<>();
        setRoom(roomList, SQL_SELECT_ALL_ROOMS);
        return roomList;
    }

    public List<Room> getFilteredRooms(Map<String, String[]> map) {
        StringBuilder stringBuilder = new StringBuilder(SQL_SELECT_FILTERED_ROOMS);

        if (map.get("filteringByPrice") != null) {
            stringBuilder.append(" price<").append(map.get("filteringByPrice")[0]).append(" AND");
        }

        if (map.get("filteringByCountOfClient") != null) {
            stringBuilder.append(" count_of_client IN(").append(map.get("filteringByCountOfClient")[0]).append(") AND");
        }

        stringBuilder.setLength(stringBuilder.length() - ("AND").length());
        List<Room> roomList = new ArrayList<>();
        setRoom(roomList, stringBuilder.toString());
        return roomList;
    }

    private void setRoom(List<Room> roomList, String query) {
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = ConnectionUtil.getConnection().createStatement();
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Room room = new Room();
                room.setId(resultSet.getInt("id"));
                //todo rename name to class in db
                room.setClassOfRoom(resultSet.getString("class_of_room"));
                room.setPrice(resultSet.getInt("price"));
                room.setCountOfClient(resultSet.getInt("count_of_client"));
                room.setAreaOfRoom(resultSet.getInt("area_of_room"));
                room.setDescription(resultSet.getString("description"));
                room.setAdditionalServices(resultSet.getString("Additional_services"));
                roomList.add(room);
            }

        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeStatement(statement);
            ConnectionUtil.closeResultSet(resultSet);
        }

    }

}
