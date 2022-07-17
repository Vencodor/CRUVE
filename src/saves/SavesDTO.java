package saves;

public class SavesDTO {
	int saveID=0;
	String userID=null;
	int writtenID=0;
	public int getSaveID() {
		return saveID;
	}
	public void setSaveID(int saveID) {
		this.saveID = saveID;
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
	
	public SavesDTO() {
		
	}
	
	public SavesDTO(int saveID, String userID, int writtenID) {
		super();
		this.saveID = saveID;
		this.userID = userID;
		this.writtenID = writtenID;
	}
	
}
