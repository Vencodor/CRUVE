package setting;

public class SettingDTO {
	String userID = null;
	boolean NotiFollowActive = false; //�ȷο� �˸�
	boolean NotiWrittenReview = false; //���� ������ ���� Ȱ�� �˸�
	boolean NotiWrittenBuy = false; //�� �����ڿ� ���� Ȱ�� �˸�
	boolean NotiWrittenGoods = false; //�� �� ���ƿ信 ���� Ȱ�� �˸�
	boolean NotiComment = false; //�� ��ۿ� ���� Ȱ�� �˸�
	boolean NotiEmail = false; //�̸��� �˸��� ���� Ȱ�� �˸�
	boolean PublicEmail = false; //�̸��� ��������
	boolean PublicProfile = false; //������ ��������
	boolean PublicMessage = false; //�޽��� �߰����� ����
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public boolean isNotiFollowActive() {
		return NotiFollowActive;
	}
	public void setNotiFollowActive(boolean notiProfileActive) {
		NotiFollowActive = notiProfileActive;
	}
	public boolean isNotiWrittenReview() {
		return NotiWrittenReview;
	}
	public void setNotiWrittenReview(boolean notiWrittenReview) {
		NotiWrittenReview = notiWrittenReview;
	}
	public boolean isNotiWrittenBuy() {
		return NotiWrittenBuy;
	}
	public void setNotiWrittenBuy(boolean notiWrittenBuy) {
		NotiWrittenBuy = notiWrittenBuy;
	}
	public boolean isNotiWrittenGoods() {
		return NotiWrittenGoods;
	}
	public void setNotiWrittenGoods(boolean notiWrittenGoods) {
		NotiWrittenGoods = notiWrittenGoods;
	}
	public boolean isNotiComment() {
		return NotiComment;
	}
	public void setNotiComment(boolean notiComment) {
		NotiComment = notiComment;
	}
	public boolean isNotiEmail() {
		return NotiEmail;
	}
	public void setNotiEmail(boolean notiEmail) {
		NotiEmail = notiEmail;
	}
	public boolean isPublicEmail() {
		return PublicEmail;
	}
	public void setPublicEmail(boolean publicEmail) {
		PublicEmail = publicEmail;
	}
	public boolean isPublicProfile() {
		return PublicProfile;
	}
	public void setPublicProfile(boolean publicProfile) {
		PublicProfile = publicProfile;
	}
	public boolean isPublicMessage() {
		return PublicMessage;
	}
	public void setPublicMessage(boolean publicMessage) {
		PublicMessage = publicMessage;
	}
	public SettingDTO() {
		
	}
	public SettingDTO(String userID, boolean notiFollowActive, boolean notiWrittenReview, boolean notiWrittenBuy,
			boolean notiWrittenGoods, boolean notiComment, boolean notiEmail, boolean publicEmail,
			boolean publicProfile, boolean publicMessage) {
		super();
		this.userID = userID;
		NotiFollowActive = notiFollowActive;
		NotiWrittenReview = notiWrittenReview;
		NotiWrittenBuy = notiWrittenBuy;
		NotiWrittenGoods = notiWrittenGoods;
		NotiComment = notiComment;
		NotiEmail = notiEmail;
		PublicEmail = publicEmail;
		PublicProfile = publicProfile;
		PublicMessage = publicMessage;
	}
}
