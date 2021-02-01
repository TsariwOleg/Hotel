package hotel.entity;

public class FacilitiesEntity {
    private String text;
    private String id;
    private String path;
    private String enumName;

    public FacilitiesEntity(String text, String path , String enumName) {
        this.id=text.replace(System.lineSeparator(),"_");
        this.text = text;
        this.path = path;
        this.enumName=enumName;
    }


    public FacilitiesEntity(String text, String path ) {
        this.id=text.replace(System.lineSeparator(),"_");
        this.text = text;
        this.path = path;
    }

    public String getEnumName() {
        return enumName;
    }

    public void setEnumName(String enumName) {
        this.enumName = enumName;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "FacilitiesEntity{" +
                "text='" + text + '\'' +
                ", id='" + id + '\'' +
                ", path='" + path + '\'' +
                '}';
    }
}
