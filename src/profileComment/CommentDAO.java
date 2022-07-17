package profileComment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class CommentDAO {
	
	public int write(CommentDTO commentDTO) {
		String SQL = "INSERT INTO ProfileComment VALUES ( 0 , ? , ? , ? , 0 , 0 , now() , '' , '' )";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, commentDTO.getUserID());
			pstmt.setString(2, commentDTO.getToID());
			pstmt.setString(3, commentDTO.getComment());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public ArrayList<CommentDTO> getList (String userID) {
		ArrayList<CommentDTO> list = null;
		String SQL = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
				SQL = "SELECT * FROM ProfileComment WHERE toID = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,userID);
			//퍼센트는 LIKE 퍼센트를 넣어야 함
			rs = pstmt.executeQuery();
			list = new ArrayList<CommentDTO>();
			while(rs.next()) {
				CommentDTO commentDTO = new CommentDTO (
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getInt(6),
						rs.getString(7),
						rs.getString(8),
						rs.getString(9)
				);
				list.add(commentDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return list;
	}
	
	public int delete(int id) {
		String SQL = "DELETE FROM ProfileComment WHERE commentID = ?";
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
	
	public int deleteUnder(int id) {
		String SQL = "DELETE FROM ProfileCommentUnder WHERE toCommentID = ?";
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
	
	public int isCheck(String userID,int commentID) {
		String SQL = ""; // 물음표엔 아까 가져온 정보가 들어갈것
		String BadSQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
		
		boolean goodChecking=false;
		boolean badChecking=false;
		
		try {
			SQL = "SELECT * FROM ProfileComment WHERE commentID = ? AND goodCheck LIKE ?"; //만약 해당 유저가 좋아요를 누르고 있다면
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			pstmt.setString(2, "%"+userID+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				goodChecking=true;}
			else {
				goodChecking=false;}
			
			BadSQL = "SELECT * FROM ProfileComment WHERE commentID = ? AND badCheck LIKE ?"; //만약 해당 유저가 싫어요는 누르고 있다면
			pstmt1 = conn.prepareStatement(BadSQL);
			pstmt1.setInt(1, commentID);
			pstmt1.setString(2, "%"+userID+"%");
			ResultSet rs1 = pstmt1.executeQuery();
			if(rs1.next()) {
				badChecking=true;}
			else {
				badChecking=false;}
			if(goodChecking&&!badChecking)
				return 1;
			else if(!goodChecking&&badChecking)
				return 2;
			else if(!goodChecking&&!badChecking)
				return 0;
			else
				return -1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt1 != null) pstmt1.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public boolean isMy(String userID,int commentID) {
		String SQL = "SELECT toID,userID FROM ProfileComment WHERE commentID = ?"; //좋아요 / 싫어요 부정 체크하는거 계속 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userID)) //만약 글쓴이가 페이지 주인이면
					return true;
				if(rs.getString(2).equals(userID)) //만약 글쓴이가 작성자면
					return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return false;
	}
	
	public boolean isMyPage(String userID,int commentID) {
		String SQL = "SELECT toID FROM ProfileComment WHERE commentID = ?"; //좋아요 / 싫어요 부정 체크하는거 계속 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userID)) //만약 글쓴이가 페이지 주인이면
					return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return false;
	}

	public int goodAdd(String userID,int commentID) {
		String SQL = "UPDATE ProfileComment SET goodCheck = CONCAT(IFNULL(goodCheck, ''),?,',') WHERE commentID = ?"; //좋아요 / 싫어요 부정 체크하는거 계속 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int goodCountAdd(int commentID) {
		String SQL = "UPDATE ProfileComment SET good = good+1 WHERE commentID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int goodRemove(String userID,int commentID) {
		String SQL = "UPDATE ProfileComment SET goodCheck = REPLACE(goodCheck,'"+userID+",','') WHERE commentID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int goodCountRemove(int commentID) {
		String SQL = "UPDATE ProfileComment SET good = good-1 WHERE commentID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	

	public int badAdd(String userID,int commentID) {
		String SQL = "UPDATE ProfileComment SET badCheck = CONCAT(IFNULL(badCheck, ''),?,',') WHERE commentID = ?"; //좋아요 / 싫어요 부정 체크하는거 계속 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int badCountAdd(int commentID) {
		String SQL = "UPDATE ProfileComment SET bad = bad+1 WHERE commentID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int badRemove(String userID,int commentID) {
		String SQL = "UPDATE ProfileComment SET badCheck = REPLACE(badCheck,'"+userID+",','') WHERE commentID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int badCountRemove(int commentID) {
		String SQL = "UPDATE ProfileComment SET bad = bad-1 WHERE commentID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
}
