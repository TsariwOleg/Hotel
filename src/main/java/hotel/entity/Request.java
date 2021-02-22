package hotel.entity;

import hotel.enums.ClassOfTheRoom;
import hotel.enums.RequestStatus;

import java.time.LocalDate;
import java.util.List;
import java.util.Locale;

public class Request {
    private int id;
    private int idUser;
    private LocalDate startDate;
    private LocalDate endDate;
    private String note;
    private int price;
    private int countOfClient;
    private String name;
    private String surname;
    private ClassOfTheRoom classOfTheRoom;
    private List<Room> roomList;
    private RequestStatus requestStatus;


    public ClassOfTheRoom getClassOfTheRoom() {
        return classOfTheRoom;
    }

    public void setClassOfTheRoom(ClassOfTheRoom classOfTheRoom) {
        this.classOfTheRoom = classOfTheRoom;
    }

    public RequestStatus getRequestStatus() {
        return requestStatus;
    }

    public void setRequestStatus(RequestStatus requestStatus) {
        this.requestStatus = requestStatus;
    }

    public List<Room> getRoomList() {
        return roomList;
    }

    public void setRoomList(List<Room> roomList) {
        this.roomList = roomList;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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

    @Override
    public String toString() {
        return "Request{" +
                "id=" + id +
                ", idUser=" + idUser +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", note='" + note + '\'' +
                ", price=" + price +
                ", countOfClient=" + countOfClient +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", roomList=" + roomList +
                '}';
    }
}
