package commodity;

public class CommodityDTO {
	int writtenID=0;
	String writtenCode=null;
	String userID=null;
	String title=null;
	String subtitle=null;
	String description=null;
	String category=null;
	String subcategory=null;
	int price=0;
	String coverImage=null;
	String file=null;
	int likeCount=0;
	String likeUser=null;
	String lastDate=null;
	int buyer=0;
	String buyerDescription=null;
	int saleAmount=0;
	String saleStartDate=null;
	String saleEndDate=null;
	boolean saleActive=false;
	
	public boolean isSaleActive() {
		return saleActive;
	}
	public void setSaleActive(boolean saleActive) {
		this.saleActive = saleActive;
	}
	public int getSaleAmount() {
		return saleAmount;
	}
	public void setSaleAmount(int saleAmount) {
		this.saleAmount = saleAmount;
	}
	public String getSaleStartDate() {
		return saleStartDate;
	}
	public void setSaleStartDate(String saleStartDate) {
		this.saleStartDate = saleStartDate;
	}
	public String getSaleEndDate() {
		return saleEndDate;
	}
	public void setSaleEndDate(String saleEndDate) {
		this.saleEndDate = saleEndDate;
	}
	public String getLikeUser() {
		return likeUser;
	}
	public void setLikeUser(String likeUser) {
		this.likeUser = likeUser;
	}
	public String getBuyerDescription() {
		return buyerDescription;
	}
	public void setBuyerDescription(String buyerDescription) {
		this.buyerDescription = buyerDescription;
	}
	public int getWrittenID() {
		return writtenID;
	}
	public void setWrittenID(int writtenID) {
		this.writtenID = writtenID;
	}
	public String getWrittenCode() {
		return writtenCode;
	}
	public void setWrittenCode(String writtenCode) {
		this.writtenCode = writtenCode;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCoverImage() {
		return coverImage;
	}
	public void setCoverImage(String coverImage) {
		this.coverImage = coverImage;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public int getBuyer() {
		return buyer;
	}
	public void setBuyer(int buyer) {
		this.buyer = buyer;
	}
	
	public CommodityDTO() {
		
	}

	public CommodityDTO(int writtenID, String writtenCode,String userID, String title, String subtitle, String description,
			String category, String subcategory, int price,	String coverImage, String file, int likeCount,
			String likeUser, String lastDate, int buyer, String buyerDescription, int saleAmount, String saleStartDate,
			String saleEndDate, boolean saleActive) {
		super();
		this.writtenID = writtenID;
		this.writtenCode = writtenCode;
		this.userID = userID;
		this.title = title;
		this.subtitle = subtitle;
		this.description = description;
		this.category = category;
		this.subcategory = subcategory;
		this.price = price;
		this.coverImage = coverImage;
		this.file = file;
		this.likeCount = likeCount;
		this.likeUser = likeUser;
		this.lastDate = lastDate;
		this.buyer = buyer;
		this.buyerDescription = buyerDescription;
		this.saleAmount = saleAmount;
		this.saleStartDate = saleStartDate;
		this.saleEndDate = saleEndDate;
		this.saleActive = saleActive;
	}
	
	
}
