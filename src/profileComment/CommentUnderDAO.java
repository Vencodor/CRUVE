package profileComment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class CommentUnderDAO {
	public int write(CommentUnderDTO commentDTO) {
		String SQL = "INSERT INTO ProfileCommentUnder VALUES ( 0 , ? , ? , ? , now() )";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, commentDTO.getUserID());
			pstmt.setInt(2, commentDTO.getToCommentID());
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
	
	public ArrayList<CommentUnderDTO> getList (int toCommentID) {
		ArrayList<CommentUnderDTO> list = null;
		String SQL = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
				SQL = "SELECT * FROM ProfileCommentUnder WHERE toCommentID = ?";
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1,toCommentID);
			//퍼센트는 LIKE 퍼센트를 넣어야 함
			rs = pstmt.executeQuery();
			list = new ArrayList<CommentUnderDTO>();
			while(rs.next()) {
				CommentUnderDTO commentDTO = new CommentUnderDTO (
						rs.getInt(1),
						rs.getString(2),
						rs.getInt(3),
						rs.getString(4),
						rs.getString(5)
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
		String SQL = "DELETE FROM ProfileCommentUnder WHERE commentID = ?";
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
	
	public boolean isMy(String userID,int commentID) {
		String SQL = "SELECT userID,toCommentID FROM ProfileCommentUnder WHERE commentID = ?"; //좋아요 / 싫어요 부정 체크하는거 계속 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int toCommentID = 0;
		CommentDAO comment = new CommentDAO();
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userID)) //만약 글쓴이가 작성자면
					return true;
				toCommentID = rs.getInt(2);
				if(comment.isMyPage(userID, toCommentID)) {
					return true;
				}
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
	
}
