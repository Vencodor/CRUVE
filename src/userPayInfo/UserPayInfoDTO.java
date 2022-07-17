package userPayInfo;

public class UserPayInfoDTO {
	
	String userID=null;
	String payID=null;
	String payEmail=null;
	String payPhoneNumber=null;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPayID() {
		return payID;
	}
	public void setPayID(String payID) {
		this.payID = payID;
	}
	public String getPayEmail() {
		return payEmail;
	}
	public void setPayEmail(String payEmail) {
		this.payEmail = payEmail;
	}
	public String getPayPhoneNumber() {
		return payPhoneNumber;
	}
	public void setPayPhoneNumber(String payPhoneNumber) {
		this.payPhoneNumber = payPhoneNumber;
	}
	
	public UserPayInfoDTO() {
	}
	
	public UserPayInfoDTO(String userID, String payID, String payEmail, String payPhoneNumber) {
		super();
		this.userID = userID;
		this.payID = payID;
		this.payEmail = payEmail;
		this.payPhoneNumber = payPhoneNumber;
	}
	
}
