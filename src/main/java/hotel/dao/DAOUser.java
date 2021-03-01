package hotel.dao;

import hotel.entity.User;
import hotel.enums.Language;
import hotel.enums.Role;
import hotel.util.ConnectionUtil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAOUser {
    //todo settingsOfUser
    private static String SQL_INSERT_USER = "INSERT INTO clients(name,surname,ismanager,access,settingsOfUser) values (?,?,?,?,?)";
    private static String SQL_INSERT_ACCESS = "INSERT INTO ACCESS(email,password) values(?,?)";

    private static String SQL_INSERT_SETTINGS_USER = "INSERT INTO SETTINGS_USERS(language_id) values(?)";


    private static String SQL_SELECT_CLIENT_ID_ACCESS = "SELECT c.id FROM ACCESS INNER JOIN CLIENTS c ON ACCESS.ID=c.ACCESS " +
            " WHERE EMAIL=? and PASSWORD=?";

    private static String SQL_SELECT_USER = "SELECT * FROM CLIENTS c INNER JOIN ACCESS a ON a.ID =c.ACCESS  " +
            "INNER JOIN SETTINGS_USERS su ON su.ID =c.SETTINGSOFUSER " +
            "INNER JOIN LANGUAGES l  ON l.ID =su.LANGUAGE_ID " +
            "WHERE a.ID=?";

    private static String SQL_UPDATE_FULL_NAME = "UPDATE clients set name=? , surname=? where id=?";
    private static String SQL_UPDATE_EMAIL = "UPDATE ACCESS set email=? where id=?";
    private static String SQL_UPDATE_PASSWORD = "UPDATE ACCESS set PASSWORD=? where id=?";

    private static String SQL_SELECT_LANGUAGE_BY_NAME = "SELECT * FROM LANGUAGES WHERE LANGUAGE =?";

    private static String SQL_UPDATE_LANGUAGE_OF_USER="update SETTINGS_USERS SET LANGUAGE_ID= (SELECT id FROM LANGUAGES WHERE LANGUAGE=?) " +
            "WHERE ID = (SELECT SETTINGSOFUSER FROM CLIENTS C WHERE C.ID =?) ";

    public void add(User user) {
        PreparedStatement preparedStatement = null;
        try {

            System.out.println(user.getLanguage());
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_USER);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getSurname());
            preparedStatement.setBoolean(3, user.getRole().compareTo(Role.MANAGER) == 0);
            preparedStatement.setInt(4, addAccess(user.getEmail(), user.getPassword()));
            preparedStatement.setInt(5, addLanguageToUser(user));
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

    }

    public int addLanguageToUser(User user) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int idSettings=0;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_LANGUAGE_BY_NAME);
            preparedStatement.setString(1, user.getLanguage().name());
            resultSet = preparedStatement.executeQuery();

            int idLanguage = 0;
            if (resultSet.next()) {
                idLanguage = resultSet.getInt("id");
            }

            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_SETTINGS_USER);
            preparedStatement.setInt(1, idLanguage);
            preparedStatement.execute();

            resultSet = preparedStatement.getGeneratedKeys();
            if (resultSet.next()) {
                idSettings = resultSet.getInt(1);
            }


        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
        return idSettings;
    }

    public void changeLanguageOfUser(User user){
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_LANGUAGE_OF_USER);
            preparedStatement.setString(1,user.getLanguage().name());
            preparedStatement.setInt(2,user.getId());
            preparedStatement.execute();
        }catch (SQLException e){
            System.err.println(e);
        }finally {
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
                user.setId(resultSet.getInt(1));
                user.setName(resultSet.getString("name"));
                user.setSurname(resultSet.getString("surname"));
                user.setRole(resultSet.getBoolean("ismanager") ? Role.MANAGER : Role.CLIENT);
                user.setEmail(resultSet.getString("email"));
                user.setLanguage(Language.valueOf(resultSet.getString("language")));
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
        return user;

    }

    public void updateFullName(int id, String name, String surname) {

        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_UPDATE_FULL_NAME);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, surname);
            preparedStatement.setInt(3, id);
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

    }


    public void updateEmail(int id, String email) {
        updateAccess(id, email, SQL_UPDATE_EMAIL);
    }


    public void updatePassword(int id, String password) {
        updateAccess(id, password, SQL_UPDATE_PASSWORD);
    }

    private void updateAccess(int id, String value, String query) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(query);
            preparedStatement.setString(1, value);
            preparedStatement.setInt(2, id);
            preparedStatement.execute();
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
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
        User user = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_CLIENT_ID_ACCESS);
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
