package noti;

public class NotiDTO {
	String userID=null;
	String toID=null;
	String type=null;
	String content=null;
	String date=null;
	int id=0;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public NotiDTO() {
		
	}
	public NotiDTO(String userID, String toID, String type, String content, String date, int id) {
		super();
		this.userID = userID;
		this.toID = toID;
		this.type = type;
		this.content = content;
		this.date = date;
		this.id = id;
	}
}
