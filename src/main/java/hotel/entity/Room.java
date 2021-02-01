package hotel.entity;

import java.util.List;

public class Room {
    private int id;
    private String name;
    private int roomNumber;
    private int price;
    private int countOfClient;
    private int areaOfRoom;
    private String description;
    private String additionalServices;
    private List<String> amenitiesOfRoom;
    private List<FacilitiesEntity> facilitiesEntities;
    private String classOfRoom;
    private CategoryReviews categoryReviews;

    public CategoryReviews getCategoryReviews() {
        return categoryReviews;
    }

    public void setCategoryReviews(int comfortable,int fortunes,int soundproof,int service) {
        this.categoryReviews = new CategoryReviews(comfortable,fortunes,soundproof,service);
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

    public String getClassOfRoom() {
        return classOfRoom;
    }

    public void setClassOfRoom(String classOfRoom) {
        this.classOfRoom = classOfRoom;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
                ", name='" + name + '\'' +
                ", price=" + price +
                ", countOfClient=" + countOfClient +
                ", areaOfRoom=" + areaOfRoom +
                ", description='" + description + '\'' +
                ", amenitiesOfRoom=" + amenitiesOfRoom +
                ", facilitiesEntities=" + facilitiesEntities +
                '}';
    }

    private class CategoryReviews{
        private int comfortable;
        private int fortunes;
        private int soundproof;
        private int service;

        public CategoryReviews(int comfortable, int fortunes, int soundproof, int service) {
            this.comfortable = comfortable;
            this.fortunes = fortunes;
            this.soundproof = soundproof;
            this.service = service;
        }

        public int getComfortable() {
            return comfortable;
        }

        public int getFortunes() {
            return fortunes;
        }

        public int getSoundproof() {
            return soundproof;
        }

        public int getService() {
            return service;
        }
    }
}
