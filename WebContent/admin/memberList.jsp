<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<jsp:useBean id="regBean" class="cusonal.RegisterBean" />
<jsp:useBean id="DBConnection" class="cusonal.DBConnectionMgr" />

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../css/memberList.css">
    <link rel="stylesheet" href="../css/top.css">
 <link rel="stylesheet" href="../css/section.css">
  <link rel="stylesheet" href="../css/nav.css">
    <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
    <script language="JavaScript" src="../script.js"></script>

<title>회원 목록</title>
</head>
<body>
<header id="p_header">
   <jsp:include page="managerTop.jsp" flush="false"/>
</header> 

<hr style="color: gray; opacity:0.5;">

<table class="table" style="margin-left: auto; margin-right: auto;">
    <caption>회원 정보</caption>
    <tr><th style="width: 400px;">아이디</th><th style="width: 500px;">비밀번호</th><th style="width: 100px;">이름</th><th style="width: 15px;">생년월일</th><th>이메일</th><th style="width: 10px;">성별</th><th>거주지역</th><th style="width: 300px;">수정하기</th></tr>
   <%
   	  DBConnection.getInstance();
   
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      conn= DBConnection.getConnection();
      
      try {
         
         String query = "select * from CN_member order by id";
         
         // statement 생성
         stmt = conn.createStatement();
         //쿼리 실행
         rs = stmt.executeQuery(query);
  
         while (rs.next()) {
 %>     
         <tr align="center">
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("pw") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("birth") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("gender") %></td>         
            <td><%= rs.getString("location") %></td>    
            <td><a href="javascript:Update('<%=regBean.getId()%>')">수정하기</a></td> 
 <%  

         }
      } catch(SQLException e) {
         out.println(e.getMessage());
         e.printStackTrace();
      } finally {
         if (rs != null) try { rs.close(); } catch(SQLException ex) {}
         if (stmt != null) try { stmt.close(); } catch (SQLException ex) {}
         if (conn != null) try { conn.close(); } catch (SQLException ex) {}
      }
 %></table>
 <footer>
   <jsp:include page="../footer.jsp" flush="false" />
</footer>
   <form name="update" method="post" action="adminUpdate.jsp">
   <input type=hidden name="id">
</body>
</html>