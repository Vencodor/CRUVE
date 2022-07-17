package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import commodity.CommodityDTO;
import review.ReviewDTO;
import util.DatabaseUtil;

public class ReviewDAO {
	
	public int write(ReviewDTO reviewDTO) {
		String SQL = "INSERT INTO REVIEW VALUES (?,?,?,?,now(),null)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, reviewDTO.getUserID());
			pstmt.setInt(2, reviewDTO.writtenID);
			pstmt.setString(3, reviewDTO.description);
			pstmt.setInt(4, reviewDTO.rate);
			//pstmt.setString(5, reviewDTO.lastDate);
			return pstmt.executeUpdate(); //1은 오류, -1은 실패
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public ArrayList<ReviewDTO> getList(String search,int page,int writtenID) {
		ArrayList<ReviewDTO> reviewList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
			SQL = "SELECT * FROM REVIEW WHERE writtenID=? AND description LIKE ? ORDER BY lastDate DESC LIMIT 0, "+ 0+page;
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); //우리가 위에 정의해둔 SQL문장의 형태를 준비 시켜둠
			pstmt.setString(2, "%"+search+"%");
			pstmt.setInt(1, writtenID);
			//퍼센트는 LIKE 퍼센트를 넣어야 함
			rs = pstmt.executeQuery();
			reviewList = new ArrayList<ReviewDTO>();
			while(rs.next()) {
				ReviewDTO reviewDTO = new ReviewDTO (
						rs.getString(1),
						rs.getInt(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getString(5),
						rs.getInt(6)
				);
				reviewList.add(reviewDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return reviewList;
	}
	
}
