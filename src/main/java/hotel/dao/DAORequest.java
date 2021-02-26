package hotel.dao;

import hotel.entity.Request;
import hotel.enums.ClassOfTheRoom;
import hotel.enums.RequestStatus;
import hotel.util.ConnectionUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DAORequest {
    //todo rename DateВeparture
    private static String SQL_INSERT_INTO_REQUEST = "INSERT INTO REQUESTS(id_client,price,class_of_room,count_of_client,DateOccupied,DateВeparture,Notes,status) values(?,?,?,?,?,?,?,?)";
    private static String SQL_INSERT_INTO_REQUESTS_ROOMS = "INSERT INTO REQUESTS_ROOMS VALUES (?,?)";


    private static String SQL_SELECT_REQUESTS_BY_USER_ID =
            "SELECT * FROM REQUESTS R INNER JOIN CLIENTS C ON R.ID_CLIENT=C.ID WHERE R.ID_CLIENT = ?";

    private static String SQL_SELECT_REQUESTS = "SELECT * FROM REQUESTS R INNER JOIN CLIENTS C ON R.ID_CLIENT=C.ID";


    private static String SQL_DELETE_REQUESTS_BY_ID = "DELETE FROM requests WHERE id = ?";


    private static String SQL_UPDATE_REQUEST_CLASS = "UPDATE REQUESTS SET class_of_room = ? WHERE ID=?";
    private static String SQL_UPDATE_REQUEST_PRICE = "UPDATE REQUESTS SET PRICE = ? WHERE ID=?";
    private static String SQL_UPDATE_REQUEST_NOTE = "UPDATE REQUESTS SET NOTES = ? WHERE ID=?";
    private static String SQL_UPDATE_REQUEST_COUNT_OF_CLIENTS = "UPDATE REQUESTS SET COUNT_OF_CLIENT = ? WHERE ID=?";
    private static String SQL_UPDATE_REQUEST_DATE = "UPDATE REQUESTS SET DateOccupied = ? ,DateВeparture=?  WHERE ID=?";

    private static String SQL_UPDATE_REQUEST_STATUS= "UPDATE REQUESTS SET Status=?  WHERE ID=?";


    public void add(Request request) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_INTO_REQUEST);
            preparedStatement.setInt(1, request.getIdUser());


            if (request.getPrice() == 0) {
                preparedStatement.setNull(2, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(2, request.getPrice());
            }

            if (request.getClassOfTheRoom() ==null) {
                preparedStatement.setNull(3, Types.VARCHAR);
            } else {
                preparedStatement.setString(3, request.getClassOfTheRoom().name());
            }

            if (request.getCountOfClient() == 0) {
                preparedStatement.setNull(4, java.sql.Types.INTEGER);
            } else {
                preparedStatement.setInt(4, request.getCountOfClient());
            }


            if (request.getStartDate() == null && request.getEndDate() == null) {
                preparedStatement.setNull(5, java.sql.Types.DATE);
                preparedStatement.setNull(6, java.sql.Types.DATE);
            } else {
                preparedStatement.setDate(5, Date.valueOf(request.getStartDate()));
                preparedStatement.setDate(6, Date.valueOf(request.getEndDate()));
            }
            preparedStatement.setString(7, request.getNote());
            preparedStatement.setString(8, RequestStatus.IN_PROCESS.toString());
            preparedStatement.execute();

        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }

    public void addRoomToRequest(int idRequest, int idRoom){
        PreparedStatement preparedStatement = null;
        System.out.println(idRequest);
        System.out.println(idRoom);
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_INTO_REQUESTS_ROOMS);
            preparedStatement.setInt(1,idRequest);
            preparedStatement.setInt(2,idRoom);
            preparedStatement.execute();
        }catch (SQLException e){
            System.err.println(e);
        }finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

    }

    private List<Request> getList(ResultSet resultSet) throws SQLException {
        List<Request> list = new ArrayList<>();

        while (resultSet.next()) {
            Request request = new Request();
            request.setId(resultSet.getInt(1));
            request.setIdUser(resultSet.getInt("id_client"));
            request.setPrice(resultSet.getInt("price"));

            ClassOfTheRoom classOfTheRoom = resultSet.getString("class_of_room")!=null?
                    ClassOfTheRoom.valueOf(resultSet.getString("class_of_room")):null;
            request.setClassOfTheRoom(classOfTheRoom);

            request.setCountOfClient(resultSet.getInt("count_of_client"));
            request.setName(resultSet.getString("name"));
            request.setSurname(resultSet.getString("surname"));
            request.setRequestStatus(RequestStatus.valueOf(resultSet.getString("status")));

            if (resultSet.getDate("DateOccupied") == null &&
                    resultSet.getDate("DateВeparture") == null) {
                request.setStartDate(null);
                request.setEndDate(null);
            } else {
                request.setStartDate(resultSet.getDate("DateOccupied").toLocalDate());
                //todo rename DateВeparture
                request.setEndDate(resultSet.getDate("DateВeparture").toLocalDate());
            }

            request.setRoomList(new DAORoom().getRoomsRequest(request.getId()));
            request.setNote(resultSet.getString("Notes"));
            list.add(request);
        }
        return list;
    }

    public List<Request> getRequests() {
        Statement statement = null;
        ResultSet resultSet = null;
        List<Request> list = new ArrayList<>();

        try {
            statement = ConnectionUtil.getConnection().createStatement();
            list= getList(  resultSet = statement.executeQuery(SQL_SELECT_REQUESTS));
        }catch (SQLException e){
            System.err.println(e);
        }finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closeStatement(statement);
        }
        return list;
    }


    public List<Request> getRequestsByClientId(int id) {
        PreparedStatement preparedStatement = null;
        List<Request> list = new ArrayList<>();
        ResultSet resultSet = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_REQUESTS_BY_USER_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeQuery();
            list = getList(resultSet = preparedStatement.executeQuery());

        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
        return list;
    }

    public void deleteRequestById(int id) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_DELETE_REQUESTS_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }


    public void updateClassOfTheRoom(Request request) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_REQUEST_CLASS);
            preparedStatement.setString(1, request.getClassOfTheRoom().name());
            preparedStatement.setInt(2, request.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }


    public void updatePrice(Request request) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_REQUEST_PRICE);
            preparedStatement.setInt(1, request.getPrice());
            preparedStatement.setInt(2, request.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }

    public void updateNote(Request request) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_REQUEST_NOTE);
            preparedStatement.setString(1, request.getNote());
            preparedStatement.setInt(2, request.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);

        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }

    public void updateCountOfClients(Request request) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_REQUEST_COUNT_OF_CLIENTS);
            preparedStatement.setInt(1, request.getCountOfClient());
            preparedStatement.setInt(2, request.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);

        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }

    public void updateDate(Request request) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_REQUEST_DATE);
            preparedStatement.setDate(1, Date.valueOf(request.getStartDate()));
            preparedStatement.setDate(2, Date.valueOf(request.getEndDate()));
            preparedStatement.setInt(3, request.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);

        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }


    public void changeStatus(int id, String status){
        PreparedStatement preparedStatement=null;
        try {
            preparedStatement=ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_REQUEST_STATUS);
            preparedStatement.setString(1,status);
            preparedStatement.setInt(2,id);
            preparedStatement.execute();
        }catch (SQLException e){
            System.err.println(e);
        }finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }


    }

}
