package review;

public class ReviewDTO {
	String userID=null;
	int writtenID=0;
	String description=null;
	int rate=0;
	String lastDate=null;
	int reviewID=0;
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int rateID) {
		this.reviewID = rateID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getWrittenID() {
		return writtenID;
	}
	public void setWrittenID(int writtenID) {
		this.writtenID = writtenID;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	
	public ReviewDTO() {
		
	}
	
	public ReviewDTO(String userID, int writtenID, String description, int rate, String lastDate,int reviewID) {
		super();
		this.userID = userID;
		this.writtenID = writtenID;
		this.description = description;
		this.rate = rate;
		this.lastDate = lastDate;
		this.reviewID = reviewID;
	}
	
	
}
