package follow;

public class FollowObj {
	int follower=0;
	String userID=null;

	public int getFollower() {
		return follower;
	}
	public void setFollower(int follower) {
		this.follower = follower;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public FollowObj() {
		
	}
	
	public FollowObj(int follower, String userID) {
		super();
		this.follower = follower;
		this.userID = userID;
	}
}
