package chat;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import review.ReviewDTO;
import util.AES256;
import util.DatabaseUtil;

public class ChatDataDAO {
	
	public int write(ChatDataDTO chatDTO) {
		AES256 aes256 = null;
		try {
			aes256 = new AES256();
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String SQL = "INSERT INTO CHATDATA VALUES (?,?,?,now(),null)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			chatDTO.setMessage(chatDTO.getMessage().replace(aes256.encrypt("PIZZA"), "")) ;
			pstmt.setString(1, chatDTO.getUserID());
			pstmt.setString(2, chatDTO.getToID());
			pstmt.setString(3, chatDTO.getMessage());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public ArrayList<ChatDataDTO> menuGetList(String userID) {
		ArrayList<ChatDataDTO> chatMsgList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
			SQL = "SELECT * FROM CHATDATA WHERE toID=? ORDER BY chatID DESC LIMIT 0, 4";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			chatMsgList = new ArrayList<ChatDataDTO>();
			while(rs.next()) {
				ChatDataDTO chatDTO = new ChatDataDTO (
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5)
				);
				chatMsgList.add(chatDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return chatMsgList;
	}
	
	public ArrayList<ChatDataDTO> getList(String userID,String toID) {
		ArrayList<ChatDataDTO> chatMsgList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
			SQL = "SELECT * FROM CHATDATA WHERE (userID=? AND toID=?) OR (userID=? AND toID=?) ORDER BY chatID ASC LIMIT 0, 100";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, toID);
			pstmt.setString(3, toID);
			pstmt.setString(4, userID);
			rs = pstmt.executeQuery();
			chatMsgList = new ArrayList<ChatDataDTO>();
			while(rs.next()) {
				ChatDataDTO chatDTO = new ChatDataDTO (
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5)
				);
				chatMsgList.add(chatDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return chatMsgList;
	}
	
	public int deleteData(String userID,String toID) {
		String SQL = "DELETE FROM CHATDATA WHERE userID=? AND toID=?";
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
	
}
