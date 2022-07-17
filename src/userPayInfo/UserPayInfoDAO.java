package userPayInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import userPayInfo.UserPayInfoDTO;
import util.DatabaseUtil;

public class UserPayInfoDAO {
	
	public int insert(UserPayInfoDTO userPayInfo) {
		String SQL = "INSERT INTO userPayInfo VALUES (?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userPayInfo.getUserID());
			pstmt.setString(2, userPayInfo.getPayID());
			pstmt.setString(3, userPayInfo.getPayEmail());
			pstmt.setString(4, userPayInfo.getPayPhoneNumber());
			return pstmt.executeUpdate(); //1은 오류, -1은 실패
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public UserPayInfoDTO getInfo(String userID) {
		
		String SQL = "SELECT * FROM userPayInfo WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		UserPayInfoDTO userPayInfo=null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery(); //1은 오류, -1은 실패
			
			if(rs.next()) {
				 userPayInfo = new UserPayInfoDTO(
						 rs.getString(1),
						 rs.getString(2),
						 rs.getString(3),
						 rs.getString(4)
				);
			}
			return userPayInfo;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		
		return null;
	}
	
}
