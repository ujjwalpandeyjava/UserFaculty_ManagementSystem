package entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class BoughtCourses {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int buyingID;
	private int courseID;
	private String courseName;
	private String couseDescription;
	private String courseImage;
	private int coursePrice = 2999;
	private String userEmail;

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

	public BoughtCourses() {
	}

	public String getCourseImage() {
		return courseImage;
	}

	public void setCourseImage(String courseImage) {
		this.courseImage = courseImage;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public BoughtCourses(int courseID, String courseName,
			String couseDescription, String courseImage, int coursePrice,
			String userEmail) {
		super();
		this.courseID = courseID;
		this.courseName = courseName;
		this.couseDescription = couseDescription;
		this.courseImage = courseImage;
		this.coursePrice = coursePrice;
		this.userEmail = userEmail;
	}

}
