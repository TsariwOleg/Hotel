package hotel.enums;

public enum AmenitiesOfRoom {
    PRIVATE_BATHROOM("Private Bathroom","resources/rooms_icon/shower.png"),
    BALCONY ("Balcony ","resources/rooms_icon/antique-balcony.png"),
    FLAT_SCREEN_TV("Flat-screen TV","resources/rooms_icon/television.png"),
    SOUNDPROOF("Soundproof","resources/rooms_icon/mute.png"),
    CITY_VIEW("City view","resources/rooms_icon/buildings.png"),
    MOUNTAIN_VIEW("Mountain view","resources/rooms_icon/mountain.png"),
    INNER_COURTYARD_VIEW("Inner courtyard view","resources/rooms_icon/woodland.png"),
    COFFEE_MACHINE("Coffee machine","resources/rooms_icon/coffee-maker.png"),
    AIR_CONDITIONING("Air conditioning","resources/rooms_icon/weather.png"),
    MINIBAR("Minibar","resources/rooms_icon/minibar.png"),
    LANDMARK_VIEW("Landmark view","resources/rooms_icon/monumental.png"),
    FAMILY_ROOM("Family room","resources/rooms_icon/family.png"),
    FREE_WIFI("Free WiFi","resources/rooms_icon/wifi.png"),
    PET_FRIENDLY("Pet friendly","resources/rooms_icon/pawprint.png"),
    BEAUTIFUL_VIEW_FROM_WINDOWS("Beautiful view from windows","resources/rooms_icon/mountain.png")
    ;

    private String text;
    private String pathToIMG;

    AmenitiesOfRoom(String text, String pathToIMG) {
        this.text = text;
        this.pathToIMG = pathToIMG;
    }

    public String getText() {
        return text;
    }


    public String getPathToIMG() {
        return pathToIMG;
    }


}
