package hotel.util;

import hotel.entity.Room;

import java.util.List;

public class GetSubList {
    private GetSubList() {
    }

   public static List<Room> getSublist(int page, List<Room> rooms) {
       int firstIndex =page*5;
       int lastIndex= Math.min(rooms.size(), firstIndex + 5);
       return rooms.subList(firstIndex,lastIndex);
    }

}
