package hotel.dao;

import hotel.entity.Review;
import hotel.util.ConnectionUtil;

import java.sql.PreparedStatement;
import java.sql.Statement;

public class DAOReview {
    String SQL_INSERT_INTO_REVIEWS="INSERT INTO reviews(review,datee,id_client,id_room,id_ratting) values(?,?,?,?,?)";



    public void addReview(Review review , int userId,int roomId){
//        PreparedStatement preparedStatement = ConnectionUtil.getConnection().prepareStatement(SQL_INSERT_INTO_REVIEWS);

    }


}
