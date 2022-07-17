package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.mail.Session;

import follow.FollowObj;
import util.DatabaseUtil;

public class UserDAO {

	public int userJoin(UserDTO user) {
		String SQL = "INSERT INTO USER VALUES (? , ? , ? , 'Default' , ? , ? , false , '' , '' , ? , '' , '' , '' , '')";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // 특정한 SQL 문장 실행 이후 결과값에서 처리 해주고자 할수있는 클래스
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); //우리가 위에 정의해둔 SQL문장의 형태를 준비 시켜둠
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserID());
			pstmt.setString(3, user.getUserPassword());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserEmailHash());
			pstmt.setString(6, "defult.png");
			return pstmt.executeUpdate(); //업데이트는 입력, 쿼리는 조회할때 사용. 1은 오류, -1은 실패
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1; //실패
	}
	
	public int userLogin(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if( rs.getString(1).equals(userPassword) ) 
					return 1;
				else
					return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1; //실패
	}
	
	public int userClose(String userID) {
		String SQL = "DELETE FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1; //실패
	}
	
	public int userJoinCheckID(String userID) {
		String SQL = "SELECT userID FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return 0;
			}else {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1; //실패
	}
	
	public int userJoinCheckName(String userName) {
		String SQL = "SELECT userName FROM USER WHERE userName = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 0;
			}else {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			}
		return -1; //실패
	}
	
	public ArrayList<String> getUserList(int page) {
		String SQL = "SELECT userID FROM USER ORDER BY userEmailChecked DESC LIMIT 0,"+page;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			ArrayList<String> list = new ArrayList<String>();
			while(rs.next()) {
				list.add(rs.getString(1)); // 이메일 주소 반환
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	public ArrayList<FollowObj> userList(int page,String search) {
		String SQL = "SELECT userID FROM USER WHERE userEmailChecked = true AND userName LIKE ? LIMIT 0,"+page; //여기에 구독 table 조회 추가하기
		String followSQL = "SELECT followID FROM FOLLOW WHERE toID = ? LIMIT 0,"+page;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			
			ArrayList<FollowObj> list = new ArrayList<FollowObj>();
			while(rs.next()) {
				
				PreparedStatement folPstmt = conn.prepareStatement(followSQL);
				folPstmt.setString(1,rs.getString(1));
				ResultSet folRs = folPstmt.executeQuery();
				int size = 0;
				while(folRs.next()) {
					size++;
				}
				
				FollowObj fol = new FollowObj(
					size,
					rs.getString(1)
				);
				
				list.add(fol);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	public String getUserEmail(String userID) {

		String SQL = "SELECT userEmail FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); // 이메일 주소 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}

		return null; // 데이터베이스 오류

	}
	
	public boolean getUserEmailChecked(String userID) {

		String SQL = "SELECT userEmailChecked FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getBoolean(1); // 이메일 주소 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}

		return false; // 데이터베이스 오류

	}
	
	public String getProfileImage(String userID) {
		String SQL = "SELECT profileImage FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch( Exception e) {
			
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	public int setUserEmailChecked(String userID) {
		String SQL = "UPDATE USER SET userEmailChecked = true WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		
		return -1;
	}
	
	public int setProfile(String userID,String name,String shortContent,String Content,String profileImage,String facebook,String twitter,String github,String youtube) {
		String updateSQL=null;
        if(profileImage!=null) updateSQL = "UPDATE USER SET userName=?,profileShortContent=?,profileContent=?,profileImage=?,facebook=?,twitter=?,git=?,youtube=? WHERE userID=?";
        else updateSQL = "UPDATE USER SET userName=?,profileShortContent=?,profileContent=?,facebook=?,twitter=?,git=?,youtube=? WHERE userID=?";
    	Connection conn=null;
        PreparedStatement pstmt=null;

        try {
        	conn = DatabaseUtil.getConnection();
        	pstmt = conn.prepareStatement(updateSQL);
        	
            pstmt.setString(1, name);
            pstmt.setString(2, shortContent);
            pstmt.setString(3, Content);
            
            if(profileImage!=null) {
	            pstmt.setString(4, profileImage);
	            pstmt.setString(5, facebook);
	            pstmt.setString(6, twitter);
	            pstmt.setString(7, github);
	            pstmt.setString(8, youtube);
	            pstmt.setString(9, userID);
            }
            else {
	            pstmt.setString(4, facebook);
	            pstmt.setString(5, twitter);
	            pstmt.setString(6, github);
	            pstmt.setString(7, youtube);
	            pstmt.setString(8, userID);
            }
            
            return pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		
		return -1;
	}
	
	public UserDTO getUser(String userID) {
        String SQL = "SELECT * FROM USER WHERE userID = ?";
    	Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        try {
        	conn = DatabaseUtil.getConnection();
        	pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            
            rs = pstmt.executeQuery();
            
	        if(rs.next()) {
	            UserDTO userDTO = new UserDTO(
	            rs.getString(1),
	            rs.getString(2),
	            rs.getString(3),
	            rs.getString(4),
	            rs.getString(5),
	            rs.getString(6),
	            rs.getString(9),
	            rs.getString(8),
	            rs.getString(10),
	            rs.getBoolean(7),
	            rs.getString(11),
	            rs.getString(12),
	            rs.getString(13),
	            rs.getString(14)
	            );

	            return userDTO;
           }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		
		return null;
	}
	
    public int setProfileImage(String userID, String filePath) {
        // update sql
        String updateSQL = "UPDATE USER SET profileImage = ? WHERE userID= ? ";
    	Connection conn=null;
        PreparedStatement pstmt=null;

        try {
        	conn = DatabaseUtil.getConnection();
        	pstmt = conn.prepareStatement(updateSQL);
        	
            pstmt.setString(1, filePath);
            pstmt.setString(2, userID);

            return pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
        return -1;
    }
    
    public int setProfileContent(String userID, String Content) {
    	String SQL = "UPDATE USER SET profileContent = ? WHERE UserID = ?";
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	try {
    		conn = DatabaseUtil.getConnection();
    		pstmt = conn.prepareStatement(SQL);
    		
    		pstmt.setString(1, Content);
    		pstmt.setString(2, userID);
    		return pstmt.executeUpdate();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
    	return -1;
    }
    
	public String getProfileContent(String userID) {
		String SQL = "SELECT profileContent FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch( Exception e) {
			
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	public String getProfileShortContent(String userID) {
		String SQL = "SELECT profileShortContent FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch( Exception e) {
			
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	public String getUserName(String userID) {
		String SQL = "SELECT userName FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); // 이메일 주소 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	public String getUserIdFromName(String userName) {
		String SQL = "SELECT userID FROM USER WHERE userName = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	public String getUserIdFromPassword(String userPassword) {
		String SQL = "SELECT userID FROM USER WHERE userPassword = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userPassword);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return null;
	}
	
	public boolean getUserEmailOpen(String userID) {
		String SQL = "SELECT isEmailOpen FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getBoolean(1); // 이메일 주소 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}

		return false; // 데이터베이스 오류
	}
	
	public int setUserEmailOpen(String userID,boolean is) {
    	String SQL = "UPDATE USER SET isEmailOpen = ? WHERE UserID = ?";
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	try {
    		conn = DatabaseUtil.getConnection();
    		pstmt = conn.prepareStatement(SQL);
    		
    		pstmt.setBoolean(1, is);
    		pstmt.setString(2, userID);
    		return pstmt.executeUpdate();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
    	return -1;
	}
	
	public String getFacebook(String userID) {

		String SQL = "SELECT facebook FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); // 이메일 주소 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}

		return ""; // 데이터베이스 오류

	}
	
	public String getYoutube(String userID) {

		String SQL = "SELECT youtube FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); // 이메일 주소 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}

		return ""; // 데이터베이스 오류

	}
	
	public String getGithub(String userID) {

		String SQL = "SELECT git FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); // 이메일 주소 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}

		return ""; // 데이터베이스 오류

	}
	
	public String getTwitter(String userID) {

		String SQL = "SELECT twitter FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { //return 이후에 자원해제
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}

		return ""; // 데이터베이스 오류

	}
	
}
