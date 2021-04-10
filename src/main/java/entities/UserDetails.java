package entities;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "UserDetails", uniqueConstraints = @UniqueConstraint(columnNames = {
		"userID", "uEmail"}))
public class UserDetails {

	public UserDetails() {
	}
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int userID;
	@Column(nullable = false)
	private String firstName;
	private String lastName;
	@Column(nullable = false)
	private String uEmail;
	private int contactNumber;
	@Column(nullable = false)
	private String registraionDate;
	private Address userAddress;
	@Column(nullable = false)
	private String userType;
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
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
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public int getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(int contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getRegistraionDate() {
		return registraionDate;
	}
	public void setRegistraionDate(Date registerDate) {
		SimpleDateFormat formatter = new SimpleDateFormat(
				"dd-MM-yyyy, HH:mm:ss");
		Date date = new Date();
		this.registraionDate = formatter.format(date);
	}
	public Address getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(Address userAddress) {
		this.userAddress = userAddress;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}

}
