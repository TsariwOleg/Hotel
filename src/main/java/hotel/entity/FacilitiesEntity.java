package hotel.entity;

public class FacilitiesEntity {
    private String id;
    private String path;
    private String enumName;
    private String resourceName;

    public FacilitiesEntity(String path , String enumName, String resourceName) {
        this(path,resourceName);
        this.enumName=enumName;
    }


    public FacilitiesEntity(String path , String resourceName) {
        this.id=resourceName;
        this.path = path;
        this.resourceName=resourceName;
    }

    public String getEnumName() {
        return enumName;
    }

    public void setEnumName(String enumName) {
        this.enumName = enumName;
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
                ", id='" + id + '\'' +
                ", path='" + path + '\'' +
                ", enumName='" + enumName + '\'' +
                ", resourceName='" + resourceName + '\'' +
                '}';
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }
}
