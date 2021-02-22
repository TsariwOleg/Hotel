package hotel.entity;

import java.time.LocalDate;

public class Review {
    private int id;
    private String review;
    private LocalDate date;
    private User user;
    private int roomId;
    private CategoryReviews categoryReviews;

    public CategoryReviews getCategoryReviews() {
        return categoryReviews;
    }

    //todo smth with method
    public void setCategoryReviews(int comfortable, int fortunes, int soundproof, int service) {
        this.categoryReviews = new CategoryReviews(comfortable, fortunes, soundproof, service);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }


    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }



    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public static class CategoryReviews {
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

        @Override
        public String toString() {
            return "CategoryReviews{" +
                    "comfortable=" + comfortable +
                    ", fortunes=" + fortunes +
                    ", soundproof=" + soundproof +
                    ", service=" + service +
                    '}';
        }
    }

}
