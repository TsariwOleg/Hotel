package hotel.entity;

import hotel.enums.ClassOfTheRoom;

import javax.servlet.http.Part;
import java.util.Collection;
import java.util.List;

public class Room {
    private int id;
    private int roomNumber;
    private int price;
    private int countOfClient;
    private int areaOfRoom;
    private String description;
    private String additionalServices;
    private List<String> amenitiesOfRoom;
    private List<FacilitiesEntity> facilitiesEntities;
    private ClassOfTheRoom classOfTheRoom;
    private Review.CategoryReviews totalPoint;
    private double avgPoint;



    private String strMainPhoto;
    private List<String> strPhotos;
    private Part mainPhoto;
    private List<Part> photos;


    public void setAvgPoint(double avgPoint) {
        this.avgPoint = avgPoint;
    }

    public String getStrMainPhoto() {
        return strMainPhoto;
    }

    public void setStrMainPhoto(String strMainPhoto) {
        this.strMainPhoto = strMainPhoto;
    }

    public List<String> getStrPhotos() {
        return strPhotos;
    }

    public void setStrPhotos(List<String> strPhotos) {
        this.strPhotos = strPhotos;
    }

    public Part getMainPhoto() {
        return mainPhoto;
    }

    public void setMainPhoto(Part mainPhoto) {
        this.mainPhoto = mainPhoto;
    }

    public List<Part> getPhotos() {
        return photos;
    }

    public void setPhotos(List<Part> photos) {
        this.photos = photos;
    }

    public double getAvgPoint() {
        this.avgPoint =
                (double)(totalPoint.getComfortable()+totalPoint.getFortunes()+
                        totalPoint.getService()+totalPoint.getSoundproof())/4;
        return avgPoint;
    }

    public ClassOfTheRoom getClassOfTheRoom() {
        return classOfTheRoom;
    }

    public void setClassOfTheRoom(ClassOfTheRoom classOfTheRoom) {
        this.classOfTheRoom = classOfTheRoom;
    }

    public Review.CategoryReviews getTotalPoint() {
        return totalPoint;
    }

    public void setTotalPoint(Review.CategoryReviews totalPoint) {
        this.totalPoint = totalPoint;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getAdditionalServices() {
        return additionalServices;
    }

    public void setAdditionalServices(String additionalServices) {
        this.additionalServices = additionalServices;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }



    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCountOfClient() {
        return countOfClient;
    }

    public void setCountOfClient(int countOfClient) {
        this.countOfClient = countOfClient;
    }

    public int getAreaOfRoom() {
        return areaOfRoom;
    }

    public void setAreaOfRoom(int areaOfRoom) {
        this.areaOfRoom = areaOfRoom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getAmenitiesOfRoom() {
        return amenitiesOfRoom;
    }

    public void setAmenitiesOfRoom(List<String> amenitiesOfRoom) {
        this.amenitiesOfRoom = amenitiesOfRoom;
    }

    public List<FacilitiesEntity> getFacilitiesEntities() {
        return facilitiesEntities;
    }

    public void setFacilitiesEntities(List<FacilitiesEntity> facilitiesEntities) {
        this.facilitiesEntities = facilitiesEntities;
    }

    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", price=" + price +
                ", countOfClient=" + countOfClient +
                ", areaOfRoom=" + areaOfRoom +
                ", description='" + description + '\'' +
                ", amenitiesOfRoom=" + amenitiesOfRoom +
                ", facilitiesEntities=" + facilitiesEntities +
                '}';
    }

}
