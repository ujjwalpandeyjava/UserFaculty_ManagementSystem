package entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class BoughtCourses {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int buyingID;
    private int courseID;
    private byte[] courseImage;
    private String courseImagePath;
    private String courseName;
    private int coursePrice = 2999;
    private String couseDescription;
    private int userID;

    public int getBuyingID() {
        return buyingID;
    }

    public void setBuyingID(int buyingID) {
        this.buyingID = buyingID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public byte[] getCourseImage() {
        return courseImage;
    }

    public void setImage(byte[] courseImage) {
        this.courseImage = courseImage;
    }

    public String getCourseImagePath() {
        return courseImagePath;
    }

    public void setCourseImagePath(String courseImagePath) {
        this.courseImagePath = courseImagePath;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getCoursePrice() {
        return coursePrice;
    }

    public void setCoursePrice(int coursePrice) {
        this.coursePrice = coursePrice;
    }

    public String getCouseDescription() {
        return couseDescription;
    }

    public void setCouseDescription(String couseDescription) {
        this.couseDescription = couseDescription;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public BoughtCourses() {
    }

    public BoughtCourses(int buyingID, int userID, int courseID,
                         String courseName, String couseDescription, String courseImagePath,
                         int coursePrice) {
        super();
        this.buyingID = buyingID;
        this.userID = userID;
        this.courseID = courseID;
        this.courseName = courseName;
        this.couseDescription = couseDescription;
        this.courseImagePath = courseImagePath;
        this.coursePrice = coursePrice;
    }

}
