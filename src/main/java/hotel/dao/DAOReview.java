package hotel.dao;

import hotel.entity.Review;
import hotel.entity.Room;
import hotel.entity.User;
import hotel.util.ConnectionUtil;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class DAOReview {
    private static String SQL_INSERT_INTO_REVIEWS = "INSERT INTO reviews(review,datee,id_client,id_room,id_ratting) values(?,?,?,?,?)";
    private static String SQL_INSERT_INTO_CATEGORY_REVIEWS = "INSERT INTO category_reviews(COMFORTABLE,FORTUNES,SOUNDPROOF,SERVICE) values(?,?,?,?)";

    private static String SQL_SELECT_REVIEWS_BY_ROOM_ID = "SELECT * FROM REVIEWS r INNER JOIN " +
            "CATEGORY_REVIEWS cr ON R.ID_RATTING =CR.ID inner JOIN CLIENTS c2 ON c2.ID = r.ID_CLIENT  WHERE ID_ROOM=?";


    private static String SQL_SELECT_AVG_GRATE_BY_ROOM_ID = "SELECT avg(comfortable) , avg(fortunes) , avg(soundproof), avg(service) FROM REVIEWS r INNER JOIN\n" +
            "CATEGORY_REVIEWS cr ON R.ID_RATTING =CR.ID WHERE r.ID_ROOM =?";

    private DAOReview(){}

    public static void addReview(Review review) {
        PreparedStatement preparedStatement = null;
//todo transaction

        try {

            int f = addCategoryReviews(review.getCategoryReviews());


            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_INTO_REVIEWS);
            preparedStatement.setString(1, review.getReview());
            preparedStatement.setDate(2, Date.valueOf(LocalDate.now()));
            preparedStatement.setInt(3, review.getUser().getId());
            preparedStatement.setInt(4, review.getRoomId());
            preparedStatement.setInt(5, f);
            preparedStatement.execute();


        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

    }

    public static int addCategoryReviews(Review.CategoryReviews categoryReviews) {
        PreparedStatement preparedStatement = null;
        int last_inserted_id = 0;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_INTO_CATEGORY_REVIEWS);

            if (categoryReviews.getComfortable() == 0) {
                preparedStatement.setNull(1, Types.INTEGER);
            } else {
                preparedStatement.setInt(1, categoryReviews.getComfortable());
            }


            if (categoryReviews.getFortunes() == 0) {
                preparedStatement.setNull(2, Types.INTEGER);
            } else {
                preparedStatement.setInt(2, categoryReviews.getFortunes());
            }

            if (categoryReviews.getSoundproof() == 0) {
                preparedStatement.setNull(3, Types.INTEGER);
            } else {
                preparedStatement.setInt(3, categoryReviews.getSoundproof());
            }

            if (categoryReviews.getService() == 0) {
                preparedStatement.setNull(4, Types.INTEGER);
            } else {
                preparedStatement.setInt(4, categoryReviews.getService());
            }


            preparedStatement.execute();

            ResultSet rs = preparedStatement.getGeneratedKeys();
            if (rs.next()) {
                last_inserted_id = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
        return last_inserted_id;
    }


    public static List<Review> getReviewsByRoomId(int idRoom) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Review> reviews = new ArrayList<>();
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_REVIEWS_BY_ROOM_ID);
            preparedStatement.setInt(1, idRoom);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Review review = new Review();
                review.setId(resultSet.getInt(1));
                review.setReview(resultSet.getString("review"));
                review.setDate(resultSet.getDate("datee").toLocalDate());

                User user = new User();
                user.setName(resultSet.getString("name"));
                user.setSurname(resultSet.getString("surname"));
                review.setUser(user);


                review.setCategoryReviews(resultSet.getInt("comfortable"),
                        resultSet.getInt("fortunes"),
                        resultSet.getInt("soundproof"),
                        resultSet.getInt("service")
                );

                reviews.add(review);
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }

        return reviews;
    }

    public static Review.CategoryReviews getTotalPoint(int idRoom) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Review.CategoryReviews totalPoint = null;
        try {
            preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_SELECT_AVG_GRATE_BY_ROOM_ID);
            preparedStatement.setInt(1, idRoom);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                totalPoint = new Review.CategoryReviews(resultSet.getInt(1),
                        resultSet.getInt(2),
                        resultSet.getInt(3),
                        resultSet.getInt(4)
                );
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            ConnectionUtil.closeResultSet(resultSet);
            ConnectionUtil.closePreparedStatement(preparedStatement);
        }
        return totalPoint;
    }


}
