<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>

<title>write Process</title>

<%
   request.setCharacterEncoding("UTF-8");
   Class.forName("com.mysql.cj.jdbc.Driver");
   
   Connection conn = null;
   
   String name = request.getParameter("name");
   String ch_pw = request.getParameter("pw");
   String title = request.getParameter("title");
   String memo =request.getParameter("memo");
   
   
   try {
      String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
      //db가 8.0이상 버전이면 위에 jspdb? 뒤에 적어야 함.
      String dbUser = "root";
      String dbPass = "s25018kdh";
      
      conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
      
      String query = "insert into designshare (title, name, memo, ch_pw, date) values (?, ?, ?, ?, now());";
      PreparedStatement pstmt = conn.prepareStatement(query);
      
      pstmt.setString(2, name);
      pstmt.setString(4, ch_pw);
      pstmt.setString(1, title);
      pstmt.setString(3, memo);
      
      pstmt.executeUpdate();
      pstmt.close();
   } catch(SQLException e) {
        out.println(e.getMessage());
        e.printStackTrace();
     }
%>

<script language="javascript">
   self.window.alert("작성되었습니다!");
   location.href="designShare.jsp";
</script>