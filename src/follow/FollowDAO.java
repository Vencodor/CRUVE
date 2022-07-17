package follow;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.cj.xdevapi.Result;

import setting.SettingDTO;
import util.DatabaseUtil;

public class FollowDAO {
	
	public int insert(FollowDTO followDTO) {
		String SQL = "INSERT INTO FOLLOW VALUES ( null , ? , ? , false )";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, followDTO.getUserID());
			pstmt.setString(2, followDTO.getToID());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int delete(String userID,String ID) {
		String SQL = "DELETE FROM FOLLOW WHERE userID = ? AND toID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, ID);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int setNewsEnable(String toID) { //뉴스 활성화 ( 게시자 전용 )
		String SQL = "UPDATE FOLLOW SET news=true WHERE toID = ?"; //게시자를 팔로우하는 모든 사람들의 뉴스를 활성화
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, toID);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int setNewsDisable(String userID,String toID) { //뉴스 비활성화
		String SQL = "UPDATE FOLLOW SET news=false WHERE userID = ? AND toID = ?"; //특정 유저에게 팔로워의 뉴스를 해제
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, toID);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public ArrayList<FollowDTO> getList(String userID) {
		String SQL = "SELECT * FROM FOLLOW WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rel = null;
		ArrayList<FollowDTO> followList = new ArrayList<FollowDTO>();
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rel = pstmt.executeQuery();
			
			while(rel.next()) {
				FollowDTO followDTO = new FollowDTO(
						rel.getInt(1),
						rel.getString(2),
						rel.getString(3),
						rel.getBoolean(4)
						);
				followList.add(followDTO);
			}
			return followList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rel != null) rel.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	public ArrayList<FollowDTO> getMyList(String toID) {
		String SQL = "SELECT * FROM FOLLOW WHERE toID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rel = null;
		ArrayList<FollowDTO> followList = new ArrayList<FollowDTO>();
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, toID);
			rel = pstmt.executeQuery();
			
			while(rel.next()) {
				FollowDTO followDTO = new FollowDTO(
						rel.getInt(1),
						rel.getString(2),
						rel.getString(3),
						rel.getBoolean(4)
						);
				followList.add(followDTO);
			}
			return followList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rel != null) rel.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	public FollowDTO getData(String userID,String toID) {
		String SQL = "SELECT * FROM FOLLOW WHERE userID = ? AND toID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rel = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, toID);
			rel = pstmt.executeQuery();
			
			if(rel.next()) {
				FollowDTO followDTO = new FollowDTO(
						rel.getInt(1),
						rel.getString(2),
						rel.getString(3),
						rel.getBoolean(4)
						);
				return followDTO;
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rel != null) rel.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	public boolean isFollow(String userID,String toID) {
		String SQL = "SELECT followID FROM FOLLOW WHERE userID = ? AND toID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, toID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true; //대상을 팔로우 중임
			}
			return false; //팔로우 중이지 않음
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return false;
	}
	
}
