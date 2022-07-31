<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
   request.setCharacterEncoding("utf-8");

   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   String name = request.getParameter("username");
   String birth = request.getParameter("birth");
   String email = request.getParameter("email");
   String location = request.getParameter("location");
   
   int updateCount = 0;
   Class.forName("com.mysql.cj.jdbc.Driver");
   
   Connection conn = null;
   Statement stmt = null;
   try {
      String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
      String dbUser = "root";
      String dbPass = "s25018kdh";
      
      String query = "update CN_member set id = '" + id + "', pw = '" + pw + "', birth = '" + birth + "', email = '" + email +"', location = '" + location + "'" + "where name = '" + name + "'";
      
      conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
      stmt = conn.createStatement();
      updateCount = stmt.executeUpdate(query);
   } finally {
      if (stmt != null ) try { stmt.close(); } catch(SQLException ex) {}
      if (conn != null ) try { conn.close(); } catch(SQLException ex) {}
   }   
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 완료</title>
<link rel="stylesheet" href="css/update.css">
</head>
<body>

<header style="padding-bottom: 50px;">
   <jsp:include page="managerTop.jsp" flush="false"/>
   
</header>

<hr style="color: gray; opacity: 0.5;">

<div id="content" align="center">
   <h1><span id="underline">회원정보 수정이 완료되었습니다.</span></h1>
</div>

<footer>
   <jsp:include page="../footer.jsp" flush="false"/>
</footer>
</body>
</html>