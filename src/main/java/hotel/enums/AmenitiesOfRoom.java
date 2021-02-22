package hotel.enums;

public enum AmenitiesOfRoom {
    PRIVATE_BATHROOM("resources/rooms_icon/shower.png","private_bathroom"),
    BALCONY ("resources/rooms_icon/antique-balcony.png","balcony"),
    FLAT_SCREEN_TV("resources/rooms_icon/television.png","flat_screen_TV"),
    SOUNDPROOF("resources/rooms_icon/mute.png","soundproof"),
    CITY_VIEW("resources/rooms_icon/buildings.png","city_view"),
    MOUNTAIN_VIEW("resources/rooms_icon/mountain.png","mountain_view"),
    INNER_COURTYARD_VIEW("resources/rooms_icon/woodland.png","inner_courtyard_view"),
    COFFEE_MACHINE("resources/rooms_icon/coffee-maker.png","coffee_machine"),
    AIR_CONDITIONING("resources/rooms_icon/weather.png","air_conditioning"),
    MINIBAR("resources/rooms_icon/minibar.png","minibar"),
    LANDMARK_VIEW("resources/rooms_icon/monumental.png","landmark_view"),
    FAMILY_ROOM("resources/rooms_icon/family.png","family_room"),
    FREE_WIFI("resources/rooms_icon/wifi.png","free_WiFi"),
    PET_FRIENDLY("resources/rooms_icon/pawprint.png","pet_friendly"),
    BEAUTIFUL_VIEW_FROM_WINDOWS("resources/rooms_icon/mountain.png","beautiful_view")
    ;


    private String pathToIMG;
    private String resourceName;

    AmenitiesOfRoom(String pathToIMG,String resourceName) {

        this.pathToIMG = pathToIMG;
        this.resourceName = resourceName;
    }



    public String getPathToIMG() {
        return pathToIMG;
    }

    public String getResourceName() {
        return resourceName;
    }
}
