package entities;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

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
	private Date updatedCourseDate;
	private int discount;
	private String level;
	private String learnTime;
	private String creatorName;
	private String requirements;
	private int moneyBackGuaranteeDays;
	private String lang;
	private String language;

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

	public Date getUpdatedCourseDate() {
		return updatedCourseDate;
	}

	public void setUpdatedCourseDate(Date updatedCourseDate) {
		this.updatedCourseDate = updatedCourseDate;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getLearnTime() {
		return learnTime;
	}

	public void setLearnTime(String learnTime) {
		this.learnTime = learnTime;
	}

	public String getCreatorName() {
		return creatorName;
	}

	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}

	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public int getMoneyBackGuaranteeDays() {
		return moneyBackGuaranteeDays;
	}

	public void setMoneyBackGuaranteeDays(int moneyBackGuaranteeDays) {
		this.moneyBackGuaranteeDays = moneyBackGuaranteeDays;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public CourseList() {
	}

	public CourseList(String courseName, String couseDescription, String courseImage, int coursePrice,
			Date courseAddedDate) {
		super();
		this.courseName = courseName;
		this.couseDescription = couseDescription;
		this.courseImage = courseImage;
		this.coursePrice = coursePrice;
		this.courseAddedDate = courseAddedDate;
	}

	public CourseList(String courseName, String couseDescription, int coursePrice) {
		super();
		this.courseName = courseName;
		this.couseDescription = couseDescription;
		this.coursePrice = coursePrice;
	}

	public CourseList(int courseID, String courseName, String couseDescription, int coursePrice, Date updatedCourseDate,
			int discount, String level, String learnTime, String creatorName, String requirements,
			int moneyBackGuaranteeDays, String lang, String language) {
		super();
		this.courseID = courseID;
		this.courseName = courseName;
		this.couseDescription = couseDescription;
		this.coursePrice = coursePrice;
		this.updatedCourseDate = updatedCourseDate;
		this.discount = discount;
		this.level = level;
		this.learnTime = learnTime;
		this.creatorName = creatorName;
		this.requirements = requirements;
		this.moneyBackGuaranteeDays = moneyBackGuaranteeDays;
		this.lang = lang;
		this.language = language;
	}

	@Override
	public String toString() {
		return "CourseList [courseID=" + courseID + ", courseName=" + courseName + ", couseDescription="
				+ couseDescription + ", courseImage=" + courseImage + ", coursePrice=" + coursePrice
				+ ", courseAddedDate=" + courseAddedDate + ", updatedCourseDate=" + updatedCourseDate + ", discount="
				+ discount + ", level=" + level + ", learnTime=" + learnTime + ", creatorName=" + creatorName
				+ ", requirements=" + requirements + ", moneyBackGuaranteeDays=" + moneyBackGuaranteeDays + ", lang="
				+ lang + ", language=" + language + "]";
	}
}