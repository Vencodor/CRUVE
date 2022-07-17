package follow;

public class FollowDTO {
	
	int followID = 0;
	String userID = null;
	String toID = null;
	boolean news = false;
	public int getFollowID() {
		return followID;
	}
	public void setFollowID(int followID) {
		this.followID = followID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getToID() {
		return toID;
	}
	public void setToID(String toID) {
		this.toID = toID;
	}
	public boolean isNews() {
		return news;
	}
	public void setNews(boolean news) {
		this.news = news;
	}
	
	public FollowDTO() {
	}
	
	public FollowDTO(int followID, String userID, String toID, boolean news) {
		super();
		this.followID = followID;
		this.userID = userID;
		this.toID = toID;
		this.news = news;
	}
}
