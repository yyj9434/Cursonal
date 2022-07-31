<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
	  <script language="javascript">
		function joinSuccess() {
			alert("회원가입을 축하드립니다!");
		}
		</script>
<% request.setCharacterEncoding("UTF-8"); %>

<%	
	String id = request.getParameter("id");
	String pass = request.getParameter("pw");
	String username = request.getParameter("username");
	String birth = request.getParameter("birth");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String location = request.getParameter("location");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection conn = null;
	Statement pstmt = null;
	
	
	try {
	   String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";

	   String dbUser = "root";
	   String dbPass = "s25018kdh";
	   

	   conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	   pstmt = conn.createStatement();
	   
	  pstmt.executeUpdate("insert into cn_member values ('" + id + "', '" + pass + "', '" + username + "', '" + birth +"' , '" + email +"' , '" + gender + "' , '" + location +"')" );
	  

	} finally {
		  if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
		  if (conn != null) try { conn.close(); } catch (SQLException ex) {}
	}
	
	response.sendRedirect("joinSuccess.jsp");
%>
