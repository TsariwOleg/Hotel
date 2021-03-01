package hotel.util;

import hotel.entity.AmenitiesEntity;
import hotel.entity.Room;
import hotel.enums.AmenitiesOfRoom;

import java.util.ArrayList;
import java.util.List;

public class PopularFacilitiesToEntity {
    private PopularFacilitiesToEntity() {
    }

    public static List<RowOfPopularFacilitiesToEntity> getListOfAmenitiesOfRoom() {
        AmenitiesOfRoom[] popularFacilities = AmenitiesOfRoom.values();
        List<RowOfPopularFacilitiesToEntity> list = new ArrayList<>();
        for (int i = 0; i < popularFacilities.length; i += 3) {
            AmenitiesEntity firstCol;
            AmenitiesEntity secondCol = null;
            AmenitiesEntity thirdCol = null;

            firstCol = new AmenitiesEntity(
                    popularFacilities[i].getPathToIMG(),
                    popularFacilities[i].name(),
                    popularFacilities[i].getResourceName()
            );

            if ((i + 1) < popularFacilities.length) {
                secondCol = new AmenitiesEntity( popularFacilities[i + 1].getPathToIMG(),
                        popularFacilities[i + 1].name(),
                        popularFacilities[i+1].getResourceName());
            }

            if ((i + 2) < popularFacilities.length) {
                thirdCol = new AmenitiesEntity( popularFacilities[i + 2].getPathToIMG(),
                        popularFacilities[i + 2].name(),
                        popularFacilities[i+2].getResourceName());
            }
            list.add(new RowOfPopularFacilitiesToEntity(firstCol, secondCol, thirdCol));
        }
        return list;
    }


    public static List<AmenitiesEntity> getListOfAmenitiesOfRoom(List<String> popularFacilities) {
        List<AmenitiesEntity> list = new ArrayList<>();
        for (String popularFacility : popularFacilities) {
            AmenitiesOfRoom amenitiesOfRoom = AmenitiesOfRoom.valueOf(popularFacility);
            list.add(new AmenitiesEntity(amenitiesOfRoom.getPathToIMG(),
                    amenitiesOfRoom.getResourceName() ));
        }
        return list;
    }


    public static class RowOfPopularFacilitiesToEntity {
        private AmenitiesEntity firstCol;
        private AmenitiesEntity secondCol;
        private AmenitiesEntity thirdCol;

        public RowOfPopularFacilitiesToEntity(AmenitiesEntity firstCol, AmenitiesEntity secondCol,
                                              AmenitiesEntity thirdCol) {
            this.firstCol = firstCol;
            this.secondCol = secondCol;
            this.thirdCol = thirdCol;
        }

        public AmenitiesEntity getFirstCol() {
            return firstCol;
        }

        public void setFirstCol(AmenitiesEntity firstCol) {
            this.firstCol = firstCol;
        }

        public AmenitiesEntity getSecondCol() {
            return secondCol;
        }

        public void setSecondCol(AmenitiesEntity secondCol) {
            this.secondCol = secondCol;
        }

        public AmenitiesEntity getThirdCol() {
            return thirdCol;
        }

        public void setThirdCol(AmenitiesEntity thirdCol) {
            this.thirdCol = thirdCol;
        }

    }
}
