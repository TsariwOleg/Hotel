package hotel.dao;

import hotel.entity.User;
import hotel.enums.Role;
import hotel.util.ConnectionUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAOUser {
    //todo settingsOfUser
    private static String SQL_INSERT_USER = "INSERT INTO clients(name,surname,ismanager,access) values (?,?,?,?)";
    private static String SQL_INSERT_ACCESS = "INSERT INTO ACCESS(email,password) values(?,?)";

    private static String SQL_SELECT_ACCESS = "SELECT * FROM ACCESS WHERE EMAIL=? and PASSWORD= ?";
    private static String SQL_SELECT_USER = "SELECT * FROM CLIENTS c INNER JOIN ACCESS a ON a.ID =c.ACCESS  WHERE a.ID=?";

    private static  String SQL_UPDATE_FULL_NAME="UPDATE clients set name=? , surname=? where id=?";
    private static  String SQL_UPDATE_EMAIL="UPDATE ACCESS set email=? where id=?";
    private static  String SQL_UPDATE_PASSWORD="UPDATE ACCESS set PASSWORD=? where id=?";



    public void add(User user) {
        PreparedStatement preparedStatement = null;
        try {

            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_USER);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getSurname());
            preparedStatement.setBoolean(3, user.getRole().compareTo(Role.MANAGER) == 0);
            preparedStatement.setInt(4, addAccess(user.getEmail(), user.getPassword()));

            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

    }

    public User get(int id) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        User user = new User();
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_USER);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setSurname(resultSet.getString("surname"));
                user.setRole(resultSet.getBoolean("ismanager") ? Role.MANAGER : Role.CLIENT);
                user.setEmail(resultSet.getString("email"));
                System.out.println(user);
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
        return user;

    }

    public void updateFullName(int id,String name , String surname){

        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_FULL_NAME);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,surname);
            preparedStatement.setInt(3,id);
            preparedStatement.execute();
        }catch (SQLException e){
            System.err.println(e);
        }finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

    }




    public void updateEmail(int id,String email ){
        updateAccess(id,email,SQL_UPDATE_EMAIL);
    }


    public void updatePassword(int id,String password ){
        updateAccess(id,password,SQL_UPDATE_PASSWORD);
    }

    private void updateAccess(int id , String value , String query){
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(query);
            preparedStatement.setString(1,value);
            preparedStatement.setInt(2,id);
            preparedStatement.execute();
        }catch (SQLException e){
            System.err.println(e);
        }finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
    }



    private int addAccess(String email, String password) throws SQLException {
        PreparedStatement preparedStatement = null;
        int id = 0;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_ACCESS);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            preparedStatement.execute();

            ResultSet rs = preparedStatement.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
        return id;
    }


    //todo refactor
    public User checkAccess(String email, String password) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        User user =null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_ACCESS);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = get(resultSet.getInt("id"));
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

        return user;
    }


}
