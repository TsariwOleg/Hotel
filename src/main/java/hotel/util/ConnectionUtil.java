package hotel.util;

import java.sql.*;

public class ConnectionUtil {
    private ConnectionUtil() {
    }


    public static Connection getConnection() {
        String URL = "jdbc:h2:~/Hotels";
        String Password = "";
        String Driver = "org.h2.Driver";
        String Login = "user";
        Connection connection = null;

        try {
            Class.forName(Driver);
            connection = DriverManager.getConnection(URL, Login, Password);

        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("sdf" + e);
        }

        return connection;
    }

    public static void closeStatement(Statement statement){
        try {
            if (statement!=null && !statement.isClosed()){
                statement.close();
            }
        }catch (SQLException e){
            System.err.println(e);
        }
    }

    public static void closePreparedStatement(PreparedStatement preparedStatement){
        try {
            if (preparedStatement!=null && !preparedStatement.isClosed()){
                preparedStatement.close();
            }
        }catch (SQLException e){
            System.err.println(e);
        }
    }


    public static void closeResultSet(ResultSet resultSet){
        try {
            if (resultSet!=null && !resultSet.isClosed()){
                resultSet.close();
            }
        }catch (SQLException e){
            System.err.println(e);
        }
    }

}
