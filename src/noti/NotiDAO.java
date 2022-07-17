package noti;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import chat.ChatDataDTO;
import commodity.CommodityDTO;
import util.DatabaseUtil;
import util.ImageBLOB;

public class NotiDAO {
	
	public int write(NotiDTO notiDTO) {
		String SQL = "INSERT INTO NOTI VALUES (? , ? , ? , ? , now() , null)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, notiDTO.getUserID());
			pstmt.setString(2, notiDTO.getToID());
			pstmt.setString(3, notiDTO.getType());
			pstmt.setString(4, notiDTO.getContent());
			return pstmt.executeUpdate(); //1은 오류, -1은 실패
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public ArrayList<NotiDTO> menuGetList(String userID) {
		ArrayList<NotiDTO> notiList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
			SQL = "SELECT * FROM NOTI WHERE toID=? ORDER BY id DESC LIMIT 0, 4";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			notiList = new ArrayList<NotiDTO>();
			while(rs.next()) {
				NotiDTO notiDTO = new NotiDTO (
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6)
				);
				notiList.add(notiDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return notiList;
	}
	
	public ArrayList<NotiDTO> getList(String userID) {
		ArrayList<NotiDTO> notiList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
			SQL = "SELECT * FROM NOTI WHERE toID=? ORDER BY id DESC LIMIT 0, 30";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			notiList = new ArrayList<NotiDTO>();
			while(rs.next()) {
				NotiDTO notiDTO = new NotiDTO (
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6)
				);
				notiList.add(notiDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return notiList;
	}
	
	public int deleteNoti(int id,String userID) {
		String SQL = "DELETE FROM NOTI WHERE id = ? AND toID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			pstmt.setString(2,userID);
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
