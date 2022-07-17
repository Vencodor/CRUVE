package edit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import commodity.CommodityDTO;
import util.DatabaseUtil;

public class EditListDAO {
	public int write(EditListDTO editListDTO,CommodityDTO before) {
		String SQL = "INSERT INTO EDITLIST VALUES (? , ? , ? , ? , ? , ? , ? , ? , ? , ? , now())";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, editListDTO.getWrittenID());
			pstmt.setString(2, editListDTO.getEditTitle());
			pstmt.setString(3, before.getTitle()+" -> "+editListDTO.getTitle());
			pstmt.setString(4, before.getSubtitle()+" -> "+editListDTO.getSubtitle());
			pstmt.setString(5, before.getDescription()+" -> "+editListDTO.getDescription());
			pstmt.setString(6, before.getCategory()+" -> "+editListDTO.getCategory());
			pstmt.setString(7, before.getSubcategory()+" -> "+editListDTO.getSubcategory());
			pstmt.setInt(8, editListDTO.getPrice());
			pstmt.setString(9, before.getCoverImage()+" -> "+editListDTO.getCoverImage());
			pstmt.setString(10, before.getFile()+" -> "+editListDTO.getFile());
			//pstmt.setString(11, editListDTO.getEditDate());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -1;
	}
	
	public ArrayList<EditListDTO> getList (int writtenID,int page) {
		ArrayList<EditListDTO> editList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // Ư���� SQL ���� ���� ���� ��������� ó�� ���ְ��� �Ҽ��ִ� Ŭ����
			try {
				SQL = "SELECT * FROM EDITLIST WHERE writtenID = ? ORDER BY editDate DESC LIMIT 0,"+page;
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); //�츮�� ���� �����ص� SQL������ ���¸� �غ� ���ѵ�
			pstmt.setInt(1,writtenID);
			//�ۼ�Ʈ�� LIKE �ۼ�Ʈ�� �־�� ��
			rs = pstmt.executeQuery();
			editList = new ArrayList<EditListDTO>();
			while(rs.next()) {
				EditListDTO list = new EditListDTO (
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getInt(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11)
				);
				editList.add(list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return editList;
	}
}
