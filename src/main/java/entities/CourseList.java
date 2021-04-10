package entities;

public abstract class CourseList {

	public CourseList() {
	}
	private int courseID;
	private String courseName;
	private String couseDescription;
	private String courseImagePath;
	private int coursePrice = 2999;

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
	public String getCourseImagePath() {
		return courseImagePath;
	}
	public void setCourseImagePath(String courseImagePath) {
		this.courseImagePath = courseImagePath;
	}
	public int getCoursePrice() {
		return coursePrice;
	}
	public void setCoursePrice(int coursePrice) {
		this.coursePrice = coursePrice;
	}

}
