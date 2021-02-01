package hotel.entity;

import java.util.List;

public class Hotel {
    private int id;
    private String name;
    private int rating;
    private String description;
    private String shortDescription;
    private String hotelsOffers;
    private int mapId;
    private List<String> popularFacilitiesEntity;
    private List<Room> rooms;
    private int averagePrice;

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

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHotelsOffers() {
        return hotelsOffers;
    }

    public void setHotelsOffers(String hotelsOffer) {
        this.hotelsOffers = hotelsOffer;
    }


    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public int getMapId() {
        return mapId;
    }

    public void setMapId(int mapId) {
        this.mapId = mapId;
    }

    public List<String> getPopularFacilitiesEntity() {
        return popularFacilitiesEntity;
    }

    public void setPopularFacilitiesEntity(List<String> popularFacilitiesEntity) {
        this.popularFacilitiesEntity = popularFacilitiesEntity;
    }

    public List<Room> getRooms() {
        return rooms;
    }

    public void setRooms(List<Room> rooms) {
        this.rooms = rooms;
    }

    public int getAveragePrice() {
        return averagePrice;
    }

    public void setAveragePrice(int averagePrice) {
        this.averagePrice = averagePrice;
    }

    @Override
    public String toString() {
        return "Hotel{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", rating=" + rating +
                ", description='" + description + '\'' +
                ", shortDescription='" + shortDescription + '\'' +
                ", hotelsOffers='" + hotelsOffers + '\'' +
                ", mapId=" + mapId +
                ", popularFacilitiesEntity=" + popularFacilitiesEntity +
                ", avaragePrice=" + averagePrice +

                '}';
    }
}
