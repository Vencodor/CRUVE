package profileComment;

public class CommentUnderDTO {
	int commentID=0;
	String userID=null;
	int toCommentID=0;
	String comment=null;
	String date=null;
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
	public int getToCommentID() {
		return toCommentID;
	}
	public void setToCommentID(int toCommentID) {
		this.toCommentID = toCommentID;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public CommentUnderDTO() {
		
	}
	public CommentUnderDTO(int commentID, String userID, int toCommentID, String comment, String date) {
		super();
		this.commentID = commentID;
		this.userID = userID;
		this.toCommentID = toCommentID;
		this.comment = comment;
		this.date = date;
	}
	
}
