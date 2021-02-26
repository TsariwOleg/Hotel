package hotel.dao;

import hotel.entity.Review;
import hotel.entity.Room;
import hotel.enums.ClassOfTheRoom;
import hotel.util.BlobToString;
import hotel.util.ConnectionUtil;
import hotel.util.PopularFacilitiesToEntity;

import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public class DAORoom implements DAOImpl<Room> {
    private String SQL_ADD_NEW_ROOM = "INSERT INTO ROOMS(class_of_room ,No_of_room,price,count_of_client,area_of_room," +
            "description,Additional_services ) VALUES (?,?,?,?,?,?,?)";

    String SQL_SELECT_ROOM_BY_ID = "SELECT * FROM ROOMS WHERE ID=?";

    private String SQL_SELECT_COUNT_OF_ROOMS = "SELECT COUNT(*) FROM ROOMS";

    String SQL_UPDATE_HOTELS_AMENITIES = "UPDATE room_Amenities_In_Room SET id_room=? WHERE id_room IS NULL";
    String addPopularFacilities = "INSERT INTO room_Amenities_In_Room(id_Amenities_In_Room) " +
            "SELECT ID FROM Amenities_In_Room WHERE Amenity IN (?);";

    String SQL_GET_AMENITIES_OF_ROOM = "SELECT * FROM Amenities_In_Room  WHERE id IN (SELECT id_Amenities_In_Room FROM room_Amenities_In_Room  WHERE id_room =?)";


    /*String SQL_SELECT_ALL_ROOMS = "SELECT " +
            "  avg(COMFORTABLE) AS comfortable ," +
            "  avg(FORTUNES) AS FORTUNES ," +
            "  avg(SOUNDPROOF) AS SOUNDPROOF ," +
            "    avg(SERVICE) AS SERVICE , "+
            "rooms.id ,rooms.CLASS_OF_ROOM, rooms.price ,rooms.DESCRIPTION, rooms.AREA_OF_ROOM , rooms.COUNT_OF_CLIENT  , " +
            "   FROM rooms left JOIN REVIEWS r ON rooms.ID = r.ID_ROOM " +
            "      LEFT JOIN CATEGORY_REVIEWS cr ON r.ID_RATTING =cr.ID " +
            "     GROUP BY ID ";*/

    String SQL_SELECT_ALL_ROOMS = "SELECT * FROM ROOMS r left JOIN rooms_Photo_OF_ROOMS rp ON rp.ID_ROOMS = r.id " +
            "left JOIN Photo_OF_ROOMS p ON rp.ID_PHOTO_OF_ROOMS = p.id WHERE ISMAINPHOTO = true";

    String SQL_SELECT_FILTERED_ORDERS = "SELECT id FROM ROOMS WHERE ID NOT in(SELECT ID_ROOM FROM ORDERS WHERE  (DATEOCCUPIED<? AND ?<=DATEВEPARTURE ))";

    String SQL_SELECT_ROOMS_REQUESTS = "SELECT * FROM rooms r left JOIN rooms_Photo_OF_ROOMS rp ON rp.ID_ROOMS = r.id " +
            "left JOIN Photo_OF_ROOMS p ON rp.ID_PHOTO_OF_ROOMS = p.id " +
            "INNER JOIN REQUESTS_ROOMS rr ON r.ID = rr.ID_ROOM WHERE rr.ID_REQUEST =? AND ISMAINPHOTO = true";


    private static String SQL_SELECT_PHOTOS_BY_ROOM_ID = "SELECT * FROM  rooms_Photo_OF_ROOMS rp" +
            " left JOIN Photo_OF_ROOMS p ON rp.ID_PHOTO_OF_ROOMS = p.id  WHERE rp.ID_ROOMS =? AND isMainPhoto=false ";


    private static String SQL_SELECT_MAIN_PHOTO_BY_ROOM_ID = "SELECT * FROM  rooms_Photo_OF_ROOMS rp" +
            " left JOIN Photo_OF_ROOMS p ON rp.ID_PHOTO_OF_ROOMS = p.id  WHERE rp.ID_ROOMS =? AND isMainPhoto=true ";

    private static String SQL_DELETE_AMENITIES_OF_ROOM = "DELETE FROM room_Amenities_In_Room WHERE id_room=?";

    private static String SQL_UPDATE_ROOM_CLASS_OF_THE_ROOM = "UPDATE ROOMS SET class_of_room=? WHERE ID=?";
    private static String SQL_UPDATE_ROOM_ROOM_NUMBER = "UPDATE ROOMS SET No_of_room=? WHERE ID=?";
    private static String SQL_UPDATE_ROOM_PRICE = "UPDATE ROOMS SET price=? WHERE ID=?";
    private static String SQL_UPDATE_ROOM_COUNT_OF_CLIENTS = "UPDATE ROOMS SET count_of_client=? WHERE ID=?";
    private static String SQL_UPDATE_ROOM_DESCRIPTION = "UPDATE ROOMS SET description=? WHERE ID=?";
    private static String SQL_UPDATE_ROOM_ADDITIONAL_SERVICE = "UPDATE ROOMS SET Additional_services=? WHERE ID=?";


    private static String SQL_INSERT_PHOTO = "INSERT INTO Photo_OF_ROOMS(photo,isMainPhoto) VALUES (?,?)";
    private static String SQL_INSERT_ROOM_PHOTO = "INSERT INTO rooms_Photo_OF_ROOMS VALUES (?,?)";

    public List<Room> getRoomsRequest(int id) {
        List<Room> rooms = new ArrayList<>();
        setRoom(rooms, SQL_SELECT_ROOMS_REQUESTS.replaceAll("\\?", String.valueOf(id)));
        return rooms;
    }

    public int getCountOfRooms() {
        int countOfRooms = 0;
        Connection connection = ConnectionUtil.getConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(SQL_SELECT_COUNT_OF_ROOMS);
            countOfRooms = resultSet.getInt(1);

        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closeStatement(statement);
        }
        return countOfRooms;
    }


    public void add(Room room) {
        Connection connection = ConnectionUtil.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SQL_ADD_NEW_ROOM);
            preparedStatement.setString(1, room.getClassOfTheRoom().name());
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


            List<Part> photos = room.getPhotos();
            addAmenitiesOfRoom(last_inserted_id, room.getAmenitiesOfRoom());
            addPhoto(last_inserted_id, photos.get(0), true);
            addPhotos(last_inserted_id, photos.subList(1, photos.size()));
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }


    public void updateAmenitiesOfRoom(Room room) {
        PreparedStatement preparedStatement = null;
        try {
            //todo transaction
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_DELETE_AMENITIES_OF_ROOM);
            preparedStatement.setInt(1, room.getId());
            preparedStatement.execute();

            addAmenitiesOfRoom(room.getId(), room.getAmenitiesOfRoom());

        } catch (SQLException e) {
            System.err.println(e);
        } finally {
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
        } finally {
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
                room.setId(resultSet.getInt("id"));
                room.setClassOfTheRoom(ClassOfTheRoom.valueOf(resultSet.getString("class_of_room")));
                room.setPrice(resultSet.getInt("price"));
                room.setRoomNumber(resultSet.getInt("No_of_room"));
                room.setCountOfClient(resultSet.getInt("count_of_client"));
                room.setAreaOfRoom(resultSet.getInt("area_of_room"));
                room.setDescription(resultSet.getString("description"));
                room.setAdditionalServices(resultSet.getString("Additional_services"));
                room.setTotalPoint(new DAOReview().getTotalPoint(room.getId()));
                room.setAmenitiesOfRoom(getAmenitiesOfRoom(id));

                room.setStrMainPhoto(getMainPhoto(room.getId()));
                room.setStrPhotos(getPhotos(room.getId()));
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
            ConnectionUtil.closeResultSet(resultSet);
        }
        return room;
    }


    private String getMainPhoto(int idRoom) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String photo = "";
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_MAIN_PHOTO_BY_ROOM_ID);
            preparedStatement.setInt(1, idRoom);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                photo=BlobToString.getStringFromBlob(resultSet.getBlob("photo"));
            }

        } catch (SQLException e) {

        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

        return photo;
    }


    private List<String> getPhotos(int idRoom) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<String> photos = new ArrayList<>();
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_PHOTOS_BY_ROOM_ID);
            preparedStatement.setInt(1, idRoom);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                photos.add(BlobToString.getStringFromBlob(resultSet.getBlob("photo")));
            }

        } catch (SQLException e) {

        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

        return photos;
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


    public List<Room> getAllRooms() {
        List<Room> roomList = new ArrayList<>();
        setRoom(roomList, SQL_SELECT_ALL_ROOMS);
        return roomList;
    }

    public List<Room> getFilteredRooms(Map<String, String[]> map) {
        StringBuilder stringBuilder = new StringBuilder(SQL_SELECT_ALL_ROOMS + " AND");

        if (map.get("filteringByClass") != null) {
            stringBuilder.append(" class_of_room='").append(map.get("filteringByClass")[0]).append("' AND");
        }

        if (map.get("filteringByPrice") != null) {
            stringBuilder.append(" price<").append(map.get("filteringByPrice")[0]).append(" AND");
        }

        if (map.get("filteringByCountOfClient") != null) {
            stringBuilder.append(" count_of_client IN(").append(map.get("filteringByCountOfClient")[0]).append(") AND");
        }

        if (map.get("startDate") != null && map.get("endDate") != null) {
            //todo rename
            String sql = " r.ID IN (var)";
            sql = sql.replaceAll("var", getAllIdRooms(map.get("startDate")[0], map.get("endDate")[0]));

            stringBuilder.append(sql).append(" AND");
        }

        stringBuilder.setLength(stringBuilder.length() - ("AND").length());
        List<Room> roomList = new ArrayList<>();
        setRoom(roomList, stringBuilder.toString());
        return roomList;
    }


    private String getAllIdRooms(String startDate, String endDate) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        StringBuilder stringBuilder = new StringBuilder();
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_FILTERED_ORDERS);
            preparedStatement.setDate(1, Date.valueOf(endDate));
            preparedStatement.setDate(2, Date.valueOf(startDate));
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                stringBuilder.append(resultSet.getInt(1)).append(",");
            }

            if (stringBuilder.length() != 0) {
                stringBuilder.setLength(stringBuilder.length() - 1);
            }

        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

        return stringBuilder.toString();
    }

    private void setRoom(List<Room> roomList, String query) {
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = ConnectionUtil.getConnection().createStatement();
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Room room = new Room();
                room.setId(resultSet.getInt(1));
                //todo rename name to class in db
                room.setClassOfTheRoom(ClassOfTheRoom.valueOf(resultSet.getString("class_of_room")));
                room.setPrice(resultSet.getInt("price"));
                room.setCountOfClient(resultSet.getInt("count_of_client"));
                room.setAreaOfRoom(resultSet.getInt("area_of_room"));
                room.setDescription(resultSet.getString("description"));
                room.setTotalPoint(new DAOReview().getTotalPoint(room.getId()));
                if (resultSet.getBlob("photo") != null) {
                    room.setStrMainPhoto(BlobToString.getStringFromBlob(resultSet.getBlob("photo")));
                }
                roomList.add(room);
            }

        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeStatement(statement);
            ConnectionUtil.closeResultSet(resultSet);
        }
    }

//    private void setCategoryReview(int id,Room room) {
//        PreparedStatement preparedStatement = null;
//        ResultSet resultSet = null;
//        try {
//            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL);
//            preparedStatement.setInt(1,id);
//            resultSet = preparedStatement.executeQuery();
//            Review.CategoryReviews categoryReviews = new Review.CategoryReviews(
//                    resultSet.getInt("COMFORTABLE"),
//                    resultSet.getInt("FORTUNES"),
//                    resultSet.getInt("SOUNDPROOF"),
//                    resultSet.getInt("SOUNDPROOF"));
//            room.setRoomReview(categoryReviews);
//        } catch (SQLException e) {
//            System.err.println(e);
//        }finally {
//            ConnectionUtil.closeResultSet(resultSet);
//            ConnectionUtil.closePreparedStatement(preparedStatement);
//        }
//    }


    public void updateClassOfTheRoom(Room room) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_ROOM_CLASS_OF_THE_ROOM);
            preparedStatement.setString(1, room.getClassOfTheRoom().name());
            preparedStatement.setInt(2, room.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }


    public void updatePrice(Room room) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_ROOM_PRICE);
            preparedStatement.setInt(1, room.getPrice());
            preparedStatement.setInt(2, room.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }

    public void updateRoomNumber(Room room) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_ROOM_ROOM_NUMBER);
            preparedStatement.setInt(1, room.getRoomNumber());
            preparedStatement.setInt(2, room.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }

    public void updateCountOfClient(Room room) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_ROOM_COUNT_OF_CLIENTS);
            preparedStatement.setInt(1, room.getCountOfClient());
            preparedStatement.setInt(2, room.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }

    public void updateDescription(Room room) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_ROOM_DESCRIPTION);
            preparedStatement.setString(1, room.getDescription());
            preparedStatement.setInt(2, room.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }


    public void updateAdditionalService(Room room) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_ROOM_ADDITIONAL_SERVICE);
            preparedStatement.setString(1, room.getDescription());
            preparedStatement.setInt(2, room.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }

    public void addPhotos(int id, Collection<Part> parts) {
        for (Part part : parts) {
            addPhoto(id, part, false);
        }

    }

    public void addPhoto(int id, Part part, boolean isMainPhoto) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_PHOTO);
            preparedStatement.setBlob(1, part.getInputStream());
            preparedStatement.setBoolean(2, isMainPhoto);
            preparedStatement.execute();

            int last_inserted_id = 0;
            ResultSet rs = preparedStatement.getGeneratedKeys();
            if (rs.next()) {
                last_inserted_id = rs.getInt(1);
            }

            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_ROOM_PHOTO);
            preparedStatement.setInt(1, id);
            preparedStatement.setInt(2, last_inserted_id);
            preparedStatement.execute();

        } catch (SQLException | IOException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

    }


}
