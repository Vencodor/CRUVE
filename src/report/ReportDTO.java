package report;

public class ReportDTO {
	String userID=null;
	int writtenID=0;
	int reviewID=0;
	String description=null;
	String lastDate=null;
	int reportID=0;
	boolean isOK=false;
	public boolean isOK() {
		return isOK;
	}
	public void setOK(boolean isOK) {
		this.isOK = isOK;
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
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public int getReportID() {
		return reportID;
	}
	public void setReportID(int reportID) {
		this.reportID = reportID;
	}
	public ReportDTO() {
	}
	public ReportDTO(String userID, int writtenID, int reviewID, String description, String lastDate, int reportID, boolean isOK) {
		super();
		this.userID = userID;
		this.writtenID = writtenID;
		this.reviewID = reviewID;
		this.description = description;
		this.lastDate = lastDate;
		this.reportID = reportID;
		this.isOK = isOK;
	}
	
	
}
