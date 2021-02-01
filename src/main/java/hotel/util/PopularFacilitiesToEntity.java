package hotel.util;

import hotel.entity.FacilitiesEntity;
import hotel.entity.Room;
import hotel.enums.AmenitiesOfRoom;

import java.util.ArrayList;
import java.util.List;

public class PopularFacilitiesToEntity {
    private PopularFacilitiesToEntity() {
    }

    public static List<RowOfPopularFacilitiesToEntity> getListOfAmenitiesOfRoom(){
        AmenitiesOfRoom[] popularFacilities = AmenitiesOfRoom.values();
        List<RowOfPopularFacilitiesToEntity> list = new ArrayList<>();
        for (int i = 0; i <popularFacilities.length ; i+=3) {
             FacilitiesEntity firstCol;
             FacilitiesEntity secondCol = null;
             FacilitiesEntity thirdCol = null;

             firstCol=new FacilitiesEntity(popularFacilities[i].getText(),
                     popularFacilities[i].getPathToIMG(),
                     popularFacilities[i].name());

             if ((i+1)<popularFacilities.length){
                 secondCol=new FacilitiesEntity(popularFacilities[i+1].getText(),popularFacilities[i+1].getPathToIMG(),
                         popularFacilities[i+1].name());
             }

            if ((i+2)<popularFacilities.length){
                thirdCol=new FacilitiesEntity(popularFacilities[i+2].getText(),popularFacilities[i+2].getPathToIMG(),
                        popularFacilities[i+2].name());
            }
            list.add(  new RowOfPopularFacilitiesToEntity(firstCol,secondCol,thirdCol));
        }
        return list;
    }



    public static List<FacilitiesEntity> getListOfAmenitiesOfRoom(List<String> popularFacilities){
        List<FacilitiesEntity> list = new ArrayList<>();
        for (String popularFacility:popularFacilities) {
            AmenitiesOfRoom amenitiesOfRoom = AmenitiesOfRoom.valueOf(popularFacility);
            list.add(new FacilitiesEntity(amenitiesOfRoom.getText(),amenitiesOfRoom.getPathToIMG()));
        }
        return list;
    }




    public static class RowOfPopularFacilitiesToEntity{
        private FacilitiesEntity firstCol;
        private FacilitiesEntity secondCol;
        private FacilitiesEntity thirdCol;

        public RowOfPopularFacilitiesToEntity(FacilitiesEntity firstCol, FacilitiesEntity secondCol,
                                              FacilitiesEntity thirdCol) {
            this.firstCol =  firstCol;
            this.secondCol = secondCol;
            this.thirdCol = thirdCol;
        }

        public FacilitiesEntity getFirstCol() {
            return firstCol;
        }

        public void setFirstCol(FacilitiesEntity firstCol) {
            this.firstCol = firstCol;
        }

        public FacilitiesEntity getSecondCol() {
            return secondCol;
        }

        public void setSecondCol(FacilitiesEntity secondCol) {
            this.secondCol = secondCol;
        }

        public FacilitiesEntity getThirdCol() {
            return thirdCol;
        }

        public void setThirdCol(FacilitiesEntity thirdCol) {
            this.thirdCol = thirdCol;
        }

    }
}
