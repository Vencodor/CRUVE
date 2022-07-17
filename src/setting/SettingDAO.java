package setting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import noti.NotiDTO;
import util.DatabaseUtil;

public class SettingDAO {
	public int upsert(SettingDTO settingDTO) {
		String SQL = 
				"INSERT INTO SETTING VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? )" + 
				" ON DUPLICATE KEY UPDATE" + 
				" NotiFollowActive = ? , NotiWrittenReview = ? , NotiWrittenBuy = ? , NotiWrittenGoods = ? ," +
				" NotiComment = ? , NotiEmail = ? , PublicEmail = ? , PublicProfile = ? , PublicMessage = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, settingDTO.getUserID());
			pstmt.setBoolean(2, settingDTO.isNotiFollowActive());
			pstmt.setBoolean(3, settingDTO.isNotiWrittenReview());
			pstmt.setBoolean(4, settingDTO.isNotiWrittenBuy());
			pstmt.setBoolean(5, settingDTO.isNotiWrittenGoods());
			pstmt.setBoolean(6, settingDTO.isNotiComment());
			pstmt.setBoolean(7, settingDTO.isNotiEmail());
			pstmt.setBoolean(8, settingDTO.isPublicEmail());
			pstmt.setBoolean(9, settingDTO.isPublicProfile());
			pstmt.setBoolean(10, settingDTO.isPublicMessage());
			
			pstmt.setBoolean(11, settingDTO.isNotiFollowActive());
			pstmt.setBoolean(12, settingDTO.isNotiWrittenReview());
			pstmt.setBoolean(13, settingDTO.isNotiWrittenBuy());
			pstmt.setBoolean(14, settingDTO.isNotiWrittenGoods());
			pstmt.setBoolean(15, settingDTO.isNotiComment());
			pstmt.setBoolean(16, settingDTO.isNotiEmail());
			pstmt.setBoolean(17, settingDTO.isPublicEmail());
			pstmt.setBoolean(18, settingDTO.isPublicProfile());
			pstmt.setBoolean(19, settingDTO.isPublicMessage());
			
			return pstmt.executeUpdate(); //1은 오류, -1은 실패
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public SettingDTO getData(String userID) {
		String SQL = "SELECT * FROM SETTING WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				SettingDTO settingDTO = new SettingDTO(
						rs.getString(1),
						rs.getBoolean(2),
						rs.getBoolean(3),
						rs.getBoolean(4),
						rs.getBoolean(5),
						rs.getBoolean(6),
						rs.getBoolean(7),
						rs.getBoolean(8),
						rs.getBoolean(9),
						rs.getBoolean(10)
				);
				return settingDTO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
}
