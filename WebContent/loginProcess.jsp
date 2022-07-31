<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.sql.*" %>
 
<% request.setCharacterEncoding("UTF-8"); %>

<%
   Class.forName("com.mysql.cj.jdbc.Driver");
   
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   
   try {
      String jdbcDriver = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
      //db가 8.0이상 버전이면 위에 jspdb? 뒤에 적어야 함.
      String dbUser = "root";
      String dbPass = "s25018kdh";
      
    //데이터베이스 커넥션 생성
      conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
      
      String i = request.getParameter("id");
      String p = request.getParameter("pw");
      
      // statement 생성
      stmt = conn.createStatement();
      
      String query = "select * from CN_member where id='" + i + "' and pw='" + p +"'";
      
      //쿼리 실행
      rs = stmt.executeQuery(query);
      
      boolean isLogin = false;
      
      while (rs.next()) {
         isLogin = true;
      }
      
      String id = (String) session.getAttribute("id");
      String password = (String) session.getAttribute("pwd");
      
      session.setAttribute("id", i);
      session.setAttribute("pwd", p);
      
      if (isLogin) {
           response.sendRedirect("index.jsp");
      }
      else if (i.equals("root") && p.equals("manager")) {
         response.sendRedirect("admin/managerLogin.jsp");
      }
      else {
      
%>

   <html>
   <head>
      <title>로그인 실패</title>
      <style>
         #underline {
         display: inline-block;
         border-bottom: 3px solid #FFFFCC;
         box-shadow: inset 0 -10px 0 #FFFFCC;
         font-size: 30px;
         font-weight: bold;
      }
      #login_try {
         border: none;
         font-size: 18px;
         outline: none;
         margin-bottom: 30px;
         margin-top: 20px;
         padding: 5px 5px;
         background-color: rgb(226, 239, 248);
      }
      </style>
   </head>
   <body>
   <header>
         <jsp:include page="top.jsp" flush="false"/>
   </header>
   
   <hr style="color: gray; opacity: 0.5;">
   
   <div align="center" style="padding-top: 30px;">
         <span id="underline">로그인 실패, 다시 로그인 해주세요.</span>
      </div>
      
      <form align="center" method="post" action="login_join.jsp">
         <input id="login_try" type="submit" value="로그인 재시도">
      </form>
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
      %>
      
       <footer>
      <jsp:include page="footer.jsp" flush="false" />
     </footer>
   </body>
   </html>