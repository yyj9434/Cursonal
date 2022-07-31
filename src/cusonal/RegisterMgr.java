package cusonal;

import java.sql.*;
import java.util.Vector;

public class RegisterMgr {
	
	private DBConnectionMgr pool = null;
	
	public RegisterMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
	}
	
	public RegisterBean getMemberList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RegisterBean regBean = null;
		try { 
			conn = pool.getConnection();
			String strQuery = "select * from cn_member";
			pstmt = conn.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				regBean = new RegisterBean();
				regBean.setId(rs.getString("id"));
				regBean.setPw(rs.getString("pw"));
				regBean.setUsername(rs.getString("username"));
				regBean.setEmail(rs.getString("email"));
				regBean.setGender(rs.getString("gender"));
				regBean.setLocation(rs.getString("location"));
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return regBean;
	}
	
	public boolean insertMember (RegisterBean mem) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			conn = pool.getConnection();
			
			pstmt = conn.prepareStatement("insert into cn_member values(?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getPw());
			pstmt.setString(3, mem.getUsername());
			pstmt.setString(4, mem.getBirth());
			pstmt.setString(5, mem.getEmail());
			pstmt.setString(6, mem.getGender());
			pstmt.setString(7, mem.getLocation());

			int count = pstmt.executeUpdate();
			
			if(count == 1) {
				flag = true;
			}
			
			} catch (Exception ex) {
				System.out.println("Exception" + ex);
			} finally {
				if(rs != null) try { rs.close();} catch (SQLException e) {}
				if(pstmt != null) try { pstmt.close();} catch(SQLException e) {}
				if(conn != null) try { conn.close();} catch (SQLException e) {}
		
			}
			return flag;
		}
	}
