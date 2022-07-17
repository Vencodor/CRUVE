package commodity;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;

import commodity.CommodityDTO;

import util.DatabaseUtil;
import util.ImageBLOB;

public class CommodityDAO {
	
	public int write(CommodityDTO commodityDTO) {
		Encoder base = Base64.getEncoder(); 
		String SQL = "INSERT INTO COMMODITY VALUES (Null , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , 0 , Null , now() , 0 , ? , 0 , Null , Null, false)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, commodityDTO.getWrittenCode());
			pstmt.setString(2, commodityDTO.getUserID());
			pstmt.setString(3, commodityDTO.getTitle());
			pstmt.setString(4, commodityDTO.getSubtitle());
			pstmt.setString(5, commodityDTO.getDescription());
			pstmt.setString(6, commodityDTO.getCategory());
			pstmt.setString(7, commodityDTO.getSubcategory());
			pstmt.setInt(8, commodityDTO.getPrice());
			pstmt.setString(9, commodityDTO.getCoverImage());
			pstmt.setString(10, commodityDTO.getFile());
			pstmt.setString(11, commodityDTO.getBuyerDescription());
			return pstmt.executeUpdate(); //1은 오류, -1은 실패
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int writeUpdate(int WrittenID,String Title,String Content,String SubContent,int price,String coverImage,String buyerDescription,String category,String subcategory,String file) {
		String SQL=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {		
			conn = DatabaseUtil.getConnection();
			if(coverImage!=null&&file!=null) { 
			SQL = "UPDATE COMMODITY SET lastDate=now(),title = ?,subtitle = ?,category=?,subcategory=?,description = ?,price = ?,buyerDescription=?,file=?,coverImage=? WHERE writtenID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(8, file);
			pstmt.setString(9, coverImage);
			pstmt.setInt(10, WrittenID);
			} else if(coverImage==null&&file!=null) {
			SQL = "UPDATE COMMODITY SET lastDate=now(),title = ?,subtitle = ?,category=?,subcategory=?,description = ?,price = ?,buyerDescription=?,file=? WHERE writtenID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(8, file);
			pstmt.setInt(9, WrittenID);
			} else if(coverImage!=null&&file==null) {
			SQL = "UPDATE COMMODITY SET lastDate=now(),title = ?,subtitle = ?,category=?,subcategory=?,description = ?,price = ?,buyerDescription=?coverImage=?, WHERE writtenID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(8, coverImage);
			pstmt.setInt(9, WrittenID);
			}
			pstmt.setString(1, Title);
			pstmt.setString(2, SubContent);
			pstmt.setString(3, category);
			pstmt.setString(4, subcategory);
			pstmt.setString(5, Content);
			pstmt.setInt(6, price);
			pstmt.setString(7, buyerDescription);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int deleteWritten(int writtenID) {
		String SQL = "DELETE FROM COMMODITY WHERE writtenID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, writtenID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int writeSaleUpdate(int saleAmount,String saleStartDate,String saleEndDate,int writtenID) {
		String SQL = "UPDATE COMMODITY SET saleAmount=?,saleStartDate=?,saleEndDate=? WHERE writtenID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, saleAmount);
			pstmt.setString(2, saleStartDate);
			pstmt.setString(3, saleEndDate);
			pstmt.setInt(4, writtenID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int deleteSale(int writtenID) {
		String SQL = "UPDATE COMMODITY SET saleAmount=null,saleStartDate=null,saleEndDate=null,saleActive=false WHERE writtenID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, writtenID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public ArrayList<CommodityDTO> getCategoryList(String type,String search,int page) {
		ArrayList<CommodityDTO> commodityList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
			if(type.equals("최신순")) {
				SQL = "SELECT * FROM COMMODITY WHERE category = ? OR subcategory = ? ORDER BY writtenID DESC LIMIT 0, "+ 0+page;
				}
			else if(type.equals("좋아요순")) {
				SQL = "SELECT * FROM COMMODITY WHERE category = ? OR subcategory = ? ORDER BY likeCount DESC LIMIT 0, "+ 0+page;
				}
			else if(type.equals("가격순")) {
				SQL = "SELECT * FROM COMMODITY WHERE category = ? OR subcategory = ? ORDER BY price ASC LIMIT 0, "+ 0+page;
				}
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			rs = pstmt.executeQuery();
			commodityList = new ArrayList<CommodityDTO>();
			while(rs.next()) {
				CommodityDTO commodity = new CommodityDTO (
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getInt(9),
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12),
						rs.getString(13),
						rs.getString(14),
						rs.getInt(15),
						rs.getString(16),
						rs.getInt(17),
						rs.getString(18),
						rs.getString(19),
						rs.getBoolean(20)
				);
				commodityList.add(commodity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return commodityList;
	}
	
	public ArrayList<CommodityDTO> getList (String type,String search,int page) {
		ArrayList<CommodityDTO> commodityList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
			if(type.equals("최신순")) {
				SQL = "SELECT * FROM COMMODITY WHERE CONCAT(title,subtitle,description) LIKE" +
						" ? ORDER BY writtenID DESC LIMIT 0, "+ 0+page;
				}
			else if(type.equals("좋아요순")) {
				SQL = "SELECT * FROM COMMODITY WHERE CONCAT(title,subtitle,description) LIKE" +
						" ? ORDER BY likeCount DESC LIMIT 0, "+ 0+page;
				}
			else if(type.equals("가격순")) {
				SQL = "SELECT * FROM COMMODITY WHERE CONCAT(title,subtitle,description) LIKE" +
						" ? ORDER BY price ASC LIMIT 0, "+ 0+page;
				}
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); //우리가 위에 정의해둔 SQL문장의 형태를 준비 시켜둠
			pstmt.setString(1, "%"+search+"%");
			//퍼센트는 LIKE 퍼센트를 넣어야 함
			rs = pstmt.executeQuery();
			commodityList = new ArrayList<CommodityDTO>();
			while(rs.next()) {
				CommodityDTO commodity = new CommodityDTO (
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getInt(9),
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12),
						rs.getString(13),
						rs.getString(14),
						rs.getInt(15),
						rs.getString(16),
						rs.getInt(17),
						rs.getString(18),
						rs.getString(19),
						rs.getBoolean(20)
				);
				commodityList.add(commodity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return commodityList;
	}
	
	public ArrayList<CommodityDTO> getUserCommodityList(String userID,int page) {
		ArrayList<CommodityDTO> commodityList = null;
		String SQL = ""; // 물음표엔 아까 가져온 정보가 들어갈것
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
			SQL = "SELECT * FROM COMMODITY WHERE userID = ? ORDER BY writtenID DESC LIMIT 0, "+ 0+page;
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); //우리가 위에 정의해둔 SQL문장의 형태를 준비 시켜둠
			pstmt.setString(1,userID);
			//퍼센트는 LIKE 퍼센트를 넣어야 함
			rs = pstmt.executeQuery();
			commodityList = new ArrayList<CommodityDTO>();
			while(rs.next()) {
				CommodityDTO commodity = new CommodityDTO (
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getInt(9),
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12),
						rs.getString(13),
						rs.getString(14),
						rs.getInt(15),
						rs.getString(16),
						rs.getInt(17),
						rs.getString(18),
						rs.getString(19),
						rs.getBoolean(20)
				);
				commodityList.add(commodity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return commodityList;
	}
	
	public ArrayList<CommodityDTO> getSalesList(String userID) {
		ArrayList<CommodityDTO> commodityList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			try {
			SQL = "SELECT * FROM COMMODITY WHERE userID = ? AND saleAmount IS NOT NULL ORDER BY writtenID DESC";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			commodityList = new ArrayList<CommodityDTO>();
			while(rs.next()) {
				CommodityDTO commodity = new CommodityDTO (
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getInt(9),
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12),
						rs.getString(13),
						rs.getString(14),
						rs.getInt(15),
						rs.getString(16),
						rs.getInt(17),
						rs.getString(18),
						rs.getString(19),
						rs.getBoolean(20)
				);
				commodityList.add(commodity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return commodityList;
	}
	
	public CommodityDTO getWritten(int writtenID) {
		String SQL = ""; // 물음표엔 아까 가져온 정보가 들어갈것
		Connection conn = null;
		PreparedStatement pstmt = null;
		CommodityDTO commodity=null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
			try {
				SQL = "SELECT * FROM COMMODITY WHERE writtenID = ? ORDER BY writtenID";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); //우리가 위에 정의해둔 SQL문장의 형태를 준비 시켜둠
			pstmt.setInt(1, writtenID);
			//퍼센트는 LIKE 퍼센트를 넣어야 함
			rs = pstmt.executeQuery();
			if(rs.next()) {
				commodity = new CommodityDTO (
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getInt(9),
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12),
						rs.getString(13),
						rs.getString(14),
						rs.getInt(15),
						rs.getString(16),
						rs.getInt(17),
						rs.getString(18),
						rs.getString(19),
						rs.getBoolean(20)
				);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return commodity;
	}
	
	public String getUserID(int writtenID) {
		String SQL = "SELECT userID FROM COMMODITY WHERE writtenID = ?"; // 물음표엔 아까 가져온 정보가 들어갈것
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, writtenID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}

		} catch( Exception e ) { e.printStackTrace(); }
		finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		
		
		return null;
	}
	
	public int getWrittenID(String Wcode) {
		String SQL = "SELECT writtenID FROM COMMODITY WHERE writtenCode = ?"; // 물음표엔 아까 가져온 정보가 들어갈것
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, Wcode);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch( Exception e ) { e.printStackTrace(); }
		finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return 0;
	}
	
	public int writtenDelete(int writtenID) {
		String SQL = "DELETE FROM COMMODITY WHERE writtenID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1, writtenID);
			return pstmt.executeUpdate();
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public boolean likeCheck(String userID,int writtenID ) {
		String SQL = ""; // 물음표엔 아까 가져온 정보가 들어갈것
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			SQL = "SELECT * FROM COMMODITY WHERE writtenID = ? AND likeUser LIKE ?";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, writtenID);
			pstmt.setString(2, "%"+userID+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			else
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
	
	public String getTitle(int writtenID ) {
		String SQL = ""; // 물음표엔 아까 가져온 정보가 들어갈것
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			SQL = "SELECT title FROM COMMODITY WHERE writtenID = ?";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, writtenID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
			else
				return null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	public int likeAdd(String userID,int writtenID) {
		String SQL = "UPDATE COMMODITY SET likeUser = CONCAT(IFNULL(likeUser, ''),?,',') WHERE writtenID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, writtenID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int likeCountAdd(int writtenID) {
		String SQL = "UPDATE COMMODITY SET likeCount = likeCount+1 WHERE writtenID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, writtenID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int likeRemove(String userID,int writtenID) {
		String SQL = "UPDATE COMMODITY SET likeUser = REPLACE(likeUser,',"+userID+"','')";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int likeCountRemove(int writtenID) {
		String SQL = "UPDATE COMMODITY SET likeCount = likeCount-1 WHERE writtenID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, writtenID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public int getlikeCount(int writtenID) {
		String SQL = "SELECT likeCount FROM COMMODITY WHERE writtenID = ?"; // 물음표엔 아까 가져온 정보가 들어갈것
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, writtenID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}

		} catch( Exception e ) { e.printStackTrace(); }
		finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public ArrayList<CommodityDTO> getSalesCheck() {
		ArrayList<CommodityDTO> commodityList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			try {
			SQL = "SELECT * FROM COMMODITY WHERE saleAmount IS NOT NULL ORDER BY writtenID DESC";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			commodityList = new ArrayList<CommodityDTO>();
			while(rs.next()) {
				CommodityDTO commodity = new CommodityDTO (
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getInt(9),
						rs.getString(10),
						rs.getString(11),
						rs.getInt(12),
						rs.getString(13),
						rs.getString(14),
						rs.getInt(15),
						rs.getString(16),
						rs.getInt(17),
						rs.getString(18),
						rs.getString(19),
						rs.getBoolean(20)
				);
				commodityList.add(commodity);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return commodityList;
	}
	
	public int setSaleActive(int writtenID,boolean active) {
		String SQL = "UPDATE COMMODITY SET saleActive = ? WHERE writtenID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setBoolean(1, active);
			pstmt.setInt(2, writtenID);
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
