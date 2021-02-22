package hotel.util.sorting;

import hotel.entity.Room;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class SortingRooms {
    private SortingRooms() {
    }

    private static Comparator<Room> SORTED_ROOMS_BY_PRICE_ASCENDING = Comparator.comparingInt(Room::getPrice);

    private static Comparator<Room> SORTED_ROOMS_BY_PRICE_DESCENDING = (o1, o2) -> o2.getPrice() - o1.getPrice();

    private static Comparator<Room> SORTED_ROOMS_BY_COUNT_OF_CLIENTS_ASCENDING = (o1, o2) -> o2.getCountOfClient() - o1.getCountOfClient();

    private static Comparator<Room> SORTED_ROOMS_BY_COUNT_OF_CLIENTS_DESCENDING = (o1, o2) -> o1.getCountOfClient() - o2.getCountOfClient();


    private static Comparator<Room> SORTED_ROOMS_BY_CLASS_ASCENDING = (o1, o2) ->
            o2.getClassOfTheRoom().getPriority() - o1.getClassOfTheRoom().getPriority();

    private static Comparator<Room> SORTED_ROOMS_BY_CLASS_DESCENDING = (o1, o2) ->
            o1.getClassOfTheRoom().getPriority() - o2.getClassOfTheRoom().getPriority();


    public static void getHotelsSortedByPriceAscending(List<Room> rooms) {
        Collections.sort(rooms, SORTED_ROOMS_BY_PRICE_ASCENDING);
    }

    public static void getHotelsSortedByPriceDescending(List<Room> rooms) {
        Collections.sort(rooms, SORTED_ROOMS_BY_PRICE_DESCENDING);
    }


    public static void getHotelsSortedByCountOfClientAscending(List<Room> rooms) {
        Collections.sort(rooms, SORTED_ROOMS_BY_COUNT_OF_CLIENTS_ASCENDING);
    }


    public static void getHotelsSortedByCountOfClientDescending(List<Room> rooms) {
        Collections.sort(rooms, SORTED_ROOMS_BY_COUNT_OF_CLIENTS_DESCENDING);
    }


    public static void getHotelsSortedByClassAscending(List<Room> rooms) {
        Collections.sort(rooms, SORTED_ROOMS_BY_CLASS_ASCENDING);
    }


    public static void getHotelsSortedByClassDescending(List<Room> rooms) {
        Collections.sort(rooms, SORTED_ROOMS_BY_CLASS_DESCENDING);
    }


}
