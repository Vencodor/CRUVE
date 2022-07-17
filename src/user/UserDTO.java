package user;

import java.io.File;

public class UserDTO {
	String userName=null;
	String userID=null;
	String userPassword=null;
	String userRank=null;
	String userEmail=null;
	String userEmailHash=null;
	
	String ProfileShortContent=null;
	String ProfileContent=null;
	String ProfileImage=null;
	
	Boolean userEmailChecked=false;
	
	String facebook=null;
	String twitter=null;
	String git=null;
	String youtube=null;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserRank() {
		return userRank;
	}
	public void setUserRank(String userRank) {
		this.userRank = userRank;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}
	public String getProfileShortContent() {
		return ProfileShortContent;
	}
	public void setProfileShortContent(String profileShortContent) {
		ProfileShortContent = profileShortContent;
	}
	public String getProfileContent() {
		return ProfileContent;
	}
	public void setProfileContent(String profileContent) {
		ProfileContent = profileContent;
	}
	public String getProfileImage() {
		return ProfileImage;
	}
	public void setProfileImage(String profileImage) {
		ProfileImage = profileImage;
	}
	public Boolean getUserEmailChecked() {
		return userEmailChecked;
	}
	public void setUserEmailChecked(Boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getTwitter() {
		return twitter;
	}
	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}
	public String getGit() {
		return git;
	}
	public void setGit(String git) {
		this.git = git;
	}
	public String getYoutube() {
		return youtube;
	}
	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}
	
	public UserDTO() {
		
	}
	
	public UserDTO(String userName, String userID, String userPassword, String userRank, String userEmail,
			String userEmailHash, String profileShortContent, String profileContent, String profileImage,
			Boolean userEmailChecked, String facebook, String twitter, String git, String youtube) {
		super();
		this.userName = userName;
		this.userID = userID;
		this.userPassword = userPassword;
		this.userRank = userRank;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		ProfileShortContent = profileShortContent;
		ProfileContent = profileContent;
		ProfileImage = profileImage;
		this.userEmailChecked = userEmailChecked;
		this.facebook = facebook;
		this.twitter = twitter;
		this.git = git;
		this.youtube = youtube;
	}
	
}
