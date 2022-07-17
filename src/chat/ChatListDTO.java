package chat;
public class ChatListDTO {
	String userID=null;
	String toID=null;
	String lastDate=null;
	int chatID=0;
	int news=0;
	
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
	public int getNews() {
		return news;
	}
	public void setNews(int news) {
		this.news = news;
	}
	public ChatListDTO() {
		
	}
	public ChatListDTO(String userID, String toID, String lastDate, int chatID, int news) {
		super();
		this.userID = userID;
		this.toID = toID;
		this.lastDate = lastDate;
		this.chatID = chatID;
		this.news = news;
	}
	
}
