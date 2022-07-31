<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/designShareView.css">
<link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
<title>Write View</title>
</head>
<body>

<header>
	<jsp:include page="loginSuccessTop.jsp"/>
</header>

<hr style="color: gray; opacity: 0.5;">
<%
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
	String dbUser = "root";
	String dbPass = "s25018kdh";
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try {
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		
		String sql = "select name, title, memo, date from designshare where num = " + idx;
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			String name = rs.getString(1);
			String title = rs.getString(2);
			String memo = rs.getString(3);
			String date = rs.getString(4);
		
%>
<table align="center">
	<tr>
		<td align="center" class="category">글번호</td>
		<td class="contents_size"><%=idx %></td>
	</tr>
	<tr>
		<td align="center" class="category">이름</td>
		<td class="contents_size"><%=name %></td>
	</tr>
	<tr>
		<td align="center" class="category">작성일</td>
		<td class="contents_size"><%=date %></td>
	</tr>
	<tr>
		<td align="center" class="category">제목</td>
		<td class="contents_size"><%=title %></td>
	</tr>
	<tr>
		<td id="memo"><%=memo %></td>
	</tr>
	<tr align="center">
</table>

<%
		}
		rs.close();
		stmt.close();
		conn.close();
	} catch (SQLException e) {
		
	}
%>

<div align="center">
	<input class="btns" type="button" value="글쓰기" OnClick="location='write.jsp'">
	<input class="btns" type="button" value="목록" OnClick="location='designShare.jsp'">
</div>

<footer>
	<jsp:include page="footer.jsp"/>
</footer>

</body>
</html>
