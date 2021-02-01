package hotel.util.sorting;

import hotel.entity.Hotel;
import hotel.entity.Room;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class SortingRooms {
    private SortingRooms(){}

    private static Comparator<Room> SORTED_ROOMS_BY_PRICE= (o1, o2) -> o1.getPrice()-o2.getPrice();

    private static Comparator<Room> SORTED_ROOMS_BY_PRICE_REV= (o1, o2) -> o2.getPrice()-o1.getPrice();


    private static Comparator<Room> SORTED_ROOMS_BY_COUNT_OF_CLIENTS= (o1, o2) -> o1.getCountOfClient()-o2.getCountOfClient();

    public static void getHotelsSortedByPrice(List<Room> rooms){
        Collections.sort(rooms,SORTED_ROOMS_BY_PRICE);
    }

    //todo rename
    public static void getHotelsSortedByPriceReve(List<Room> rooms){
        Collections.sort(rooms,SORTED_ROOMS_BY_PRICE_REV);
    }


    public static void getHotelsSortedByCountOfClient(List<Room> rooms){
        Collections.sort(rooms,SORTED_ROOMS_BY_COUNT_OF_CLIENTS);
    }


}
