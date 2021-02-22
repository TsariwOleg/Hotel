package hotel.enums;

public enum ClassOfTheRoom {
    ECONOMY(1),STANDARD(2),SUPERIOR(3),PREMIUM(4);

    private int priority;

    ClassOfTheRoom(int priority) {
        this.priority = priority;
    }

    public int getPriority() {
        return priority;
    }
}
