package entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table
public class CourseList {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(unique = true)
	private int courseID;
	private String courseName;
	private String couseDescription;
	private String courseImage;
	private int coursePrice = 2999;
	@Temporal(TemporalType.DATE)
	@Column(name = "courseAddedDate")
	private Date courseAddedDate;

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
	public String getCouseDescription() {
		return couseDescription;
	}
	public void setCouseDescription(String couseDescription) {
		this.couseDescription = couseDescription;
	}
	public String getCourseImage() {
		return courseImage;
	}
	public void setCourseImage(String courseImagePath) {
		this.courseImage = courseImagePath;
	}
	public int getCoursePrice() {
		return coursePrice;
	}
	public void setCoursePrice(int coursePrice) {
		this.coursePrice = coursePrice;
	}
	public Date getCourseAddedDate() {
		return courseAddedDate;
	}
	public void setCourseAddedDate(Date courseAddedDate) {
		this.courseAddedDate = courseAddedDate;
	}
	public CourseList() {
	}
	public CourseList(String courseName, String couseDescription,
			String courseImage, int coursePrice, Date courseAddedDate) {
		super();
		this.courseName = courseName;
		this.couseDescription = couseDescription;
		this.courseImage = courseImage;
		this.coursePrice = coursePrice;
		this.courseAddedDate = courseAddedDate;
	}

	public CourseList(String courseName, String couseDescription,
			int coursePrice) {
		super();
		this.courseName = courseName;
		this.couseDescription = couseDescription;
		this.coursePrice = coursePrice;
	}
	@Override
	public String toString() {
		return "CourseList [courseID=" + courseID + ", courseName=" + courseName
				+ ", couseDescription=" + couseDescription + ", courseImage="
				+ courseImage + ", coursePrice=" + coursePrice + "]";
	}

}
