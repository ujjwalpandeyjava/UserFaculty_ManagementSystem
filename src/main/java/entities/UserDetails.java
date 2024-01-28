package entities;

import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class UserDetails {

	@Id
	@Column(nullable = false, unique = true)
	private String email;

	@Column(nullable = false, length = 20)
	private String firstName;

	@Column(nullable = true, length = 20)
	private String lastName;

	@Column(nullable = false)
	private String password;

	@Column(nullable = true)
	private String contactNumber;

	@Column(nullable = false)
	private String registraionDate;

	@Column(nullable = false)
	private String userType;

	@Column(nullable = true, length = 15)
	private String houseNo;

	@Column(nullable = true)
	private String landMark;

	@Column(nullable = true, length = 35)
	private String city;

	@Column(nullable = true)
	private String state;

	@Column(nullable = true)
	private String pinCode;

	@Column(nullable = true)
	private String imagePath;

	public UserDetails() {
		super();
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getLandMark() {
		return landMark;
	}

	public void setLandMark(String landMark) {
		this.landMark = landMark;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getRegistraionDate() {
		return registraionDate;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public void setRegistraionDate(Date registerDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy, HH:mm:ss");
		this.registraionDate = formatter.format(registerDate);
	}

	// Used while registration
	public UserDetails(String firstName, String lastName, String email, String password, Date registraionDate,
			String userType) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.userType = userType;
		this.setRegistraionDate(registraionDate);
		this.registraionDate = this.getRegistraionDate();
	}

	public UserDetails(String email, String firstName, String lastName, String password, String contactNumber,
			String userType, String houseNo, String landMark, String city, String state, String pinCode,
			String imagePath) {
		super();
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.contactNumber = contactNumber;
		this.userType = userType;
		this.houseNo = houseNo;
		this.landMark = landMark;
		this.city = city;
		this.state = state;
		this.pinCode = pinCode;
		this.imagePath = imagePath;
	}

	public String getFullName() {
		return firstName + " " + lastName;
	}

	public String toStringFullAddress() {
		return "Address:- " + getHouseNo() + ", " + getLandMark() + ", " + getCity() + ", " + getState() + " "
				+ getPinCode();
	}

	@Override
	public String toString() {
		return "UserDetails [email=" + email + ", firstName=" + firstName + ", lastName=" + lastName + ", password="
				+ password + ", contactNumber=" + contactNumber + ", registraionDate=" + registraionDate + ", userType="
				+ userType + ", houseNo=" + houseNo + ", landMark=" + landMark + ", city=" + city + ", state=" + state
				+ ", pinCode=" + pinCode + " image path: " + imagePath + " ]";
	}

}
