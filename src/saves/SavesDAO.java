package saves;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class SavesDAO {
	
	public int insert(SavesDTO saveDTO) {
		String SQL = "INSERT INTO SAVES VALUES ( null , ? , ? )";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, saveDTO.getUserID());
			pstmt.setInt(2, saveDTO.getWrittenID());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int delete(int ID,String userID) {
		String SQL = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			if(ID==-1) {
				SQL = "DELETE FROM SAVES WHERE userID = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, userID);
			} else {
				SQL = "DELETE FROM SAVES WHERE saveID = ? AND userID = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, ID);
				pstmt.setString(2, userID);
			}
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public ArrayList<SavesDTO> getList(String userID) {
		String SQL = "SELECT * FROM SAVES WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rel = null;
		ArrayList<SavesDTO> saveDTO = new ArrayList<SavesDTO>();
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rel = pstmt.executeQuery();
			
			while(rel.next()) {
				SavesDTO saveList = new SavesDTO(
						rel.getInt(1),
						rel.getString(2),
						rel.getInt(3)
						);
				saveDTO.add(saveList);
			}
			return saveDTO;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rel != null) rel.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
}
