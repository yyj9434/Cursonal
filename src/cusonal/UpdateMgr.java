package cusonal;

import java.sql.*;
import java.util.Vector;

public class UpdateMgr {
	private DBConnectionMgr pool = null;
	
	public UpdateMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
	}
	
	public boolean updateMember (RegisterBean mem) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			conn = pool.getConnection();
			
			pstmt = conn.prepareStatement("update CN_member set NAME = ? , email = ? , location = ? where id = ?");

			pstmt.setString(1, mem.getUsername());
			pstmt.setString(2, mem.getEmail());
			pstmt.setString(3, mem.getLocation());
			pstmt.setString(4, mem.getId());

			int count = pstmt.executeUpdate();
			
			if(count == 1) {
				flag = true;
			}
			
			} catch (Exception ex) {
				System.out.println("Exception" + ex);
			} finally {
				if(pstmt != null) try { pstmt.close();} catch(SQLException e) {}
				if(conn != null) try { conn.close();} catch (SQLException e) {}
		
			}
			return flag;
		}
	}
