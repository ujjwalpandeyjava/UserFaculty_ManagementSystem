package enums;

public enum UserType {
	SUPERADMIN("SUPERADMIN"), FACULTY("FACULTY"), TUTOR("TUTOR"), LEARNER("LEARNER");

	private String action;

	public String getUserType() {
		return this.action;
	}

	// enum constructor - Cannot be public or protected
	private UserType(String action) {
		this.action = action;
	}
}
