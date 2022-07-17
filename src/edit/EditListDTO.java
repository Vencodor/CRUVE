package edit;

import java.sql.Date;

public class EditListDTO {
	int writtenID=0;
	String editTitle=null;
	String title=null;
	String subtitle=null;
	String description=null;
	String category=null;
	String subcategory=null;
	int price=0;
	String coverImage=null;
	String file=null;
	String editDate=null;
	public int getWrittenID() {
		return writtenID;
	}
	public void setWrittenID(int writtenID) {
		this.writtenID = writtenID;
	}
	public String getEditTitle() {
		return editTitle;
	}
	public void setEditTitle(String editTitle) {
		this.editTitle = editTitle;
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
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	public EditListDTO() {
	}
	public EditListDTO(int writtenID, String editTitle, String title, String subtitle, String description,
			String category, String subcategory, int price, String coverImage, String file, String editDate) {
		super();
		this.writtenID = writtenID;
		this.editTitle = editTitle;
		this.title = title;
		this.subtitle = subtitle;
		this.description = description;
		this.category = category;
		this.subcategory = subcategory;
		this.price = price;
		this.coverImage = coverImage;
		this.file = file;
		this.editDate = editDate;
	}
}
