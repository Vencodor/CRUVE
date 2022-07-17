package chat;
public class ChatDataDTO {
	String userID=null;
	String toID=null;
	String message=null;
	String lastDate=null;
	int chatID=0;
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public int getChatID() {
		return chatID;
	}
	public void setChatID(int chatID) {
		this.chatID = chatID;
	}
	
	public ChatDataDTO() {
	}
	
	public ChatDataDTO(String userID, String toID, String message, String lastDate, int chatID) {
		super();
		this.userID = userID;
		this.toID = toID;
		this.message = message;
		this.lastDate = lastDate;
		this.chatID = chatID;
	}
}
