
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
	if(session.getAttribute("id") == null) {
		response.sendRedirect("login_join.jsp");
	}else{
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/designShare.css">
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
<title>디자인 공유 게시판</title>
</head>
<body>

<header>
	<jsp:include page="loginSuccessTop.jsp"/>
</header>

<hr style="color: gray; opacity: 0.5;">

<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	int total = 0;
	
	try {
	   String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
	   //db가 8.0이상 버전이면 위에 jspdb? 뒤에 적어야 함.
	   String dbUser = "root";
	   String dbPass = "s25018kdh";
	   
	   //데이터베이스 커넥션 생성
	   conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	   // statement 생성
	   stmt = conn.createStatement();
	   
	   String CountQuery = "select count(*) from jspdb.designshare;";
	   rs = stmt.executeQuery(CountQuery);
	   
	   if(rs.next()) {
		   total = rs.getInt(1);
	   }
	   rs.close();
	     
	   String ListQuery = "select num, title, name, date from jspdb.designshare order by num desc;";
	   rs = stmt.executeQuery(ListQuery);
	
	   //while (rs.next())
%> 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr style="text-align: center; background-color: #f0f6f9; font-weight: bold;">
	<td width="5">번호</td> <td width="379">제목</td> <td width="73">작성자</td> <td width="164">작성일</td>
</tr>
<% 
	if (total == 0)  {
%>

<tr align="center">
	<td colspan="6">등록된 글이 없습니다.</td>
</tr>

<%
	} else {
		while(rs.next()) {
			int num = rs.getInt(1);
			String title = rs.getString(2);
			String name = rs.getString(3);
			String date = rs.getString(4);
%>
<tr align="center">
	<td><%= num %></td>
	<td><a href="designShareView.jsp?idx=<%=num%>"><%= title %></a></td>
	<td><%= name %></td>
	<td><%= date %></td>
</tr>
<%
		}
	}
} catch(SQLException e) {
         out.println(e.getMessage());
         e.printStackTrace();
      } finally {
         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
         if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
         if (conn != null) try { conn.close(); } catch (SQLException ex) {}
      }
%>
</table>


<input type="button" value="글쓰기" OnClick="location='write.jsp'">

<footer>
	<jsp:include page="footer.jsp"/>
</footer>
</body>
</html>
<%
}
%>