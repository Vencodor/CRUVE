package profileComment;

public class CommentDTO {
	int commentID=0;
	String userID=null;
	String toID=null;
	String comment=null;
	int good=0;
	int bad=0;
	String date=null;
	String goodCheck=null;
	String badCheck=null;
	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getGoodCheck() {
		return goodCheck;
	}
	public void setGoodCheck(String goodCheck) {
		this.goodCheck = goodCheck;
	}
	public String getBadCheck() {
		return badCheck;
	}
	public void setBadCheck(String badCheck) {
		this.badCheck = badCheck;
	}
	public CommentDTO() {
		
	}
	public CommentDTO(int commentID, String userID, String toID, String comment, int good, int bad, String date,
			String goodCheck, String badCheck) {
		super();
		this.commentID = commentID;
		this.userID = userID;
		this.toID = toID;
		this.comment = comment;
		this.good = good;
		this.bad = bad;
		this.date = date;
		this.goodCheck = goodCheck;
		this.badCheck = badCheck;
	}
	
}
