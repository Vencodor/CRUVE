package report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import commodity.CommodityDTO;
import report.ReportDTO;
import util.DatabaseUtil;

public class ReportDAO {
	
	public int write(ReportDTO reportDTO) {
		String SQL = "INSERT INTO REPORT VALUES ( ? , ? , ? , ? , now() , null , false )";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, reportDTO.getUserID());
			pstmt.setInt(2, reportDTO.getWrittenID());
			pstmt.setInt(3, reportDTO.getReviewID());
			pstmt.setString(4, reportDTO.getDescription());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public ArrayList<ReportDTO> getList (String userID) {
		ArrayList<ReportDTO> reportList = null;
		String SQL = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
			if(userID.equals("1324qqww")) {
				SQL = "SELECT * FROM REPORT";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
			} else {
				SQL = "SELECT * FROM REPORT WHERE userID = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,userID);
			}
			//퍼센트는 LIKE 퍼센트를 넣어야 함
			rs = pstmt.executeQuery();
			reportList = new ArrayList<ReportDTO>();
			while(rs.next()) {
				ReportDTO reportDTO = new ReportDTO (
						rs.getString(1),
						rs.getInt(2),
						rs.getInt(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getBoolean(7)
				);
				reportList.add(reportDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return reportList;
	}
	
	public int delete(int id) {
		String SQL = "DELETE FROM REPORT WHERE reportID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int setCheck(boolean is,int id) {
		String SQL = "UPDATE REPORT SET isOK = ? WHERE reportID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setBoolean(1, is);
			pstmt.setInt(2, id);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public boolean isMy (String userID,int id) {
		ArrayList<ReportDTO> reportList = null;
		String SQL = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
			if(userID.equals("1324qqww")) {
				return true;
			} else {
				SQL = "SELECT reportID FROM REPORT WHERE userID = ? AND reportID = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,userID);
				pstmt.setInt(2,id);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			} else {
				return false;
			}
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
